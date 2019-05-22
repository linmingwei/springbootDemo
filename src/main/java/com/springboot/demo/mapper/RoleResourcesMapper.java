package com.springboot.demo.mapper;

import com.springboot.demo.entity.RoleResources;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleResourcesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleResources record);

    RoleResources selectByPrimaryKey(Integer id);

    List<RoleResources> selectAll();

    int updateByPrimaryKey(RoleResources record);

    @Select("select * from role_resources where roleId = #{roleId}")
    List<RoleResources> selectByRoleId(Integer roleId);
}