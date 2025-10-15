package cn.xilio.tinynote.service;

import cn.xilio.tinynote.domain.Meta;
import cn.xilio.tinynote.domain.MetaContentCount;
import cn.xilio.tinynote.domain.MetaType;

import java.util.List;

/**
 * <p>
 * 元数据服务接口
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
public interface IMetaService {
    /**
     * 根据类型创建，如果Meta不存在则创建
     *
     * @param metas    需要插入的内容
     * @param metaType 类型
     * @return meta ids
     */
    List<Integer> createMetaIfNotExist(List<String> metas, MetaType metaType);

    /**
     * 根据内容ID查询元数据列表
     *
     * @param id       内容ID
     * @param metaType meta类型：tag，category
     * @return 元数据列表
     */
    List<Meta> findMetaByContentId(Integer id, MetaType metaType);

    /**
     * 统计meta对应的content数量
     *
     * @param metaType meta类型：tag、category
     * @return 数量关系列表
     */
    List<MetaContentCount> metaContentCount(MetaType metaType);
}
