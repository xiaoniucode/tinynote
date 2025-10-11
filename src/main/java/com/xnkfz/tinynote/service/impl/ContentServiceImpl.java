package com.xnkfz.tinynote.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xnkfz.tinynote.common.BizException;
import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.dto.GetPostRes;
import com.xnkfz.tinynote.controller.admin.dto.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.dto.SavePostReq;
import com.xnkfz.tinynote.controller.theme.dto.PostDetailRes;
import com.xnkfz.tinynote.controller.theme.dto.QueryPostViewReq;
import com.xnkfz.tinynote.entity.Content;
import com.xnkfz.tinynote.entity.ContentStatus;
import com.xnkfz.tinynote.entity.Meta;
import com.xnkfz.tinynote.entity.MetaType;
import com.xnkfz.tinynote.mapper.ContentMapper;
import com.xnkfz.tinynote.mapper.MetaMapper;
import com.xnkfz.tinynote.service.IContentService;
import com.xnkfz.tinynote.service.IMetaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@Service
public class ContentServiceImpl implements IContentService {
    @Autowired
    private MetaMapper metaMapper;
    @Autowired
    private ContentMapper contentMapper;
    @Autowired
    private IMetaService metaService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer savePost(SavePostReq req) {
        Integer uid = 0;
        //有ID则更新文章
        if (!ObjectUtils.isEmpty(req.getId())) {
            Content content = contentMapper.selectById(req.getId());
            if (ObjectUtils.isEmpty(content)) {
                throw new BizException("文章不存在或已经被删除");
            }
            content.setTitle(req.getTitle());
            content.setText(req.getContent());
            content.setUid(uid);
            content.setDraft(req.getDraft());
            content.setStatus(req.getStatus());
            content.setSummary(generateSummary(req.getContent()));
            content.setCreatedAt(req.getPublishAt());
            content.setUpdatedAt(req.getPublishAt());
            //删掉之前所有关联的标签
            metaMapper.clearContentMetaRelation(req.getId());
            //如果标签不存在则创建
            List<Integer> tagIds = metaService.createMetaIfNotExist(req.getTags(), MetaType.TAG);
            contentMapper.updateById(content);
            //建立文章和标签的关联
            if (!CollectionUtils.isEmpty(tagIds)) {
                contentMapper.relationContentMeta(content.getId(), tagIds);
            }
            return content.getId();
        } else {
            //创建文章
            Content content = new Content();
            content.setTitle(req.getTitle());
            content.setText(req.getContent());
            content.setUid(uid);
            content.setDraft(req.getDraft());
            content.setStatus(req.getStatus());
            content.setSummary(generateSummary(req.getContent()));
            content.setCreatedAt(req.getPublishAt());
            content.setUpdatedAt(req.getPublishAt());
            //如果标签不存在则创建
            List<Integer> tagIds = metaService.createMetaIfNotExist(req.getTags(), MetaType.TAG);
            contentMapper.insert(content);
            //建立文章和标签的关联
            if (!CollectionUtils.isEmpty(tagIds)) {
                contentMapper.relationContentMeta(content.getId(), tagIds);
            }
            return content.getId();
        }
    }

    public String generateSummary(String text) {
        if (StringUtils.hasText(text)) {
            return text.trim().length() > 150 ? text.trim().substring(0, 150) : text;
        }
        return "";
    }

    @Override
    public PageResult<Content> queryPage(QueryPostReq req) {
        Page<Content> pageVo = Page.of(req.getCurrent(), req.getSize());
        LambdaQueryWrapper<Content> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.hasText(req.getTitle())) {
            wrapper.like(Content::getTitle, req.getTitle());
        }
        if (!ObjectUtils.isEmpty(req.getDraft())) {
            wrapper.eq(Content::getDraft, 1);
        }
        if (!ObjectUtils.isEmpty(req.getStatus())) {
            wrapper.eq(Content::getStatus, req.getStatus());
        }
        Page<Content> contentPage = contentMapper.selectPage(pageVo, wrapper);
        return PageResult.of(contentPage);
    }

    @Override
    public void removeBatchPost(List<Integer> ids) {

    }

    @Override
    public GetPostRes getPost(Integer id) {
        Content content = contentMapper.selectById(id);
        if (ObjectUtils.isEmpty(content)) {
            return null;
        }
        List<Meta> tags = metaService.findMetaByContentId(id, MetaType.TAG);
        List<String> tagList = tags.stream().map(Meta::getName).collect(Collectors.toList());
        GetPostRes res = new GetPostRes();
        res.setId(content.getId());
        res.setTitle(content.getTitle());
        res.setContent(content.getText());
        res.setTags(tagList);
        res.setPublishAt(content.getCreatedAt());
        res.setStatus(content.getStatus());
        return res;
    }

    @Override
    public PageResult findPageListView(QueryPostViewReq req) {
        PageResult result = new PageResult();
        return result;
    }

    @Override
    public PostDetailRes getPostDetail(Integer id) {
        PostDetailRes res = new PostDetailRes();
        LambdaQueryWrapper<Content> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Content::getId, id);
        boolean isLogin=true;
        if (!isLogin) {
            wrapper.eq(Content::getDraft, 0);
            wrapper.eq(Content::getStatus, 1);
        }
        //文章内容
        Content content = contentMapper.selectOne(wrapper);
        if (ObjectUtils.isEmpty(content)) {
            throw new BizException("文章不存在或已删除");
        }
        //标签
        List<Meta> tags = metaService.findMetaByContentId(content.getId(), MetaType.TAG);
        res.setId(content.getId());
        res.setTitle(content.getTitle());
        res.setContent(content.getText());
        res.setPublishAt(content.getCreatedAt().toString());
        res.setTags(tags);
        return res;
    }
}
