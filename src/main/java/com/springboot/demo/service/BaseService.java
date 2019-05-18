package com.springboot.demo.service;

import java.util.List;

public interface BaseService<T> {
    List<?> getAll();

    void save(Object o);

    void update(Object o);

    void batchDelete(List<Object> o);

    void delete(Object o);

}
