package com.xnkfz.tinynote.service;

import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.req.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.req.SavePostReq;
import com.xnkfz.tinynote.entity.Content;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
public interface IContentService  {
    /**
     * 保存文章
     *
     * @param savePostReq 文章数据
     */
    Integer savePost(SavePostReq savePostReq);

    /**
     * 分页查询文章
     *
     * @param queryPostReq 请求参数
     * @return 分页结果
     */
    PageResult queryPage(QueryPostReq queryPostReq);
}
