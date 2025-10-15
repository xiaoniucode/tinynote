package cn.xilio.tinynote.controller.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
@Setter
@Getter
@ToString
public class ChangePasswordReq implements Serializable {
    private String oldPassword;
    private String newPassword;
}
