package com.xnkfz.tinynote.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


public enum MetaType {
    TAG("tag"),
    CATEGORY("category");
    private final String type;
    MetaType(String type) {
        this.type = type;
    }
    public String getType() {
        return type;
    }
}
