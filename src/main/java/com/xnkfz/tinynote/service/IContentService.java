package com.xnkfz.tinynote.service;

import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.req.GetPostRes;
import com.xnkfz.tinynote.controller.admin.req.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.req.SavePostReq;
import com.xnkfz.tinynote.entity.Content;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
public interface IContentService {
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

    /**
     * 批量删除文章
     *
     * @param ids 文章ID列表
     */
    void removeBatchPost(List<Integer> ids);

    /**
     * 获取文章详情
     * @param id ID
     * @return 文章详细信息
     */
    GetPostRes getPost(Integer id);
}
