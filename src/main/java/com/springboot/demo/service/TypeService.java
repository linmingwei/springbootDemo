package com.springboot.demo.service;

import com.springboot.demo.entity.Article;
import com.springboot.demo.entity.Type;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 12:13
 * @Description:
 */
public interface TypeService {
    List<Type> list(Integer filter);

    int insert(Type type);

    int update(Type type);

    int delete(Integer id);

    int count();

    List<Type> withChildren();

    Type getById(Integer tid);
}
