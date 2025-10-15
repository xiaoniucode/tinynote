package cn.xilio.tinynote.service;

import cn.xilio.tinynote.domain.Config;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统配置服务接口
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */

public interface IConfigService {
    /**
     * 获取所有的配置
     *
     * @return 配置信息
     */
    Map<String, Object> getConfigAsMap();

    /**
     * 通过key获取对应的value值
     *
     * @param key 键
     * @return 值
     */
    public Object findByKey(String key);

    /**
     * 通过key更新对应的value值
     *
     * @param key 键
     * @return 值
     */
    public int updateByKey(String key, Object value);

    /**
     * 批量更新配置:只更新存在的key
     *
     * @param configs 配置kv列表
     */
    public void batchUpdate(List<Config> configs);
}
