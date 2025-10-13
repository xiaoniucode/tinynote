package com.xnkfz.tinynote.common;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
    private long current;
    private long size;
    private long total;
    private long pages;
    private List<T> records;

    public static <T> PageResult<T> of(Page<T> page) {
        PageResult<T> res = new PageResult<>();
        res.setRecords(page.getRecords());
        res.setCurrent(page.getCurrent());
        res.setSize(page.getSize());
        res.setTotal(page.getTotal());
        res.setPages(page.getPages());
        return res;
    }
}
