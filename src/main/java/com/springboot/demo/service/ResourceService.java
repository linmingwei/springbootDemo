package com.springboot.demo.service;

import com.springboot.demo.entity.Resources;

import java.util.List;

public interface ResourceService {
    List<Resources> getParentWithChildren();
}
