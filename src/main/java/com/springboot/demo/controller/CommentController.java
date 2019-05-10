package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Comment;
import com.springboot.demo.service.ArticleService;
import com.springboot.demo.service.CommentService;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/29/2019 14:46
 * @Description:
 */
@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ArticleService articleService;

    @PostMapping("/add")
    @Transactional
    public ResponseVo save(Comment comment, HttpServletRequest request) {
        if (comment.getCreateTime() == null) {
            comment.setCreateTime(new Timestamp(System.currentTimeMillis()));
        }
        if (comment.getPid() == null) {
            comment.setPid(0);
        }
        comment.setIpaddr(request.getRemoteAddr());
//        comment.setCreateTime(new Date());
        comment.setStatus(0);
        // TODO: 5/9/2019  敏感词过滤
        commentService.save(comment);
        return ResponseVo.success("评论成功");
    }

    @GetMapping("/page")
    public PageInfo<Comment> list(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                  @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Comment> list = commentService.list(null);
        for (Comment c : list) {
            c.setArticle(articleService.getById(c.getAid()));
        }
        PageInfo<Comment> info = new PageInfo<>(list);
        return info;
    }
}
