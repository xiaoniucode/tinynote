package com.xnkfz.tinynote.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author 晓牛开发者
 * @since 2025-10-10
 */
@Getter
@Setter
@ToString
@TableName("config")
public class Config implements Serializable {

    private static final long serialVersionUID = 1L;
    @TableId("name")
    private String name;

    @TableField("value")
    private Object value;
}
