package com.springboot.demo.service;

import com.springboot.demo.entity.RoleResources;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 5/23/2019 17:30
 * @Description:
 */
public interface RoleResourcesService {
    Integer save(RoleResources roleResources);

    RoleResources findByEntity(Integer roleId, Integer resourceId);

    void delete(Integer id);

    int subRoleResources(Integer roleId,Integer pid);
}
