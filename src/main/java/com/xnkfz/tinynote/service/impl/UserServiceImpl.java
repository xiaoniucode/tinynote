package com.xnkfz.tinynote.service.impl;

import com.xnkfz.tinynote.entity.User;
import com.xnkfz.tinynote.mapper.UserMapper;
import com.xnkfz.tinynote.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
