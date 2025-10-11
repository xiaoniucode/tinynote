package com.xnkfz.tinynote.service;

import com.xnkfz.tinynote.entity.Config;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */

public interface IConfigService  {
    /**
     * 获取所有的配置
     * @return 配置信息
     */
    Map<String, Object> getConfigAsMap();
}
