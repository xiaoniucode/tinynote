package cn.xilio.tinynote.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import cn.xilio.tinynote.common.BizException;
import cn.xilio.tinynote.controller.admin.dto.ChangePasswordReq;
import cn.xilio.tinynote.controller.admin.dto.UpdateUserReq;
import cn.xilio.tinynote.domain.User;
import cn.xilio.tinynote.mapper.UserMapper;
import cn.xilio.tinynote.service.IFileService;
import cn.xilio.tinynote.service.IUserService;
import cn.xilio.tinynote.util.PasswordUtil;
import cn.xilio.tinynote.util.SecurityUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
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

    @Override
    public User getById(Integer userId) {
        return userMapper.selectById(userId);
    }
}
