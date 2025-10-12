package com.xnkfz.tinynote.controller.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;
@Setter
@Getter
@ToString
public class MarkStatusReq implements Serializable {
    private Integer status;
    private List<Integer> ids;
}
