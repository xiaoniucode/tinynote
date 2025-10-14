package com.xnkfz.tinynote.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author www.xilio.cn
 * @since 2025-10-10
 */
@Getter
@Setter
@ToString
@TableName("config")
@AllArgsConstructor
@NoArgsConstructor
public class Config implements Serializable {

    private static final long serialVersionUID = 1L;
    @TableId("name")
    private String name;

    @TableField("value")
    private Object value;
}
