package com.springboot.demo.vo;

import lombok.Data;

/**
 * @author ldd
 * @desc
 * @create 2019-04-14 21:58
 **/
@Data
public class ResponseVo {
    private Integer status;
    private String message;
    private Object data;


    public ResponseVo(Integer status, String message) {
        this.status = status;
        this.message = message;
    }

    public ResponseVo(Integer status, String message, Object data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public static ResponseVo success() {
        return new ResponseVo(200, "操作成功");
    }

    public static ResponseVo success(Object data) {
        return new ResponseVo(200, "操作成功",data);
    }

    public static ResponseVo fail() {
        return new ResponseVo(400, "操作失败");
    }

}
