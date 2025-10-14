package com.xnkfz.tinynote.controller.admin;

import com.xnkfz.tinynote.common.Ajax;
import com.xnkfz.tinynote.controller.admin.dto.UserLoginReq;
import com.xnkfz.tinynote.domain.LoginUser;
import com.xnkfz.tinynote.domain.User;
import com.xnkfz.tinynote.util.PasswordUtil;
import com.xnkfz.tinynote.service.IUserService;
import com.xnkfz.tinynote.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author
 */
@RequestMapping("/admin/")
@Controller
public class LoginController {
    @Autowired
    private IUserService userService;

    @PostMapping("doLogin")
    @ResponseBody
    public Ajax processLogin(@RequestBody UserLoginReq req, HttpSession session) {
        User user = userService.findByUsername(req.getUsername());
        if (user != null && PasswordUtil.matches(req.getPassword(), user.getPassword())) {
            LoginUser loginUser = new LoginUser();
            loginUser.setUsername(user.getUsername());
            loginUser.setUserId(user.getId());
            loginUser.setNickname(user.getNickname());
            session.setAttribute("loginUser", loginUser);
            SecurityUtils.setUser(loginUser);
            return Ajax.success("登陆成功");
        } else {
            return Ajax.error("用户名或密码错误");
        }
    }
    @GetMapping("exit")
    public String logout(HttpSession session) {
        session.invalidate();
        SecurityUtils.clear();
        return "redirect:/admin/login";
    }
    @GetMapping("login")
    public String showLoginPage(HttpSession session, HttpServletRequest request) {
        return "/admin/login";
    }
}
