package com.xnkfz.tinynote.controller.admin;

import com.xnkfz.tinynote.common.Ajax;
import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.dto.GetPostRes;
import com.xnkfz.tinynote.controller.admin.dto.QueryPostReq;
import com.xnkfz.tinynote.controller.admin.dto.SavePostReq;
import com.xnkfz.tinynote.entity.Content;
import com.xnkfz.tinynote.service.IContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
        PageResult<Content> res = contentService.queryPage(queryPostReq);
        return Ajax.success(res);
    }

    @DeleteMapping("remove-batch-post")
    public Ajax removeBatchPost(@RequestBody List<Integer> ids) {
        contentService.removeBatchPost(ids);
        return Ajax.success();
    }

    @GetMapping("/post/search2")
    public Ajax queryPost(
                          @RequestParam(defaultValue = "1") Long page,
                          @RequestParam(defaultValue = "10") Long limit,
                          @RequestParam(required = false) String title,
                          @RequestParam(required = false) Integer status,
                          @RequestParam(required = false) Integer draft) {
        QueryPostReq req = new QueryPostReq();
        req.setCurrent(page);
        req.setSize(limit);
        req.setTitle(title);
        req.setStatus(status);
        req.setDraft(draft);
        PageResult<Content> res = contentService.queryPage(req);
        return Ajax.success(res.getRecords()).put("count", res.getTotal());
    }

    @GetMapping("get-post")
    public Ajax getPost(Integer id) {
        return Ajax.success(contentService.getPost(id));
    }

}
