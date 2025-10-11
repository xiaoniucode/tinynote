package com.xnkfz.tinynote.controller.theme;

import com.xnkfz.tinynote.entity.MetaContentCount;
import com.xnkfz.tinynote.entity.MetaType;
import com.xnkfz.tinynote.service.IConfigService;
import com.xnkfz.tinynote.service.IMetaService;
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
    }
    @ModelAttribute
    public void addTagPostCountModel(Model model) {
        List<MetaContentCount> list = metaService.metaContentCount(MetaType.TAG);
        model.addAttribute("tagRes", list);
    }
}
