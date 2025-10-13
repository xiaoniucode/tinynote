package com.xnkfz.tinynote.controller.theme;

import com.xnkfz.tinynote.domain.MetaContentCount;
import com.xnkfz.tinynote.domain.MetaType;
import com.xnkfz.tinynote.service.IConfigService;
import com.xnkfz.tinynote.service.IMetaService;
import com.xnkfz.tinynote.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;
import java.util.Map;

/**
 * @author 晓牛开发者
 */
public abstract class CommonController {
    @Autowired
    private IConfigService configService;
    @Autowired
    private IMetaService metaService;

    @ModelAttribute
    public void addCommonModel(Model model) {
        Map<String, Object> config = configService.getConfigAsMap();
        model.addAttribute("meta", config);
        model.addAttribute("isLogin", SecurityUtils.isLogin());
    }
    @ModelAttribute
    public void addTagPostCountModel(Model model) {
        List<MetaContentCount> list = metaService.metaContentCount(MetaType.TAG);
        model.addAttribute("tagRes", list);
    }
}
