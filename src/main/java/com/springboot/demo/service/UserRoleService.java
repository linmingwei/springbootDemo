package com.springboot.demo.service;

import com.springboot.demo.entity.UserRole;

/**
 * @Auther: mingweilin
 * @Date: 5/23/2019 17:30
 * @Description:
 */
public interface UserRoleService {
    Integer getRoleIdByUserId(Integer userId);

    UserRole getEntityByUserId(Integer userId);

    int updateEntity(UserRole userRole);
}
