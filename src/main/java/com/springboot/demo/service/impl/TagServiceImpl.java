package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Tag;
import com.springboot.demo.mapper.TagMapper;
import com.springboot.demo.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 15:15
 * @Description:
 */
@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private TagMapper tagMapper;
    @Override
    public List<Tag> list() {
        return tagMapper.selectAll();
    }
}
