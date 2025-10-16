package cn.xilio.tinynote.controller.theme;

import cn.xilio.tinynote.common.PageResult;
import cn.xilio.tinynote.controller.theme.dto.PostDetailRes;
import cn.xilio.tinynote.controller.theme.dto.QueryPostViewReq;
import cn.xilio.tinynote.service.IContentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author www.xilio.cn
 */
@Slf4j
@RequestMapping("/")
@Controller
public class SiteController extends CommonController {
    @Autowired
    private IContentService contentService;
    @GetMapping("/")
    public String index(Model mv,
                        @RequestParam(defaultValue = "1", required = false) Long current,
                        @RequestParam(defaultValue = "5", required = false) Long size,
                        @RequestParam(required = false) String title) {
        addCommonModel(mv);
        addTagPostCountModel(mv);
        QueryPostViewReq req = new QueryPostViewReq();
        req.setCurrent(current);
        req.setSize(size);
        req.setTitle(title);
        PageResult<PostDetailRes> res = contentService.findPageListView(req);
        mv.addAttribute("postRes", res);
        return "themes/default/index";
    }

    @GetMapping("post/{id}")
    public String post(Model mv, @PathVariable Integer id) {
        addCommonModel(mv);
        PostDetailRes res = contentService.getPostDetail(id);
        mv.addAttribute("post", res);
        return "themes/default/post";
    }
}
