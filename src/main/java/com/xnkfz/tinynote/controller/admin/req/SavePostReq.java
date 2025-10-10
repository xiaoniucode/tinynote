package com.xnkfz.tinynote.controller.admin.req;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author 晓牛开发者
 */
@Getter
@Setter
public class SavePostReq implements Serializable {
    private Integer id;
    private String title;
    private String content;
    private List<String> tags;
    private Integer status;
    private LocalDateTime publishAt;
}
