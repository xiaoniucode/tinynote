package com.xnkfz.tinynote.controller.theme.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.xnkfz.tinynote.entity.Meta;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@ToString
public class PostDetailRes implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String title;
    private String summary;
    private String content;
    private String publishAt;
    private List<Meta> tags;

}
