package com.springboot.demo.controller;

import com.springboot.demo.entity.Type;
import com.springboot.demo.service.TypeService;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 14:28
 * @Description:
 */
@RestController
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @GetMapping("/child")
    public ResponseVo child() {
        List<Type> list = typeService.list(false);
        return ResponseVo.success(list);
    }
}
