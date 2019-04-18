package com.springboot.demo.controller;

import com.springboot.demo.service.TagService;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 15:13
 * @Description:
 */
@RestController
@RequestMapping("/tag")
public class TagController {
    @Autowired
    private TagService tagService;

    @GetMapping("/all")
    public ResponseVo all() {
        return ResponseVo.success(tagService.list());
    }
}
