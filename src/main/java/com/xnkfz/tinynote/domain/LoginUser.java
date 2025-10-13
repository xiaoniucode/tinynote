package com.xnkfz.tinynote.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
@Setter
@Getter
@ToString
public class LoginUser implements Serializable {
    private Integer userId;
    private String username;
}
