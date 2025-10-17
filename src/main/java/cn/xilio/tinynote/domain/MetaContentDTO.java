package cn.xilio.tinynote.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
@Getter
@Setter
@ToString
public class MetaContentDTO implements Serializable {
    private Integer mid;
    private Integer cid;
    private String name;
    private String type;

}
