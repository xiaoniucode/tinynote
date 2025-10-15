package cn.xilio.tinynote.controller.theme.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@ToString
@Setter
@Getter
public class QueryPostViewReq implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long current;
    private Long size ;
    private String title;
}
