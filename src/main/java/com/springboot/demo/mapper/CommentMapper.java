package com.springboot.demo.mapper;

import com.springboot.demo.entity.Comment;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    Comment selectByPrimaryKey(Integer id);

    List<Comment> selectAll();

    int updateByPrimaryKey(Comment record);

    int count();

    List<Comment> selectByMap(Map map);

    @Select("select count(*) from comment where aid = #{aid}")
    int countArticleComment(Integer aid);
}