package com.xnkfz.tinynote.common;

/**
 * @author 晓牛开发者
 */
public class BizException extends RuntimeException {
    private static final long serialVersionUID = 1L;
    private Integer code;
    private String message;

    public BizException(Integer code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }

    public BizException(Integer code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
        this.message = message;
    }
}
