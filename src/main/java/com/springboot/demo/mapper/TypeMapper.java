package com.springboot.demo.mapper;

import com.springboot.demo.entity.Type;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Type record);

    Type selectByPrimaryKey(Integer id);

    List<Type> selectByPid(Integer pid);

    List<Type> selectAll();

    int updateByPrimaryKey(Type record);

    @Select("select count(*) from type")
    int count();
}