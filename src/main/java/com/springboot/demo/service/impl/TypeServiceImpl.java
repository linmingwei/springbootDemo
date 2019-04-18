package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Type;
import com.springboot.demo.mapper.TypeMapper;
import com.springboot.demo.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 12:14
 * @Description:
 */
@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeMapper typeMapper;
    @Override
    public List<Type> list(boolean all) {
        List<Type> types = typeMapper.selectAll();
        if (all) {
            return types;
        }else {
            List<Type> childTypes = types.stream().filter(type -> type.getPid() != 0).collect(Collectors.toList());
            return childTypes;
        }
    }
}
