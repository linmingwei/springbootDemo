package com.springboot.demo.service;

import com.springboot.demo.entity.Resources;
import com.springboot.demo.entity.User;

import java.util.List;

public interface UserService {
    User findByName(String name);

    List<Resources> findPermissionsByUserId(Integer userId);
}
