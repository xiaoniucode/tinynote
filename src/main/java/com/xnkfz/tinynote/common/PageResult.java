package com.xnkfz.tinynote.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;
@Setter
@Getter
@ToString
public class PageResult<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer current;
    private Integer size;
    private Integer total;
    private List<T> records;
}
