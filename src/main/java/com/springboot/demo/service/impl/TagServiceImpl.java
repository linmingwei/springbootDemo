package com.springboot.demo.service.impl;

import com.springboot.demo.entity.ArticleTag;
import com.springboot.demo.entity.Tag;
import com.springboot.demo.mapper.ArticleTagMapper;
import com.springboot.demo.mapper.TagMapper;
import com.springboot.demo.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 15:15
 * @Description:
 */
@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private TagMapper tagMapper;
    @Autowired
    private ArticleTagMapper articleTagMapper;

    @Override
    public int count() {
        return tagMapper.count();
    }

    @Override
    public int delete(Integer id) {
        return  tagMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Tag tag) {
        return tagMapper.updateByPrimaryKey(tag);
    }

    @Override
    public int insert(Tag tag) {
        return tagMapper.insert(tag);
    }

    @Override
    public List<Tag> list() {
        return tagMapper.selectAll();
    }

    @Override
    public Tag getById(Integer i) {
        return tagMapper.selectByPrimaryKey(i);
    }

    @Override
    public List<Tag> getByAid(Integer aid) {
        List<ArticleTag> articleTags = articleTagMapper.selectByAid(aid);
        List<Tag> tags = new ArrayList<>();
        for (ArticleTag articleTag:
             articleTags) {
            tags.add(tagMapper.selectByPrimaryKey(articleTag.getTid()));
        }
        return tags;
    }
}
