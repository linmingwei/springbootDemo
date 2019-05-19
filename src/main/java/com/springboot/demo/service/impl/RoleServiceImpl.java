package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Role;
import com.springboot.demo.mapper.RoleMapper;
import com.springboot.demo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 22:14
 **/
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public void update(Role entity) {
        roleMapper.updateByPrimaryKey(entity);
    }

    @Override
    public void delete(Integer id) {
        roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void batchDelete(List<Integer> ids) {
        ids.forEach(id-> roleMapper.deleteByPrimaryKey(id));
    }

    @Override
    public List<Role> getAll() {
        return roleMapper.selectAll();
    }

    @Override
    public void save(Role entity) {
        roleMapper.insert(entity);
    }
}
