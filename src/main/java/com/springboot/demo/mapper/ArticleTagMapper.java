package com.springboot.demo.mapper;

import com.springboot.demo.entity.ArticleTag;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ArticleTagMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ArticleTag record);

    ArticleTag selectByPrimaryKey(Integer id);
    List<ArticleTag> selectByAid(Integer aid);

    List<ArticleTag> selectAll();

    int updateByPrimaryKey(ArticleTag record);

    int deleteByAid(Integer aid);
    @Select("select * from article_tag where tid = #{id} and status = 0")
    List<ArticleTag> selectByTid(Integer id);
}