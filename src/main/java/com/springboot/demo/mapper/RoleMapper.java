package com.springboot.demo.mapper;

import com.springboot.demo.entity.Role;
import com.springboot.demo.entity.UserRole;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    Role selectByPrimaryKey(Integer id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);
    @Select("select * from user_role where userId = #{userId}")
    UserRole selectByUserId(Integer userId);
}