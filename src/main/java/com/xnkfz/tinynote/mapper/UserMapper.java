package com.xnkfz.tinynote.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xnkfz.tinynote.domain.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  用户管理
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

}
