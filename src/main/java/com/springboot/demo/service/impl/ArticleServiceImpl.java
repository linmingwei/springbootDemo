package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Article;
import com.springboot.demo.mapper.ArticleMapper;
import com.springboot.demo.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/15/2019 17:18
 * @Description:
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public int delete(Integer aid) {
        return articleMapper.deleteByPrimaryKey(aid);
    }

    @Override
    public int update(Article article) {
        return articleMapper.updateByPrimaryKey(article);
    }

    @Override
    public int insert(Article article) {
        return articleMapper.insert(article);
    }

    @Override
    public List<Article> list() {
        List<Article> articles = articleMapper.selectAll();
        return articles;
    }
}
