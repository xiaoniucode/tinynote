package com.xnkfz.tinynote.controller.admin;

import com.xnkfz.tinynote.common.Ajax;
import com.xnkfz.tinynote.domain.Config;
import com.xnkfz.tinynote.service.IConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
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

    @ResponseBody
    @PutMapping("update-base-config")
    public Ajax saveBaseConfig(@RequestBody Map<String, Object> configs) {
        List<Config> req = new ArrayList<>();
        configs.forEach((k, v) -> {
            req.add(new Config(k, v));
        });
        configService.batchUpdate(req);
        return Ajax.success();
    }

}
