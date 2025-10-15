package cn.xilio.tinynote.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import cn.xilio.tinynote.domain.Content;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  内容管理
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Mapper
public interface ContentMapper extends BaseMapper<Content> {
    /**
     * 创建meta与内容的关联
     * @param cid  内容ID
     * @param metaIds 元数据IDS
     */
    void relationContentMeta(@Param("cid") Integer cid, @Param("metaIds") List<Integer> metaIds);

    /**
     * 批量更新内容状态
     * @param ids 内容ID列表
     * @param status 新状态值
     * @return 影响的行数
     */
    int setStatusBatchIds(@Param("ids") List<Integer> ids, @Param("status") Integer status);
}
