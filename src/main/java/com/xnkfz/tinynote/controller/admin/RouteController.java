package com.xnkfz.tinynote.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class RouteController {
    @GetMapping("/dashboard")
    public String dashboard() {
        return "admin/dashboard";
    }

    @GetMapping("/posts")
    public String posts() {
        return "admin/posts";
    }

    @GetMapping("/write-post")
    public String writePost() {
        return "/admin/write-post";
    }

    @GetMapping("/config-base")
    public String configBase() {
        return "/admin/config-base";
    }
}
