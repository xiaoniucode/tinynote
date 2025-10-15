package cn.xilio.tinynote.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import cn.xilio.tinynote.domain.Meta;
import cn.xilio.tinynote.domain.MetaContentCount;
import cn.xilio.tinynote.domain.MetaType;
import cn.xilio.tinynote.mapper.MetaMapper;
import cn.xilio.tinynote.service.IMetaService;
import cn.xilio.tinynote.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 元数据服务
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Service
public class MetaServiceImpl implements IMetaService {
    @Autowired
    private MetaMapper metaMapper;

    @Override
    public List<Integer> createMetaIfNotExist(List<String> metaNames, MetaType metaType) {
        if (CollectionUtils.isEmpty(metaNames)) {
            return new ArrayList<>();
        }
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

    @Override
    public List<Meta> findMetaByContentId(Integer id, MetaType metaType) {
        return metaMapper.selectMetaList(id, metaType.getType());
    }

    @Override
    public List<MetaContentCount> metaContentCount(MetaType metaType) {
        boolean isLogin = SecurityUtils.isLogin();
        return metaMapper.findMetaContentCount(isLogin ? null : 1, isLogin ? null : 0, metaType.getType());
    }
}
