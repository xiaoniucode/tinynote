package com.xnkfz.tinynote.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xnkfz.tinynote.entity.Meta;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@Mapper
public interface MetaMapper extends BaseMapper<Meta> {
    /**
     *
     * @param cid
     */

    void clearContentMetaRelation(@Param("cid") Integer cid);

    /**
     * 批量插入meta
     * @param metas 需要插入的数据
     */
    void batchInsert(List<Meta> metas);

}
