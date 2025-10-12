package com.xnkfz.tinynote.security;

import com.xnkfz.tinynote.entity.LoginUser;
import com.xnkfz.tinynote.entity.User;
import com.xnkfz.tinynote.util.SecurityUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AuthInterceptor implements HandlerInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (!request.getRequestURI().startsWith("/admin/")) {
            return true;
        }
        LoginUser user = (LoginUser) session.getAttribute("user");
        if (ObjectUtils.isEmpty(user)) {
            response.sendRedirect("/admin/login");
            return false;
        }
        SecurityUtils.setUser(user);
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 清理 ThreadLocal，防止内存泄漏
        SecurityUtils.clear();
    }
}
