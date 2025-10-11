package com.xnkfz.tinynote.controller.theme.dto;

import com.xnkfz.tinynote.entity.Meta;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
public class PostDetailRes implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String title;
    private String content;
    private String publishAt;
    private List<Meta> tags;

}
