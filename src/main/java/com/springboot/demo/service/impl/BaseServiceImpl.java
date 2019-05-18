package com.springboot.demo.service.impl;

import com.springboot.demo.service.BaseService;

import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 22:45
 **/
public class BaseServiceImpl<T> implements BaseService<T> {
    @Override
    public List<?> getAll() {
        return null;
    }

    @Override
    public void save(Object o) {

    }

    @Override
    public void update(Object o) {

    }

    @Override
    public void batchDelete(List<Object> o) {

    }

    @Override
    public void delete(Object o) {

    }
}
