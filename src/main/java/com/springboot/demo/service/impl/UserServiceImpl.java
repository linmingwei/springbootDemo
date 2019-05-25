package com.springboot.demo.service.impl;

import com.springboot.demo.entity.*;
import com.springboot.demo.mapper.*;
import com.springboot.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-05-17 21:40
 **/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RoleResourcesMapper roleResourcesMapper;
    @Autowired
    private ResourcesMapper resourcesMapper;

    @Override
    public User findByName(String name) {
        return userMapper.findByName(name);
    }

    @Override
    public List<Resources> findPermissionsByUserId(Integer userId) {
        UserRole userRole = roleMapper.selectByUserId(userId);
        List<RoleResources> roleResources = roleResourcesMapper.selectByRoleId(userRole.getRoleId());
        List<Resources> resources = new ArrayList<>();
        roleResources.forEach(roleResource -> {
            resources.add(resourcesMapper.selectByPrimaryKey(roleResource.getResourcesId()));
        });
        return resources;


    }

    @Override
    public void update(User entity) {
        userMapper.updateByPrimaryKey(entity);
    }

    @Override
    public void delete(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void batchDelete(List<Integer> ids) {
        ids.forEach(id-> userMapper.deleteByPrimaryKey(id));
    }

    @Override
    public List<User> getAll() {
        return userMapper.selectAll();
    }

    @Override
    public void save(User entity) {
        userMapper.insert(entity);
    }

    @Override
    public User findById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }
}
