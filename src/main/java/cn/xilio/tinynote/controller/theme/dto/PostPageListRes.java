package cn.xilio.tinynote.controller.theme.dto;

import cn.xilio.tinynote.domain.Meta;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@ToString
@Setter
@Getter
public class PostPageListRes implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String title;
    private String summary;
    private String publishAt;
    private List<Meta> tags;

}
