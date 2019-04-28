package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.jws.WebParam;
import javax.websocket.server.PathParam;
import java.util.ArrayList;
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
    public String index() {
        return "redirect:/1";
    }
    @RequestMapping("/{pageNum}")
    public String  home(Model model, @PathVariable(value = "pageNum",required = false)Integer pageNum,
                        @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize) {
        if (pageNum == null || pageNum < 1) {
            pageNum =1;
        }
        model.addAttribute("typeParent",typeService.withChildren());
        System.out.println(typeService.withChildren());
        model.addAttribute("tags",tagService.list());
        PageHelper.startPage(pageNum,pageSize);
        Map<String,String>  params = new HashMap<>();
        params.put("order","look");
        params.put("type","desc");
        List<Article> articles = articleService.list(params);
        PageInfo<Article> pageInfo = new PageInfo<>(articles, 5);
        model.addAttribute("page",pageInfo);
        return "front/index";
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

    /**
     * 不同分类下的文章
     * @param id
     * @param pageNum
     * @param pageSize
     * @param model
     * @return
     */
    @RequestMapping("/type/{id}/{pageNum}")
    public String typeArticle(@PathVariable("id")Integer id,@PathVariable(value = "pageNum",required = false)Integer pageNum
            ,@RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,Model model) {
        if (pageNum == null || pageNum < 1) {
            pageNum  = 1;
        }
        Map<String,Integer> params = new HashMap<>();
        params.put("typeId",id);
        PageHelper.startPage(pageNum,pageSize);
        List<Article> articles = articleService.findByExample(params);
        PageInfo<Article> pageInfo = new PageInfo<>(articles, 5);
        model.addAttribute("page",pageInfo);
        model.addAttribute("baseUrl","/type/"+id);
        return "front/index";

    }
    @RequestMapping("/tag/{id}/{pageNum}")
    @Transactional
    public String tagArticle(@PathVariable("id")Integer id,@PathVariable(value = "pageNum",required = false)Integer pageNum
            ,@RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,Model model) {
        if (pageNum == null || pageNum < 1) {
            pageNum  = 1;
        }
        List<ArticleTag> articleTags = articleTagService.getByTid(id);
        PageHelper.startPage(pageNum,pageSize);
        List<Article> articles = new ArrayList<>();
        for (ArticleTag articleTag :articleTags) {
            Article article = new Article();
            article= articleService.getById(articleTag.getAid());
            articles.add(article);
        }
        PageInfo<Article> pageInfo = new PageInfo<>(articles, 5);
        model.addAttribute("page",pageInfo);
        model.addAttribute("baseUrl","/tag/"+id);
        return "front/index";

    }


}
