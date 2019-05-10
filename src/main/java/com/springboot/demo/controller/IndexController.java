package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.*;
import com.springboot.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.print.attribute.standard.JobState;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

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
    @Autowired
    private CommentService commentService;

//    @RequestMapping("/")
//    public String index() {
//        return "redirect:/1";
//    }
    @RequestMapping("/")
    public String  home(Model model) {
        model.addAttribute("typeParent",typeService.withChildren());
        System.out.println(typeService.withChildren());
        model.addAttribute("tags",tagService.list());
        Map<String,String>  params = new HashMap<>();
        params.put("order","look");
        params.put("type","desc");
        params.put("limit","10");
        params.put("status","0");
        List<Article> list = articleService.list(params);
        List<Article> carouselArticles = list.stream().limit(3).collect(Collectors.toList());
        List<Article> articles = list.stream().skip(3).collect(Collectors.toList());
        model.addAttribute("carouselArticles",carouselArticles);
        model.addAttribute("articles",articles);
        return "front/index";
    }
    @RequestMapping("/article")
    public String article() {
        return "front/article";
    }


    @RequestMapping("/{tid}/{aid}")
    public String articlePage(@PathVariable("tid") Integer tid, @PathVariable("aid") Integer aid,Model model) {
        Article article = articleService.getById(aid);
        Map<String, String> params = new HashMap<>();
        params.put("aid",aid.toString());
        params.put("status","0");
        List<Comment> comments = commentService.getByParams(params);
        Map<Integer,Comment> parentComments = new HashMap<>();
        Type articleType = typeService.getById(tid);

        for (Comment comment : comments) {
            parentComments.put(comment.getId(),comment);
        }
        for (Comment comment : comments) {
            if (comment.getPid() != null && comment.getPid() != 0) {
                comment.setParent(parentComments.get(comment.getPid()));
            }
        }
        Map<String,String>  hotParams = new HashMap<>();
        hotParams.put("order","look");
        hotParams.put("type","desc");
        hotParams.put("limit","8");
        hotParams.put("status","0");
        List<Article> hotArticles = articleService.list(hotParams);
        for (Article a : hotArticles) {
            a.setCommentNum(commentService.countArticleComment(a.getId()));
        }
        Map<String,String> relativeParams = new HashMap<>();
        relativeParams.put("typeId",String.valueOf(article.getTypeId()));
        relativeParams.put("noid",String.valueOf(article.getId()));
        relativeParams.put("limit","4");
        relativeParams.put("status","0");
        List<Article> relativeArticles = articleService.findByExample(relativeParams);
        Map<String,String> beforeParams = new HashMap<>();
        beforeParams.put("typeId",String.valueOf(article.getTypeId()));
        beforeParams.put("ltid",String.valueOf(article.getId()));
        beforeParams.put("limit","1");
        beforeParams.put("order","id");
        beforeParams.put("type","desc");
        beforeParams.put("status","0");
        List<Article> beforeArticle = articleService.findByExample(beforeParams);
        Map<String,String> afterParams = new HashMap<>();
        afterParams.put("typeId",String.valueOf(article.getTypeId()));
        afterParams.put("gtid",String.valueOf(article.getId()));
        afterParams.put("limit","1");
        afterParams.put("order","id");
        afterParams.put("type","asc");
        afterParams.put("status","0");
        List<Article> afterArticle = articleService.findByExample(afterParams);
        int articleComments = commentService.countArticleComment(aid);
        List<Tag> tags = tagService.getByAid(aid);
        model.addAttribute("article",article);
        model.addAttribute("articleType",articleType);
        model.addAttribute("hotArticles",hotArticles);
        model.addAttribute("tags",tags);
        model.addAttribute("comments",comments);
        model.addAttribute("articleComments",articleComments);
        model.addAttribute("relativeArticles",relativeArticles);
        model.addAttribute("beforeArticle",beforeArticle);
        model.addAttribute("afterArticle",afterArticle);

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
        Map<String,String> params = new HashMap<>();
        params.put("typeId",String.valueOf(id));
        params.put("status","0");
        PageHelper.startPage(pageNum,pageSize);
        List<Article> articles = articleService.findByExample(params);
        PageInfo<Article> pageInfo = new PageInfo<>(articles, 5);
        model.addAttribute("page",pageInfo);
        model.addAttribute("baseUrl","/type/"+id);
        return "front/list";

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
        return "front/list";

    }



}
