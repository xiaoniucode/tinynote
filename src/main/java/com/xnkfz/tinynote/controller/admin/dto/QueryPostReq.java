package com.xnkfz.tinynote.controller.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author www.xilio.cn
 */
@Getter
@Setter
@ToString
public class QueryPostReq implements Serializable {
    private Long current;
    private Long size;
    private String title;
    private Integer status;
    private Integer draft;
}
