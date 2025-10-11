package com.xnkfz.tinynote.controller.theme.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@ToString
@Setter
@Getter
public class QueryPostViewReq implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer current;
    private Integer size ;
    private String title;
    private String tag;
}
