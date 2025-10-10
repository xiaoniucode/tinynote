package com.xnkfz.tinynote.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xnkfz.tinynote.entity.Meta;
import com.xnkfz.tinynote.entity.MetaType;
import com.xnkfz.tinynote.mapper.MetaMapper;
import com.xnkfz.tinynote.service.IMetaService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@Service
public class MetaServiceImpl extends ServiceImpl<MetaMapper, Meta> implements IMetaService {
    @Autowired
    private MetaMapper metaMapper;
    @Override
    public List<Integer> createMetaIfNotExist(List<String> metaNames, MetaType metaType) {
        //1.批量查询标签
        LambdaQueryWrapper<Meta> metaWrapper = new LambdaQueryWrapper<>();
        metaWrapper.in(Meta::getName, metaNames);
        metaWrapper.eq(Meta::getType, metaType.getType());
        List<Meta> existMetas = metaMapper.selectList(metaWrapper);
        // 2. 获取已存在的标签名称和ID映射
        Map<String, Integer> existingMetaMap = existMetas.stream()
                .collect(Collectors.toMap(Meta::getName, Meta::getId));

        // 3. 找出需要新增的标签
        List<String> newTagNames = metaNames.stream()
                .filter(name -> !existingMetaMap.containsKey(name))
                .distinct()
                .collect(Collectors.toList());

        // 4. 批量创建新标签
        if (!CollectionUtils.isEmpty(newTagNames)) {
            List<Meta> newTags = newTagNames.stream()
                    .map(name -> {
                        Meta meta = new Meta();
                        meta.setName(name);
                        meta.setType(metaType.getType());
                        return meta;
                    })
                    .collect(Collectors.toList());

            metaMapper.batchInsert(newTags);
            // 将新标签加入映射
            newTags.forEach(meta -> existingMetaMap.put(meta.getName(), meta.getId()));
        }
        // 5. 返回所有标签ID
        return metaNames.stream()
                .map(existingMetaMap::get)
                .distinct()
                .collect(Collectors.toList());
    }
}
