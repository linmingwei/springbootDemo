package com.springboot.demo.controller;

import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

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
    public ResponseVo bindException(BindException e) {
        StringBuilder sb = new StringBuilder();
        List<ObjectError> allErrors = e.getBindingResult().getAllErrors();
        for (ObjectError error : allErrors) {
            sb.append(error.getDefaultMessage()).append("；");
        }
        return ResultUtil.error(409, sb.toString());
    }
    @ExceptionHandler(value = ConstraintViolationException.class)
    public ResponseVo constraintViolationException(ConstraintViolationException e) {
        StringBuilder sb = new StringBuilder();
        Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
        for (ConstraintViolation c : constraintViolations) {
            sb.append(c.getMessage()).append("；");
        }
        return ResultUtil.error(409, sb.toString());
    }
}
