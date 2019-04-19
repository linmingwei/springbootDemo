package com.springboot.demo.controller;

import com.springboot.demo.entity.Article;
import com.springboot.demo.entity.ArticleTag;
import com.springboot.demo.entity.Tag;
import com.springboot.demo.service.ArticleService;
import com.springboot.demo.service.ArticleTagService;
import com.springboot.demo.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author ldd
 * @desc
 * @create 2019-04-13 22:47
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleTagService articleTagService;
    @Autowired
    private TagService tagService;
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
    @GetMapping("/article/update/{aid}")
    public String articleUpdate(@PathVariable("aid") Integer aid, Model model) {
        if (aid == null) {

        }
        Article article = articleService.getById(aid);
        model.addAttribute("article",article);
        return "article/write";


    }

}
