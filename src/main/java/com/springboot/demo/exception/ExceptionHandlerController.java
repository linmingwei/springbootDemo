package com.springboot.demo.exception;

import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Auther: mingweilin
 * @Date: 5/10/2019 19:17
 * @Description:
 */
@ControllerAdvice
public class ExceptionHandlerController {

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ResponseVo handle(Throwable e) {
        if (e instanceof FiledException) {
            return ResultUtil.error(409,"输入有误，请重新输入");
        }
        return ResponseVo.fail();
    }
}
