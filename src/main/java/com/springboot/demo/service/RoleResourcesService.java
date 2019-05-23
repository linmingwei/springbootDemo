package com.springboot.demo.service;

import com.springboot.demo.entity.RoleResources;

/**
 * @Auther: mingweilin
 * @Date: 5/23/2019 17:30
 * @Description:
 */
public interface RoleResourcesService {
    Integer save(RoleResources roleResources);

    RoleResources findByEntity(Integer roleId, Integer resourceId);

    void delete(Integer id);
}
