package com.xnkfz.tinynote.service;

import com.xnkfz.tinynote.controller.admin.dto.ChangePasswordReq;
import com.xnkfz.tinynote.controller.admin.dto.UpdateUserReq;
import com.xnkfz.tinynote.domain.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
public interface IUserService extends IService<User> {
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
     * @param req 新密码
     */
    void updatePassword(ChangePasswordReq req);

    /**
     * 更新用户信息
     *
     * @param req 用户信息
     */
    void updateUser(UpdateUserReq req);
}
