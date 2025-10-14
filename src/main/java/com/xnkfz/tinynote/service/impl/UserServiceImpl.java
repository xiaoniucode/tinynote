package com.xnkfz.tinynote.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xnkfz.tinynote.common.BizException;
import com.xnkfz.tinynote.controller.admin.dto.ChangePasswordReq;
import com.xnkfz.tinynote.controller.admin.dto.UpdateUserReq;
import com.xnkfz.tinynote.domain.User;
import com.xnkfz.tinynote.mapper.UserMapper;
import com.xnkfz.tinynote.service.IFileService;
import com.xnkfz.tinynote.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xnkfz.tinynote.util.PasswordUtil;
import com.xnkfz.tinynote.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * <p>
 * 用户服务
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private IFileService fileService;

    @Override
    public User findByUsername(String username) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUsername, username);
        return userMapper.selectOne(wrapper);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updatePassword(ChangePasswordReq req, HttpSession session) {
        Integer userId = SecurityUtils.getUserId();
        User user = userMapper.selectById(userId);
        if (PasswordUtil.matches(req.getOldPassword(), user.getPassword())) {
            user.setPassword(PasswordUtil.encode(req.getNewPassword()));
            userMapper.updateById(user);
            //清空登陆信息
            session.invalidate();
            SecurityUtils.clear();
        } else {
            throw new BizException("旧密码不正确！");
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateUser(Integer userId, UpdateUserReq req, HttpSession session) {
        User user = userMapper.selectById(userId);
        String oldUsername = user.getUsername();

        user.setUsername(req.getUsername());
        user.setNickname(req.getNickname());
        int update = userMapper.updateById(user);
        //用户登陆名发生更新，退出登陆
        if (update > 0 && !oldUsername.equals(req.getUsername())) {
            SecurityUtils.logout(session);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public String updateAvatar(Integer userId, MultipartFile file, HttpServletRequest request) {
        String url = fileService.uploadFile(file, request);
        User user = userMapper.selectById(userId);
        user.setAvatar(url);
        userMapper.updateById(user);
        return url;
    }
}
