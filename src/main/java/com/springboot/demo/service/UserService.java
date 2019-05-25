package com.springboot.demo.service;

import com.springboot.demo.entity.Resources;
import com.springboot.demo.entity.User;

import java.util.List;

public interface UserService {
    User findByName(String name);

    List<Resources> findPermissionsByUserId(Integer userId);

    List<User> getAll();

    void save(User entity);

    void update(User entity);

    void delete(Integer id);

    void batchDelete(List<Integer> ids);

    User findById(Integer id );

}
