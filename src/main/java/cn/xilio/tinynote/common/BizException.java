package cn.xilio.tinynote.common;

import lombok.Getter;
import lombok.Setter;

/**
 * @author www.xilio.cn
 */
@Getter
@Setter
public class BizException extends RuntimeException {
    private static final long serialVersionUID = 1L;
    private Integer code;
    private String message;

    public BizException(Integer code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }
    public BizException(String message) {
        super(message);
        this.code = Ajax.CODE_ERROR;
        this.message = message;
    }

    public BizException(Integer code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
        this.message = message;
    }
}
