package com.xnkfz.tinynote.entity;

import com.xnkfz.tinynote.common.BizException;
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
    public static ContentStatus fromStatus(Integer status) {
        for (ContentStatus contentStatus : values()) {
            if (contentStatus.getStatus().equals(status)) {
                return contentStatus;
            }
        }
        throw new BizException("未知的状态值: " + status);
    }

}
