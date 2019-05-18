package com.springboot.demo.mapper;

import com.springboot.demo.entity.Link;
import java.util.List;

public interface LinkMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Link record);

    Link selectByPrimaryKey(Long id);

    List<Link> selectAll();

    int updateByPrimaryKey(Link record);
}