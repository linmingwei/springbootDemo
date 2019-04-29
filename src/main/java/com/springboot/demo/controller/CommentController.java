package com.springboot.demo.controller;

import com.springboot.demo.entity.Comment;
import com.springboot.demo.service.CommentService;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;

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

    @PostMapping("/add")
    @Transactional
    public ResponseVo save(Comment comment) {
        if (comment.getCreateTime() == null) {
            comment.setCreateTime(new Timestamp(System.currentTimeMillis()));
        }
        if (comment.getPid() == null) {
            comment.setPid(0);
        }
        commentService.save(comment);
        return ResponseVo.success("评论成功");
    }
}
