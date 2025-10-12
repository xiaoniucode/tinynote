package com.xnkfz.tinynote.controller.admin.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

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
    private Integer draft;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime publishAt;
}
