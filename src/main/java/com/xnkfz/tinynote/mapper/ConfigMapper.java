package com.xnkfz.tinynote.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xnkfz.tinynote.domain.Config;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  配置管理
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Mapper
public interface ConfigMapper extends BaseMapper<Config> {
    /**
     * 批量更新：只更新存在的key（name）的值
     * @param configs 配置列表
     */
    void batchUpdate(@Param("configs") List<Config> configs);
}
