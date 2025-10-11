package com.xnkfz.tinynote.controller.admin;

import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.admin.dto.GetPostRes;
import com.xnkfz.tinynote.controller.admin.dto.QueryPostReq;
import com.xnkfz.tinynote.entity.Content;
import com.xnkfz.tinynote.service.IContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/admin")
@Controller
public class RouteController {
    @Autowired
    private IContentService contentService;

    @GetMapping("/dashboard")
    public String dashboard() {
        return "admin/dashboard";
    }

    @GetMapping("/posts")
    public String posts(Model model) {
        QueryPostReq req = new QueryPostReq();
        req.setCurrent(1L);
        req.setSize(15L);
        PageResult<Content> res = contentService.queryPage(req);
        model.addAttribute("posts", res);
        return "admin/posts";
    }

    @GetMapping("/post/search")
    public String queryPost(Model model, @RequestParam(defaultValue = "1") Long current,
                            @RequestParam(defaultValue = "15") Long size,
                            @RequestParam(required = false) String title,
                            @RequestParam(required = false) Integer status,
    @RequestParam(required = false)Integer draft) {
        QueryPostReq req = new QueryPostReq();
        req.setCurrent(current);
        req.setSize(size);
        req.setTitle(title);
        req.setStatus(status);
        req.setDraft(draft);
        PageResult<Content> res = contentService.queryPage(req);
        model.addAttribute("posts", res);
        return "admin/posts";
    }

    @GetMapping("/write-post")
    public String writePost() {
        return "/admin/write-post";
    }

    @GetMapping("/write-post/{id}")
    public String updatePost(Model model, @PathVariable("id") Integer id) {
        GetPostRes post = contentService.getPost(id);
        model.addAttribute("post", post);
        return "/admin/write-post";
    }

    @GetMapping("/config-base")
    public String configBase() {
        return "/admin/config-base";
    }
}
