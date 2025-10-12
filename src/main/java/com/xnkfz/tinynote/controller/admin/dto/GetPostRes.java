package com.xnkfz.tinynote.controller.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
public class GetPostRes implements Serializable {
    private Integer id;
    private String title;
    private String content;
    private List<String> tags;
    private Integer status;
    private String publishAt;
}
