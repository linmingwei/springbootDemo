package com.springboot.demo.controller;

import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.List;
import java.util.Set;

/**
 * @Auther: mingweilin
 * @Date: 5/10/2019 19:17
 * @Description:
 */
@RestControllerAdvice
public class ExceptionHandlerController {

    @ExceptionHandler(value = BindException.class)
    public ResponseVo bindException(BindException e, HttpServletResponse response) {
        StringBuilder sb = new StringBuilder();
        List<ObjectError> allErrors = e.getBindingResult().getAllErrors();
        for (ObjectError error : allErrors) {
            sb.append(error.getDefaultMessage()).append("；");
        }
        response.setStatus(HttpServletResponse.SC_CONFLICT);

        return ResultUtil.error(409, sb.toString());
    }
    @ExceptionHandler(value = ConstraintViolationException.class)
    public ResponseVo constraintViolationException(ConstraintViolationException e, HttpServletResponse response) {
        StringBuilder sb = new StringBuilder();
        Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
        for (ConstraintViolation c : constraintViolations) {
            sb.append(c.getMessage()).append("；");
        }
        response.setStatus(HttpServletResponse.SC_CONFLICT);
        return ResultUtil.error(409, sb.toString());
    }

    @ExceptionHandler(value = ShiroException.class)
    public ResponseVo shiroException(ShiroException e, HttpServletResponse response) {
        response.setStatus(HttpServletResponse.SC_CONFLICT);
        if (e instanceof AuthenticationException) {
            if (e instanceof UnknownAccountException) {
                return ResultUtil.error(409,"该用户不存在");
            } else if (e instanceof IncorrectCredentialsException) {
                return ResultUtil.error(409, "密码错误，请重试");
            } else {
                return ResultUtil.error(409,"用户名或密码有误");
            }
        }
        return ResponseVo.fail("登录失败请重试");
    }
}

