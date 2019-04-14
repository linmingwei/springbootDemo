package com.springboot.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ldd
 * @desc
 * @create 2019-04-13 22:47
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {
    @GetMapping("")
    public String login() {
        return "admin/login";
    }

    @GetMapping("/home")
    public String home() {
        return "admin/home";
    }

    @GetMapping("/article/write")
    public String articleWrite() {
        return "article/write";
    }

    @GetMapping("/article/list")
    public String articleList() {
        return "article/list";
    }

}
