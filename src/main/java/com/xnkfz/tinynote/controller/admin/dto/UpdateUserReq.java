package com.xnkfz.tinynote.controller.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
@Setter
@Getter
@ToString
public class UpdateUserReq implements Serializable {
    private String userName;
    private String nickname;
}
