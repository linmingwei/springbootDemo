package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Article;
import com.springboot.demo.service.ArticleService;
import com.springboot.demo.service.ArticleTagService;
import com.springboot.demo.vo.ResponseVo;
import org.pegdown.PegDownProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-04-14 21:14
 **/
@Controller
@RequestMapping("/article")
@Validated
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleTagService articleTagService;
    @Autowired
    private PegDownProcessor peg;

    @PostMapping("/publish")
    @ResponseBody
    @Transactional
    public ResponseVo publishArticle(@Valid Article article,
                 @RequestParam(value = "tagIds",required = false) @NotNull(message = "请至少选择一个标签") Integer[] tagIds) {
        if (article.getId() == null) {
            if (article.getContent() != null && !"".equals(article.getContent().trim())) {

                article.setContentHTML(peg.markdownToHtml(article.getContent()));
            }
            if (article.getCreateTime() == null) {
                article.setCreateTime(new Date());
            }
            articleService.insert(article);
            if (tagIds != null && tagIds.length != 0) {
                articleTagService.insert(article.getId(), tagIds);

            }
        } else {
            article.setContentHTML(peg.markdownToHtml(article.getContent()));
            article.setUpdateTime(new Date());
            articleService.update(article);
            if (tagIds != null && tagIds.length != 0) {
                articleTagService.deleteByAid(article.getId());
                articleTagService.insert(article.getId(), tagIds);

            }
        }

        return ResponseVo.success("文章操作成功");

    }

    @Cacheable("pageInfo")
    @GetMapping("/list")
    @ResponseBody
    public PageInfo<Article> list(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo
            , @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Article> rows = articleService.list(null);
        PageInfo<Article> pageInfo = new PageInfo<>(rows);
        return pageInfo;
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResponseVo delete(Integer[] ids) {
        if (ids == null || ids.length == 0) {
            return ResponseVo.fail("请至少选择一篇文章");
        }
        for (Integer id :
                ids) {
            articleService.delete(id);
        }
        return ResponseVo.success("共删除" + ids.length + "篇文章");
    }

    @PostMapping("/update/top")
    @ResponseBody
    public ResponseVo updateTop(@RequestParam("id") Integer aid) {
        Article article = articleService.getById(aid);
        if (article.getTop() == null) {
            article.setTop(false);
        } else {

            article.setTop(!article.getTop());
        }
        articleService.update(article);
        return ResponseVo.success();
    }

    @PostMapping("/update/comment")
    @ResponseBody
    public ResponseVo updateComment(@RequestParam("id") Integer aid) {
        Article article = articleService.getById(aid);
        if (article.getComment() == null) {
            article.setComment(false);
        } else {
            article.setComment(!article.getComment());
        }
        articleService.update(article);
        return ResponseVo.success();
    }

    @PostMapping("/topublish")
    @ResponseBody
    public ResponseVo toPublish(@RequestParam("ids") Integer[] ids) {
        articleService.toPublish(ids);
        return ResponseVo.success("发布文章成功");
    }
}
