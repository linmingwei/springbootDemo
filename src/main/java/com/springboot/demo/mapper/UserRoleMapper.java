package com.springboot.demo.mapper;

import com.springboot.demo.entity.UserRole;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRole record);

    UserRole selectByPrimaryKey(Integer id);

    List<UserRole> selectAll();

    int updateByPrimaryKey(UserRole record);

    @Select("select * from user_role where userId = #{userId}")
    UserRole selectByUserId(Integer userId);
}