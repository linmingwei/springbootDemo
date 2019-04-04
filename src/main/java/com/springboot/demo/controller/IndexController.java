package com.springboot.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Auther: mingweilin
 * @Date: 4/1/2019 11:18
 * @Description:
 */
@Controller
public class IndexController {
    @RequestMapping("/")
    @ResponseBody
    public String  hello() {
        return "hello";
    }
    @RequestMapping(value = "/index")
    public String  index() {
        return "index";
    }

    @RequestMapping("/good")
    @ResponseBody
    public String good() {
        return "你好";
    }

    @RequestMapping("/admin/home")
    public String home() {
        return "admin/home";
    }
}
