package com.springboot.demo.service;

import com.springboot.demo.entity.ArticleTag;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 16:02
 * @Description:
 */
public interface ArticleTagService {
    int insert(ArticleTag articleTag);

    List<ArticleTag> getByAid(Integer aid);

    void insert(Integer aid,Integer[] tids);

    int deleteByAid(Integer id);
}
