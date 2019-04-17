package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Article;
import com.springboot.demo.service.ArticleService;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-04-14 21:14
 **/
@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @PostMapping("/publish")
    public String publishArticle(Article article) {
        System.out.println(article.toString());
        return "";

    }

    @GetMapping("/list")
    @ResponseBody
    public PageInfo<Article> list(@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,@RequestParam(value = "pageSize",defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Article> rows = articleService.list();
        PageInfo<Article> pageInfo = new PageInfo<>(rows);
        return pageInfo;
    }
}
