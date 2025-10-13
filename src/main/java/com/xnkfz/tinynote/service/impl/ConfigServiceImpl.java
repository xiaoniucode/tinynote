package com.xnkfz.tinynote.service.impl;

import com.xnkfz.tinynote.common.BizException;
import com.xnkfz.tinynote.domain.Config;
import com.xnkfz.tinynote.mapper.ConfigMapper;
import com.xnkfz.tinynote.service.IConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

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


    @Transactional(rollbackFor = Exception.class)
    @Override
    public Map<String, Object> getConfigAsMap() {
        List<Map<String, Object>> maps = configMapper.selectMaps(null);
        Map<String, Object> result = new HashMap<>();
        if (maps != null) {
            for (Map<String, Object> map : maps) {
                if (map != null) {
                    String name = map.get("name").toString();
                    Object value = map.get("value");
                    if (StringUtils.hasText(name) && (value != null && StringUtils.hasText(value.toString()))) {
                        result.put(name, value);
                    } else if (StringUtils.hasText(name)) {
                        //存在key则将value设置为null
                        result.put(name, null);
                    }
                }
            }
        }
        return result;
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
