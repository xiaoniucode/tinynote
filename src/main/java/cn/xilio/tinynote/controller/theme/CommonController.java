package cn.xilio.tinynote.controller.theme;

import cn.xilio.tinynote.domain.MetaContentCount;
import cn.xilio.tinynote.domain.MetaType;
import cn.xilio.tinynote.service.IConfigService;
import cn.xilio.tinynote.service.IMetaService;
import cn.xilio.tinynote.service.IUserService;
import cn.xilio.tinynote.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;
import java.util.Map;

/**
 * @author www.xilio.cn
 */
public abstract class CommonController {
    @Autowired
    private IConfigService configService;
    @Autowired
    private IMetaService metaService;
    private IUserService userService;
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
