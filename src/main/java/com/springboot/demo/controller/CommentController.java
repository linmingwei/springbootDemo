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
import javax.validation.Valid;
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
    public ResponseVo save(@Valid Comment comment, HttpServletRequest request) {
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
//        commentService.save(comment);
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
    @PostMapping("/reply")
    @ResponseBody
    @Transactional
    public ResponseVo reply(@RequestParam("content")String content,@RequestParam("pid")Integer pid) {
        if (content == null || "".equals(content)) {
            return ResponseVo.fail("内容为空，请重试");
        }
        if (pid == null) {
            return ResponseVo.fail();
        }
        Comment parentComment = commentService.getById(pid);
        if (parentComment == null) {
            return ResponseVo.fail("该评论不存在");
        }
        Comment comment = new Comment();
        comment.setStatus(0);
        comment.setCreateTime(new Date());
        comment.setPid(pid);
        comment.setUsername("超级管理员");
        comment.setContent(content);
        comment.setAid(parentComment.getAid());
        comment.setEmail("admin@admin.com");
        commentService.save(comment);
        return ResponseVo.success("回复评论成功");
    }
    @PostMapping("/check")
    @ResponseBody
    @Transactional
    public ResponseVo check(@RequestParam("content")String content,@RequestParam("pid")Integer pid,
                            @RequestParam("status")Integer status) {
        if (status == null) {
            return ResponseVo.fail("状态有错");
        }
        if (pid == null) {
            return ResponseVo.fail();
        }
        Comment comment = commentService.getById(pid);
        if (comment == null) {
            return ResponseVo.fail("该评论不存在");
        } else {
            comment.setStatus(status);
        }
        if (content == null || "".equals(content)) {
            commentService.update(comment);
            return ResponseVo.success("审核成功");

        }else {
            Comment releyComment = Comment.builder().aid(comment.getAid()).content(content)
                    .createTime(new Date()).email("admin@admin.com")
                    .pid(comment.getId()).username("超级管理员").build();
            commentService.save(comment);
            return ResponseVo.success("审核并回复成功");


        }
    }

    @PostMapping("/delete")
    @ResponseBody
    @Transactional
    public ResponseVo delete(@RequestParam("ids") Integer[] ids) {
        if (ids == null || ids.length == 0) {
            return ResponseVo.fail("id为空");
        }
        for (Integer id  : ids) {
            commentService.delete(id);
        }
        return  ResponseVo.success("删除评论成功");

    }

}
