package com.xnkfz.tinynote.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum ContentStatus {
    //公开
    PUBLISHED(1),
    //私密
    PRIVACY(2);
    private final Integer status;

}
