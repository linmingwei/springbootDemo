package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.springboot.demo.entity.Article;
import com.springboot.demo.entity.ArticleTag;
import com.springboot.demo.entity.Tag;
import com.springboot.demo.entity.Type;
import com.springboot.demo.service.ArticleService;
import com.springboot.demo.service.ArticleTagService;
import com.springboot.demo.service.TagService;
import com.springboot.demo.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.jws.WebParam;
import javax.websocket.server.PathParam;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 4/1/2019 11:18
 * @Description:
 */
@Controller
public class IndexController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleTagService articleTagService;
    @Autowired
    private TagService tagService;
    @Autowired
    private TypeService typeService;
    @RequestMapping("/")
    public String  home(Model model, @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                        @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize) {
        model.addAttribute("typeParent",typeService.withChildren());
        System.out.println(typeService.withChildren());
        model.addAttribute("tags",tagService.list());
        PageHelper.startPage(pageNum,pageSize);
        Map<String,String>  params = new HashMap<>();
        params.put("order","look");
        params.put("type","desc");
        List<Article> articles = articleService.list(params);
        model.addAttribute("articles",articles);
        return "front/index";
    }
    @RequestMapping(value = "/index")
    public String  index() {
        return "index";
    }

    @RequestMapping("/article")
    public String article() {
        return "front/article";
    }


    @RequestMapping("/{tid}/{aid}")
    public String articlePage(@PathVariable("tid") Integer tid, @PathVariable("aid") Integer aid,Model model) {
        Article article = articleService.getById(aid);
        List<Tag> tags = tagService.getByAid(aid);
        model.addAttribute("article",article);
        model.addAttribute("tags",tags);

        return "front/article";

    }

}
