package com.springboot.demo.service.impl;

import com.springboot.demo.entity.ArticleTag;
import com.springboot.demo.mapper.ArticleTagMapper;
import com.springboot.demo.service.ArticleTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 16:02
 * @Description:
 */
@Service
public class ArticleTagServiceImpl implements ArticleTagService {
    @Autowired
    private ArticleTagMapper articleTagMapper;

    @Override
    @Transactional
    public int insert(ArticleTag articleTag) {
        return articleTagMapper.insert(articleTag);

    }


    @Override
    public List<ArticleTag> getByAid(Integer aid) {
        return articleTagMapper.selectByAid(aid);
    }

    @Override
    public void insert(Integer aid, Integer[] tids) {
        for (Integer tid : tids) {
            articleTagMapper.insert(new ArticleTag(aid, tid));
        }
    }

    @Override
    public int deleteByAid(Integer id) {
        return articleTagMapper.deleteByAid(id);
    }
}
