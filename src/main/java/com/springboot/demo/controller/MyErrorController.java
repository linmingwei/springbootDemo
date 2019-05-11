package com.springboot.demo.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: mingweilin
 * @Date: 5/10/2019 19:53
 * @Description:
 */
@Controller
@RequestMapping("/error")
public class MyErrorController implements ErrorController {
    @Override
    public String getErrorPath() {
        return "";
    }

    @RequestMapping("/404")
    public String error() {
        return "front/404";
    }
}
