package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Resources;
import com.springboot.demo.mapper.ResourcesMapper;
import com.springboot.demo.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 17:35
 **/
@Service
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    private ResourcesMapper resourcesMapper;

    @Override
    public List<Resources> getParentWithChildren() {
        List<Resources> all = resourcesMapper.selectAll();
        List<Resources> parents = all.stream().filter(resources ->resources.getPid()!=null && resources.getPid() == 0 ).collect(Collectors.toList());
        all.forEach(resource -> {
            parents.forEach(parent ->{
                if (resource.getPid() == parent.getId()) {
                    parent.getChildren().add(resource);
                }
            });
        });
        return parents;
    }
}
