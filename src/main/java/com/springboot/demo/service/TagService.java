package com.springboot.demo.service;

import com.springboot.demo.entity.Article;
import com.springboot.demo.entity.Tag;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 15:15
 * @Description:
 */
public interface TagService {
    List<Tag> list();

    Tag getById(Integer i);

    List<Tag> getByAid(Integer aid);
}
