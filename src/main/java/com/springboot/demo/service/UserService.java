package com.springboot.demo.service;

import com.springboot.demo.entity.User;

public interface UserService {
    User findByName(String name);
}
