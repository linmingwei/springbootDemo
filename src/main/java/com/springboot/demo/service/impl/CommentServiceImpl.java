package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Comment;
import com.springboot.demo.mapper.CommentMapper;
import com.springboot.demo.service.CommentService;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 4/29/2019 14:44
 * @Description:
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int countArticleComment(Integer aid) {
        return commentMapper.countArticleComment(aid);
    }

    @Override
    public int count() {
        return commentMapper.count();
    }

    @Override
    public List<Comment> list(Map map) {
        return commentMapper.selectByMap(map);
    }

    @Override
    public List<Comment> getByParams(Map map) {
        return commentMapper.selectByMap(map);

    }

    @Override
    public int  save(Comment comment) {
        return commentMapper.insert(comment);
    }
}
