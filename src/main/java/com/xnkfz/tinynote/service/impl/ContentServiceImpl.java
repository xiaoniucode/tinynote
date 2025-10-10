package com.xnkfz.tinynote.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xnkfz.tinynote.common.BizException;
import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.req.GetPostRes;
import com.xnkfz.tinynote.controller.admin.req.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.req.SavePostReq;
import com.xnkfz.tinynote.entity.Content;
import com.xnkfz.tinynote.entity.MetaType;
import com.xnkfz.tinynote.mapper.ContentMapper;
import com.xnkfz.tinynote.mapper.MetaMapper;
import com.xnkfz.tinynote.service.IContentService;
import com.xnkfz.tinynote.service.IMetaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.util.List;

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
            content.setSummary(generateSummary(req.getContent()));
            content.setCreatedAt(req.getPublishAt());
            content.setUpdatedAt(req.getPublishAt());
            //删掉之前所有关联的标签
            metaMapper.clearContentMetaRelation(req.getId());
            //如果标签不存在则创建
            List<Integer> tagIds = metaService.createMetaIfNotExist(req.getTags(), MetaType.TAG);
            contentMapper.updateById(content);
            //建立文章和标签的关联
            contentMapper.relationContentMeta(content.getId(), tagIds);
            return content.getId();
        } else {
            //创建文章
            Content content = new Content();
            content.setTitle(req.getTitle());
            content.setText(req.getContent());
            content.setUid(uid);
            content.setSummary(generateSummary(req.getContent()));
            content.setCreatedAt(req.getPublishAt());
            content.setUpdatedAt(req.getPublishAt());
            //如果标签不存在则创建
            List<Integer> tagIds = metaService.createMetaIfNotExist(req.getTags(), MetaType.TAG);
            contentMapper.insert(content);
            //建立文章和标签的关联
            contentMapper.relationContentMeta(content.getId(), tagIds);
            return content.getId();
        }
    }

    public String generateSummary(String text) {
        if (StringUtils.hasText(text)) {
            return text.trim().length() > 150 ? text.trim().substring(0, 150) :text;
        }
        return "";
    }

    @Override
    public PageResult queryPage(QueryPostReq req) {

        Page<Content> pageVo = Page.of(req.getCurrent(), req.getSize());
        return null;
    }

    @Override
    public void removeBatchPost(List<Integer> ids) {

    }

    @Override
    public GetPostRes getPost(Integer id) {
        return null;
    }
}
