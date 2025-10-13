package com.xnkfz.tinynote.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xnkfz.tinynote.entity.Config;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 晓牛开发者
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
