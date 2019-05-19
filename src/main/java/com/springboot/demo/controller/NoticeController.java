package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Notice;
import com.springboot.demo.service.NoticeService;
import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 22:10
 **/
@RestController
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notice")
    public List<Notice> all() {
        return noticeService.getAll();
    }

    @PostMapping("/notice")
    public ResponseVo save(Notice notice) {
        try {
            if ("true".equals(notice.getStatus())) {
                notice.setStatus("RELEASE");
            }else {
                notice.setStatus("NOT_RELEASE");
            }
            if (notice.getId() == null) {
                noticeService.save(notice);
            }else {
                noticeService.update(notice);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("公告保存失败");
        }
        return ResultUtil.success("公告保存成功");
    }

    @DeleteMapping("/notice")
    public ResponseVo delete(@RequestParam("ids") List<Long> ids) {
        try {
            noticeService.batchDelete(ids);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("删除失败");
        }
        return ResponseVo.success("删除公告成功");
    }

    @GetMapping("/notice/page")
    public PageInfo<Notice> page(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Notice> all = noticeService.getAll();
        PageInfo<Notice> info = new PageInfo<>(all);
        return info;
    }
}
