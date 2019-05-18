package com.springboot.demo.controller;

import com.springboot.demo.entity.Article;
import com.springboot.demo.service.ArticleService;
import com.springboot.demo.service.ArticleTagService;
import com.springboot.demo.service.TagService;
import com.springboot.demo.service.TypeService;
import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private TypeService typeService;



    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("articleCount", articleService.count());
        model.addAttribute("tagCount", tagService.count());
        model.addAttribute("typeCount", typeService.count());
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

    @GetMapping("/article/type")
    public String articleType() {
        return "article/type";
    }

    @GetMapping("/article/tag")
    public String articleTag() {
        return "article/tag";
    }

    @GetMapping("/article/update/{aid}")
    public String articleUpdate(@PathVariable("aid") Integer aid, Model model) {
        if (aid == null) {

        }
        Article article = articleService.getById(aid);
        model.addAttribute("article", article);
        return "article/write";


    }

    @GetMapping("/website/comment")
    public String websiteComment() {
        return "website/comment";
    }

}
