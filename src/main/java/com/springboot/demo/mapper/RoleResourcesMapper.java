package com.springboot.demo.mapper;

import com.springboot.demo.entity.RoleResources;
import java.util.List;

public interface RoleResourcesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleResources record);

    RoleResources selectByPrimaryKey(Integer id);

    List<RoleResources> selectAll();

    int updateByPrimaryKey(RoleResources record);
}