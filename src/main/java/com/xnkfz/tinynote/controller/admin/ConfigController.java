package com.xnkfz.tinynote.controller.admin;

import com.xnkfz.tinynote.service.IConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@Controller
@RequestMapping("/admin/config/")
public class ConfigController {
    @Autowired
    private IConfigService configService;

    @GetMapping("base-config")
    public String baseConfigView(Model model) {
        Map<String, Object> baseConfig = configService.getConfigAsMap();
        model.addAttribute("baseConfig", baseConfig);
        return "/admin/base-config";
    }

}
