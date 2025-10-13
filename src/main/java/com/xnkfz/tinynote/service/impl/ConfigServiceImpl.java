package com.xnkfz.tinynote.service.impl;

import com.xnkfz.tinynote.common.BizException;
import com.xnkfz.tinynote.domain.Config;
import com.xnkfz.tinynote.mapper.ConfigMapper;
import com.xnkfz.tinynote.service.IConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@Service
public class ConfigServiceImpl implements IConfigService {
    @Autowired
    private ConfigMapper configMapper;

    @Override
    public Map<String, Object> getConfigAsMap() {
        try {
            return Optional.ofNullable(configMapper.selectMaps(null))
                    .orElseGet(Collections::emptyList)
                    .stream()
                    .filter(Objects::nonNull)
                    .collect(Collectors.toMap(
                            map -> Optional.ofNullable(map.get("name")).map(Object::toString).orElse(""),
                            map -> map.getOrDefault("value", ""),
                            (v1, v2) -> v1
                    ));
        } catch (Exception e) {
            return Collections.emptyMap();
        }
    }

    @Override
    public Object findByKey(String key) {
        Config config = configMapper.selectById(key);
        return Optional.ofNullable(config).map(Config::getValue).orElse(null);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateByKey(String key, Object value) {
        Config config = configMapper.selectById(key);
        if (config == null) {
            throw new BizException("key不存在!");
        }
        config.setName(key);
        config.setValue(value);
        return configMapper.updateById(config);
    }
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void batchUpdate(List<Config> configs) {
        configMapper.batchUpdate(configs);
    }
}
