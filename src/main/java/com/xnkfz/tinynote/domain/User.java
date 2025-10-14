package com.xnkfz.tinynote.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDateTime;

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
@TableName("user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("username")
    private String username;
    @TableField("nickname")
    private String nickname;
    @TableField("avatar")
    private String avatar;
    @TableField("password")
    private String password;

    @TableField("created_at")
    private LocalDateTime createdAt;
}
