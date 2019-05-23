package com.springboot.demo.service.impl;

import com.springboot.demo.mapper.UserRoleMapper;
import com.springboot.demo.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Auther: mingweilin
 * @Date: 5/23/2019 17:30
 * @Description:
 */
@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Override
    public Integer getRoleIdByUserId(Integer userId) {
        return userRoleMapper.selectByUserId(userId).getRoleId();
    }
}
