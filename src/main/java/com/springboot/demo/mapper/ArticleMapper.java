package com.springboot.demo.mapper;

import com.springboot.demo.entity.Article;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    Article selectByPrimaryKey(Integer id);

    List<Article> selectAll(Map params);

    int updateByPrimaryKey(Article record);

//    @Select("select count(*) from article")
    int count();

}