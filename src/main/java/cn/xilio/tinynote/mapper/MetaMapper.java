package cn.xilio.tinynote.mapper;

import cn.xilio.tinynote.domain.MetaContentDTO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import cn.xilio.tinynote.domain.Meta;
import cn.xilio.tinynote.domain.MetaContentCount;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 存储各种标签分类等信息
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Mapper
public interface MetaMapper extends BaseMapper<Meta> {
    /**
     * @param cid
     */

    void clearContentMetaRelation(@Param("cid") Integer cid);

    /**
     * 批量插入meta
     *
     * @param metas 需要插入的数据
     */
    void batchInsert(@Param("metas") List<Meta> metas);

    /**
     * 查询内容关联的meta
     *
     * @param cid  内容id
     * @param type 类型
     * @return meta列表
     */
    List<Meta> selectMetaList(@Param("cid") Integer cid, @Param("type") String type);

    List<MetaContentCount> findMetaContentCount(@Param("status") Integer status, @Param("draft") Integer draft, @Param("type") String type);

    /**
     * 清除所有内容与meta的关联关系
     *
     * @param ids 内容ID列表
     */
    void clearContentRelationship(@Param("ids") List<Integer> ids);

    /**
     * 通过内容ID列表查询所有的meta信息：一对多关系
     * @param cids 内容id列表
     * @return meta列表
     */
    List<MetaContentDTO> selectMetasByContentIds(@Param("cids") List<Integer> cids);
}
