package com.xnkfz.tinynote.domain;


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
