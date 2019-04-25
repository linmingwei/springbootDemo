package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Article;
import com.springboot.demo.mapper.ArticleMapper;
import com.springboot.demo.mapper.ArticleTagMapper;
import com.springboot.demo.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 4/15/2019 17:18
 * @Description:
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private ArticleTagMapper articleTagMapper;

    @Override
    public Article getById(Integer aid) {
        return articleMapper.selectByPrimaryKey(aid);
    }

    @Override
    public List<Article> order() {
        return articleMapper.orderByLook();
    }

    @Override
    public int count() {
        return articleMapper.count();
    }

    @Override
    public void toPublish(Integer[] ids) {
        for (Integer id : ids) {
            Article article = articleMapper.selectByPrimaryKey(id);
            if (article.getStatus() == null || article.getStatus() == 1) {
                article.setStatus(0);
                articleMapper.updateByPrimaryKey(article);
            }

        }

    }

    @Override
    public int delete(Integer aid) {
        articleTagMapper.deleteByAid(aid);
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
    public List<Article> list(Map map) {
        List<Article> articles = articleMapper.selectAll(map);
        return articles;
    }
}
