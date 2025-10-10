package com.xnkfz.tinynote.controller.theme;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

/**
 * @author 晓牛开发者：xnkfz.com
 */
@Slf4j
@RequestMapping("/")
@Controller
public class ViewRouteController extends CommonController {
    @GetMapping("/")
    public String index(Model mv) {
        addCommonModel(mv);
     //   mv.addAttribute("posts", posts);
        return "themes/index";
    }
    @GetMapping("post/{id}")
    public String post(Model mv, @PathVariable Integer id) {
        addCommonModel(mv);
        HashMap<String, Object> post = new HashMap<>();
        post.put("id", id);
        post.put("title", "blog");
        post.put("content", "hello world\nhello world \n#替换我的文章\n\nhellow orl");
        mv.addAttribute("post", post);
        return "themes/post";
    }
    @GetMapping("tag/{name}")
    public String tag(Model model, @PathVariable String name) {
        addCommonModel(model);

        return "themes/tag";
    }

}
