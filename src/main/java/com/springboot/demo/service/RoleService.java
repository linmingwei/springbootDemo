package com.springboot.demo.service;

import com.springboot.demo.entity.Role;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 5/19/2019 16:14
 * @Description:
 */
public interface RoleService {
    List<Role> getAll();

    void save(Role entity);

    void update(Role entity);

    void delete(Integer id);

    void batchDelete(List<Integer> ids);

}
