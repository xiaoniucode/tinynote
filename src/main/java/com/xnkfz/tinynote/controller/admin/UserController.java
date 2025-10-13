package com.xnkfz.tinynote.controller.admin;

import com.xnkfz.tinynote.common.Ajax;
import com.xnkfz.tinynote.controller.admin.dto.ChangePasswordReq;
import com.xnkfz.tinynote.controller.admin.dto.UpdateUserReq;
import com.xnkfz.tinynote.domain.User;
import com.xnkfz.tinynote.service.IUserService;
import com.xnkfz.tinynote.util.PasswordUtil;
import com.xnkfz.tinynote.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {
    @Autowired
    private IUserService userService;

    @GetMapping("profile")
    public String index() {
        return "/admin/profile";
    }

    @GetMapping("password")
    public String password() {
        return "/admin/password";
    }

    @ResponseBody
    @GetMapping("get")
    public Ajax get() {
        Integer userId = SecurityUtils.getUserId();
        User user = userService.getById(userId);
        user.setPassword(null);
        return Ajax.success(user);
    }

    @ResponseBody
    @PutMapping("update-user")
    public Ajax updateUser(@RequestBody UpdateUserReq req) {
        Integer userId = SecurityUtils.getUserId();
        req.setUserId(userId);
        userService.updateUser(req);
        return Ajax.success();
    }

    @ResponseBody
    @PutMapping("change-password")
    public Ajax changePassword(@RequestBody ChangePasswordReq req, HttpSession session) {
        userService.updatePassword(req,session);
        return Ajax.success();
    }

}
