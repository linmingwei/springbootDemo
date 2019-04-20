package com.springboot.demo.mapper;

import com.springboot.demo.entity.Tag;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TagMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tag record);

    Tag selectByPrimaryKey(Integer id);

    List<Tag> selectAll();

    int updateByPrimaryKey(Tag record);

    @Select("select count(*) from tag")
    int count();
}