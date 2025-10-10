package com.xnkfz.tinynote.controller.admin.req;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
@Getter
@Setter
@ToString
public class QueryPostReq implements Serializable {
    private Integer current;
    private Integer size;
    private String title;
    private String tag;
}
