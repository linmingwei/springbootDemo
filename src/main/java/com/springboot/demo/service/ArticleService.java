package com.springboot.demo.service;

import com.springboot.demo.entity.Article;

import java.util.List;
import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 4/15/2019 17:18
 * @Description:
 */
public interface ArticleService {
    List<Article> list(Map map);

    int insert(Article article);

    int update(Article article);

    int delete(Integer aid);

    Article getById(Integer aid);

    void toPublish(Integer[] ids);

    int count();

    List<Article> order();
}
