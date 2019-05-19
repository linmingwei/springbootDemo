package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Link;
import com.springboot.demo.service.LinkService;
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
public class LinkController {
    @Autowired
    private LinkService linkService;

    @GetMapping("/link")
    public List<Link> all() {
        return linkService.getAll();
    }

    @PostMapping("/link")
    public ResponseVo save(Link link) {
        try {
            if (link.getId() == null) {
                linkService.save(link);
            }else {
                linkService.update(link);
            }
        } catch (Exception e) {
            e.printStackTrace();
            ResultUtil.error("友链保存失败");
        }
        return ResultUtil.success("友链保存成功");
    }

    @DeleteMapping("/link")
    public ResponseVo delete(@RequestParam("ids") List<Long> ids) {
        try {
            linkService.batchDelete(ids);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("删除失败");
        }
        return ResponseVo.success("删除友链成功");
    }

    @GetMapping("/link/page")
    public PageInfo<Link> page(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Link> all = linkService.getAll();
        PageInfo<Link> info = new PageInfo<>(all);
        return info;
    }
}
