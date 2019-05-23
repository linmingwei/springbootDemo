package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Resources;
import com.springboot.demo.entity.ResourcesNode;
import com.springboot.demo.entity.RoleResources;
import com.springboot.demo.mapper.ResourcesMapper;
import com.springboot.demo.mapper.RoleResourcesMapper;
import com.springboot.demo.service.ResourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 17:35
 **/
@Service
public class ResourcesServiceImpl implements ResourcesService {
    @Autowired
    private ResourcesMapper resourcesMapper;
    @Autowired
    private RoleResourcesMapper roleResourcesMapper;

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
        parents.forEach(parent ->{
            if (parent.getChildren() != null && parent.getChildren().size() != 0) {
                parent.getChildren().forEach(child ->{
                    all.forEach(c ->{
                        if (c.getPid() != null && c.getPid() == child.getId()) {
                            child.getChildren().add(c);
                        }
                    });
                });
            }
        });
        return parents;
    }
    @Override
    public void update(Resources entity) {
        resourcesMapper.updateByPrimaryKey(entity);
    }

    @Override
    public void delete(Integer id) {
        resourcesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Resources> getParents() {
        return resourcesMapper.getParents();
    }

    @Override
    public void batchDelete(List<Integer> ids) {
        ids.forEach(id-> resourcesMapper.deleteByPrimaryKey(id));
    }

    @Override
    public List<Resources> getAll() {
        List<Resources> resources = resourcesMapper.selectAll();
        List<Resources> parents = getParents();
        resources.forEach(resource ->{
            parents.forEach(parent ->{
                if (resource.getPid() == parent.getId()) {
                    resource.setParent(parent);
                }
            });
        });
        return resources;
    }

    @Override
    public void save(Resources entity) {
        resourcesMapper.insert(entity);
    }

    @Override
    public List<Map<String,Object>> getAllWithSelected(Integer roleId) {
        List<Map<String,Object>> mapList = new ArrayList<>();
        List<Resources> all = resourcesMapper.selectAll();
        List<RoleResources> roleResources = roleResourcesMapper.selectByRoleId(roleId);
        Set<Integer> containsIds = new HashSet<>();
        roleResources.forEach(roleResource -> containsIds.add(roleResource.getResourcesId()));
        all.forEach(resource ->{
            Map<String,Object> map = new HashMap<>();
            map.put("id",resource.getId());
            map.put("pid",resource.getPid());
            map.put("name",resource.getName());
            if (containsIds.contains(resource.getId())) {
                map.put("checked",true);
            }else {
                map.put("checked",false);
            }
            mapList.add(map);
        });
        return mapList;
    }
}
