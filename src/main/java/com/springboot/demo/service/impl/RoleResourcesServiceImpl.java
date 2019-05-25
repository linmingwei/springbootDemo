package com.springboot.demo.service.impl;

import com.springboot.demo.entity.RoleResources;
import com.springboot.demo.mapper.RoleResourcesMapper;
import com.springboot.demo.mapper.UserRoleMapper;
import com.springboot.demo.service.RoleResourcesService;
import com.springboot.demo.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 5/23/2019 17:30
 * @Description:
 */
@Service
public class RoleResourcesServiceImpl implements RoleResourcesService {
    @Autowired
    private RoleResourcesMapper roleResourcesMapper;
    @Override
    public Integer save(RoleResources roleResources) {
        int insert = roleResourcesMapper.insert(roleResources);
        return insert;
    }

    @Override
    public RoleResources findByEntity(Integer roleId, Integer resourceId) {
         return roleResourcesMapper.selectByEntity(roleId,resourceId);
    }

    @Override
    public void delete(Integer id) {
        roleResourcesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int subRoleResources(Integer roleId, Integer pid) {
        return roleResourcesMapper.subRoleResources(roleId,pid);
    }
}
