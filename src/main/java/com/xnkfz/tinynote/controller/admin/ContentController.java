package com.xnkfz.tinynote.controller.admin;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xnkfz.tinynote.common.Ajax;
import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.req.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.req.SavePostReq;
import com.xnkfz.tinynote.entity.Content;
import com.xnkfz.tinynote.service.IContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@RestController
@RequestMapping("/content")
public class ContentController {
    @Autowired
    private IContentService contentService;

    @PostMapping("save-post")
    public Ajax savePost(@RequestBody SavePostReq savePostReq) {
        Integer id = contentService.savePost(savePostReq);
        return Ajax.success(id);
    }

    @PostMapping("query-post")
    public Ajax queryPost(@RequestBody QueryPostReq queryPostReq) {
        PageResult res = contentService.queryPage(queryPostReq);
        return Ajax.success(res);
    }

}
