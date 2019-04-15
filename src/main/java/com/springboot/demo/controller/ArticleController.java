package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
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
    public String publishArticle() {
        return "";

    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseVo list(@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,@RequestParam(value = "pageSize",defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Article> list = articleService.list();
        return ResponseVo.success(list);
    }
}
