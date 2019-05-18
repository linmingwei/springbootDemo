package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Link;
import com.springboot.demo.mapper.LinkMapper;
import com.springboot.demo.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 22:14
 **/
@Service
public class LinkServiceImpl implements LinkService {
    @Autowired
    private LinkMapper linkMapper;

    @Override
    public void update(Link link) {
        linkMapper.updateByPrimaryKey(link);
    }

    @Override
    public void delete(Long id) {
        linkMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void batchDelete(List<Long> ids) {
        ids.forEach(id-> linkMapper.deleteByPrimaryKey(id));
    }

    @Override
    public List<Link> getAll() {
        return linkMapper.selectAll();
    }

    @Override
    public void save(Link link) {
        linkMapper.insert(link);
    }
}
