package com.xnkfz.tinynote.controller.admin;

import com.xnkfz.tinynote.common.Ajax;
import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.dto.GetPostRes;
import com.xnkfz.tinynote.controller.admin.dto.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.dto.SavePostReq;
import com.xnkfz.tinynote.service.IContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@RestController
@RequestMapping("/admin/content")
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
    @DeleteMapping("remove-batch-post")
    public Ajax removeBatchPost(@RequestBody List<Integer> ids) {
        contentService.removeBatchPost(ids);
        return Ajax.success();
    }

    @GetMapping("get-post")
    public Ajax getPost(Integer id) {
        GetPostRes res = contentService.getPost(id);
        return Ajax.success(res);
    }

}
