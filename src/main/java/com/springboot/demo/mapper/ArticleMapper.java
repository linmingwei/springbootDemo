package com.springboot.demo.mapper;

import com.springboot.demo.entity.Article;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    Article selectByPrimaryKey(Integer id);

    List<Article> selectAll();

    int updateByPrimaryKey(Article record);

//    @Select("select count(*) from article")
    int count();
}