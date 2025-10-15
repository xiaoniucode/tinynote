package cn.xilio.tinynote.controller.admin;

import cn.xilio.tinynote.common.Ajax;
import cn.xilio.tinynote.controller.admin.dto.ChangePasswordReq;
import cn.xilio.tinynote.controller.admin.dto.UpdateUserReq;
import cn.xilio.tinynote.domain.User;
import cn.xilio.tinynote.service.IUserService;
import cn.xilio.tinynote.util.PasswordUtil;
import cn.xilio.tinynote.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {
    @Autowired
    private IUserService userService;

    @GetMapping("profile")
    public String index(Model model) {
        Integer userId = SecurityUtils.getUserId();
        User user = userService.getById(userId);
        user.setPassword(null);
        model.addAttribute("user", user);
        return "/admin/profile";
    }

    @GetMapping("password")
    public String password() {
        return "/admin/password";
    }

    @ResponseBody
    @PutMapping("update-user")
    public Ajax updateUser(@RequestBody UpdateUserReq req,HttpSession session) {
        Integer userId = SecurityUtils.getUserId();
        userService.updateUser(userId, req,session);
        return Ajax.success();
    }

    @ResponseBody
    @PostMapping(value = "update-avatar", consumes = MediaType.MULTIPART_FORM_DATA_VALUE, name = "图片上传")
    public Ajax updateAvatar(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        Integer userId = SecurityUtils.getUserId();
        String url = userService.updateAvatar(userId, file, request);
        return Ajax.success(url);
    }

    @ResponseBody
    @PutMapping("change-password")
    public Ajax changePassword(@RequestBody ChangePasswordReq req, HttpSession session) {
        userService.updatePassword(req, session);
        return Ajax.success();
    }

}
