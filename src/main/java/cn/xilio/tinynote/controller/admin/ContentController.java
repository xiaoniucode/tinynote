package cn.xilio.tinynote.controller.admin;

import cn.xilio.tinynote.common.Ajax;
import cn.xilio.tinynote.common.PageResult;
import cn.xilio.tinynote.controller.admin.dto.GetPostRes;
import cn.xilio.tinynote.controller.admin.dto.MarkStatusReq;
import cn.xilio.tinynote.controller.admin.dto.QueryPostReq;
import cn.xilio.tinynote.controller.admin.dto.SavePostReq;
import cn.xilio.tinynote.domain.Content;
import cn.xilio.tinynote.domain.ContentStatus;
import cn.xilio.tinynote.service.IContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Controller
@RequestMapping("/admin/content")
public class ContentController {
    @Autowired
    private IContentService contentService;

    @ResponseBody
    @PostMapping(value = "save-post", name = "保存文章")
    public Ajax savePost(@RequestBody SavePostReq savePostReq) {
        Integer id = contentService.savePost(savePostReq);
        return Ajax.success(id);
    }

    @ResponseBody
    @DeleteMapping(value = "batch-delete-post", name = "批量删除文章")
    public Ajax batchDeletePost(@RequestBody List<Integer> ids) {
        contentService.batchDeletePost(ids);
        return Ajax.success();
    }

    @ResponseBody
    @PutMapping(value = "mark-post-status", name = "批量标记文章状态")
    public Ajax markContentStatus(@RequestBody MarkStatusReq req) {
        contentService.markContentStatus(req.getIds(), ContentStatus.fromStatus(req.getStatus()));
        return Ajax.success();
    }

    @ResponseBody
    @GetMapping(value = "search", name = "分页条件查询文章列表")
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

    /*----------------------------------------视图-------------------------------------------------*/
    @ResponseBody
    @GetMapping("get-post")
    public Ajax getPost(Integer id) {
        return Ajax.success(contentService.getPost(id));
    }

    @GetMapping("posts")
    public String posts(Model model) {
        QueryPostReq req = new QueryPostReq();
        req.setCurrent(1L);
        req.setSize(15L);
        PageResult<Content> res = contentService.queryPage(req);
        model.addAttribute("posts", res);
        return "admin/posts";
    }

    @GetMapping("write-post")
    public String writePost() {
        return "/admin/write-post";
    }

    @GetMapping("write-post/{id}")
    public String updatePost(Model model, @PathVariable("id") Integer id) {
        GetPostRes post = contentService.getPost(id);
        model.addAttribute("post", post);
        return "/admin/write-post";
    }
}
