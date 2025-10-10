package com.xnkfz.tinynote.controller.theme;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.HashMap;

public abstract class CommonController {
    @ModelAttribute
    public void addCommonModel(Model model) {
        HashMap<Object, Object> meta = new HashMap<>();
        // 核心SEO标签
        meta.put("keywords", "Java,编程,Spring Boot");
        meta.put("description", "技术博客分享编程经验");
        meta.put("robots", "index,follow");

        model.addAttribute("meta", meta);

    }
}
