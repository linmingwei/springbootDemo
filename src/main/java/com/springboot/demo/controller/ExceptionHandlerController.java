package com.springboot.demo.controller;

import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

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

    @ExceptionHandler(value = AuthenticationException.class)
    public ResponseVo authenticationException(AuthenticationException e, HttpServletResponse response) {
        return ResultUtil.error(409, e.getMessage());

    }

    @ExceptionHandler(value = AuthorizationException.class)
    public ResponseVo authorizationException(AuthorizationException e,HttpServletResponse response) {
        return ResultUtil.error("您无权访问");
    }
}

