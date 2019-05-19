package com.springboot.demo.service.impl;

import com.springboot.demo.entity.Notice;
import com.springboot.demo.mapper.NoticeMapper;
import com.springboot.demo.mapper.NoticeMapper;
import com.springboot.demo.service.NoticeService;
import com.springboot.demo.service.NoticeService;
import freemarker.cache.NotMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 22:14
 **/
@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public void update(Notice entity) {
        noticeMapper.updateByPrimaryKey(entity);
    }

    @Override
    public void delete(Long id) {
        noticeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void batchDelete(List<Long> ids) {
        ids.forEach(id-> noticeMapper.deleteByPrimaryKey(id));
    }

    @Override
    public List<Notice> getAll() {
        return noticeMapper.selectAll();
    }

    @Override
    public void save(Notice entity) {
        noticeMapper.insert(entity);
    }
}
