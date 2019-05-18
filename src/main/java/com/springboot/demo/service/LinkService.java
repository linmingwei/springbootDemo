package com.springboot.demo.service;

import com.springboot.demo.entity.Link;

import java.util.List;

public interface LinkService {
    List<Link> getAll();

    void save(Link link);

    void update(Link link);

    void delete(Long id);

    void batchDelete(List<Long> ids);
}
