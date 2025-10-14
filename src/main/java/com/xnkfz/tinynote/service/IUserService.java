package com.xnkfz.tinynote.service;

import com.xnkfz.tinynote.controller.admin.dto.ChangePasswordReq;
import com.xnkfz.tinynote.controller.admin.dto.UpdateUserReq;
import com.xnkfz.tinynote.domain.User;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * <p>
 * 用户服务接口
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
public interface IUserService {
    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @return 用户信息
     */
    User findByUsername(String username);

    /**
     * 更新用户密码
     *
     * @param req     新密码
     * @param session session
     */
    void updatePassword(ChangePasswordReq req, HttpSession session);

    /**
     * 更新用户信息
     *
     * @param userId 当前登陆用户ID
     * @param req    用户信息
     */
    void updateUser(Integer userId, UpdateUserReq req, HttpSession session);

    /**
     * 更新用户头像
     *
     * @param userId 用户ID
     * @param file   图片
     * @return 上传图片全路径
     */
    String updateAvatar(Integer userId, MultipartFile file, HttpServletRequest request);

    /**
     * 根据用户ID获取用户信息
     * @param userId 用户ID
     * @return 用户信息
     */
    User getById(Integer userId);
}
