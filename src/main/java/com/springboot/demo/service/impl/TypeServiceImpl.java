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
    public List<Type> withChildren() {
        List<Type> types = this.list(0);
        for (Type parent : types) {
            for (Type child : list(1)) {

                if (parent.getId() == child.getPid()) {
                    parent.getChildren().add(child);
                }
            }
        }
        return types;
    }

    @Override
    public int count() {
        return typeMapper.count();
    }

    @Override
    public int delete(Integer id) {
        return typeMapper.deleteByPrimaryKey(id);

    }

    @Override
    public int update(Type type) {
        return typeMapper.updateByPrimaryKey(type);
    }

    @Override
    public int insert(Type type) {
        return typeMapper.insert(type);
    }

    @Override
    public List<Type> list(Integer filter) {
        List<Type> types = typeMapper.selectAll();
        if (filter == null) {
            return types;
        }else if (filter == 1){
            List<Type> childTypes = types.stream().filter(type -> type.getPid() != 0).collect(Collectors.toList());
            return childTypes;
        } else if (filter == 0) {
            List<Type> parentTypes = types.stream().filter(type -> type.getPid() == 0).collect(Collectors.toList());
            return parentTypes;
        }
        return null;
    }
}
