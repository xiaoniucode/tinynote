package com.xnkfz.tinynote.controller.theme;

import com.xnkfz.tinynote.service.IConfigService;
import com.xnkfz.tinynote.service.IContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 晓牛开发者
 */
public abstract class CommonController {
    @Autowired
    private IConfigService configService;

    @ModelAttribute
    public void addCommonModel(Model model) {
        Map<String, Object> config = configService.getConfigAsMap();
        model.addAttribute("meta", config);
    }
}
