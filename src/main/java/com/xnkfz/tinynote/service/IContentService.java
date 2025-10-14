package com.xnkfz.tinynote.service;

import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.dto.GetPostRes;
import com.xnkfz.tinynote.controller.admin.dto.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.dto.SavePostReq;
import com.xnkfz.tinynote.controller.theme.dto.PostDetailRes;
import com.xnkfz.tinynote.controller.theme.dto.QueryPostViewReq;
import com.xnkfz.tinynote.domain.Content;
import com.xnkfz.tinynote.domain.ContentStatus;

import java.util.List;

/**
 * <p>
 * 内容管理服务接口
 * </p>
 *
 * @author www.xilio.cn
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
    PageResult<Content> queryPage(QueryPostReq queryPostReq);

    /**
     * 获取文章详情
     *
     * @param id ID
     * @return 文章详细信息
     */
    GetPostRes getPost(Integer id);

    /**
     * 【站点使用】分页查询文章列表
     *
     * @param req 请求参数
     * @return 文章分页结果
     */
    PageResult<PostDetailRes> findPageListView(QueryPostViewReq req);

    /**
     * 查询文章详情【前端】 (未登录用户需要添加添加：status:1 draft:0)
     *
     * @param id 编号
     * @return 内容
     */
    PostDetailRes getPostDetail(Integer id);

    /**
     * 批量标记内容的状态
     *
     * @param ids 需要设置的ID列表
     */
    void markContentStatus(List<Integer> ids, ContentStatus status);

    /**
     * 批量删除文章
     *
     * @param ids 需要删除的文章ID
     */
    void batchDeletePost(List<Integer> ids);
}
