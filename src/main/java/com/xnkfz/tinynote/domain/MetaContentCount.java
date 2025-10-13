package com.xnkfz.tinynote.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Setter
@Getter
@ToString
public class MetaContentCount implements Serializable {
    private String name;
    private Integer count;
}
