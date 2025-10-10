package com.xnkfz.tinynote.service;

import com.xnkfz.tinynote.entity.Meta;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xnkfz.tinynote.entity.MetaType;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
public interface IMetaService extends IService<Meta> {
    /**
     * 根据类型创建，如果Meta不存在则创建
     * @param metas 需要插入的内容
     * @param metaType 类型
     * @return meta ids
     */
    List<Integer> createMetaIfNotExist(List<String> metas, MetaType metaType);
}
