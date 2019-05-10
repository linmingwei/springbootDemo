package com.springboot.demo.service;

import com.springboot.demo.entity.Comment;
import com.springboot.demo.entity.Tag;
import com.springboot.demo.vo.ResponseVo;

import java.util.List;
import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 4/29/2019 14:43
 * @Description:
 */
public interface CommentService {
    int save(Comment comment);

    List<Comment> getByParams(Map map);

    List<Comment> list(Map map);

    int count();

    int countArticleComment(Integer aid);

    Comment getById(Integer pid);

    int update(Comment comment);

    int delete(Integer id);
}
