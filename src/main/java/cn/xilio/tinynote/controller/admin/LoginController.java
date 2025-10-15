package cn.xilio.tinynote.controller.admin;

import cn.xilio.tinynote.common.Ajax;
import cn.xilio.tinynote.controller.admin.dto.UserLoginReq;
import cn.xilio.tinynote.domain.LoginUser;
import cn.xilio.tinynote.domain.User;
import cn.xilio.tinynote.util.PasswordUtil;
import cn.xilio.tinynote.service.IUserService;
import cn.xilio.tinynote.util.SecurityUtils;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;



/**
 * @author
 */
@RequestMapping("/admin")
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
            loginUser.setAvatar(user.getAvatar());
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
    public String showLoginPage() {
        return "/admin/login";
    }
}
