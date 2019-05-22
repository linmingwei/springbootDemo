package com.springboot.demo.service;

import com.springboot.demo.entity.Resources;
import com.springboot.demo.entity.ResourcesNode;

import java.util.List;

public interface ResourcesService {
    List<ResourcesNode> getParentWithChildren();

    List<Resources> getAll();

    void save(Resources entity);

    void update(Resources entity);

    void delete(Integer id);

    void batchDelete(List<Integer> ids);

    List<Resources> getParents();

}
