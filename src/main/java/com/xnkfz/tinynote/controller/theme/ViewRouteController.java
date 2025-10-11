package com.xnkfz.tinynote.controller.theme;

import com.xnkfz.tinynote.common.PageResult;
import com.xnkfz.tinynote.controller.theme.dto.PostDetailRes;
import com.xnkfz.tinynote.controller.theme.dto.QueryPostViewReq;
import com.xnkfz.tinynote.service.IConfigService;
import com.xnkfz.tinynote.service.IContentService;
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
    @Autowired
    private IContentService contentService;

    @GetMapping("/")
    public String index(Model mv) {
        addCommonModel(mv);
        QueryPostViewReq req = new QueryPostViewReq();
        req.setCurrent(1);
        req.setSize(30);
        PageResult res = contentService.findPageListView(req);
        mv.addAttribute("postRes", res);
        return "themes/index";
    }

    @GetMapping("post/{id}")
    public String post(Model mv, @PathVariable Integer id) {
        addCommonModel(mv);
        PostDetailRes res = contentService.getPostDetail(id);
        mv.addAttribute("post", res);
        return "themes/post";
    }

    @GetMapping("tag/{name}")
    public String tag(Model model, @PathVariable String name) {
        addCommonModel(model);

        return "themes/tag";
    }

}
