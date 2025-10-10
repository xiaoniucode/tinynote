package com.xnkfz.tinynote.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.req.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.req.SavePostReq;
import com.xnkfz.tinynote.entity.Content;
import com.xnkfz.tinynote.mapper.ContentMapper;
import com.xnkfz.tinynote.service.IContentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

    @Override
    public Integer savePost(SavePostReq savePostReq) {
        return 1111;
    }

    @Override
    public PageResult queryPage(QueryPostReq req) {

        Page<Content> pageVo = Page.of(req.getCurrent(), req.getSize());
        return null;
    }
}
