package com.springboot.demo.service;

import com.springboot.demo.entity.Link;
import com.springboot.demo.entity.Notice;

import java.util.List;

/**
 * @Auther: mingweilin
 * @Date: 5/19/2019 16:14
 * @Description:
 */
public interface NoticeService {
    List<Notice> getAll();

    void save(Notice entity);

    void update(Notice entity);

    void delete(Long id);

    void batchDelete(List<Long> ids);

}
