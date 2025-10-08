package com.xnkfz.neatink;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/")
@Controller
public class IndexController {
    @GetMapping("/index")
    public String index(Model mv){
        mv.addAttribute("title","xnkfz");
        return "index";
    }
}
