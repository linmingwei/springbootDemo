package com.springboot.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ldd
 * @desc
 * @create 2019-04-14 21:14
 **/
@Controller
@RequestMapping("/article")
public class ArticleController {
    @PostMapping("/publish")
    public String publishArticle() {
        return "";
    }
}
