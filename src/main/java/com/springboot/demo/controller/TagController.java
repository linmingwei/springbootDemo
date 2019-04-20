package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Tag;
import com.springboot.demo.service.TagService;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 15:13
 * @Description:
 */
@RestController
@RequestMapping("/tag")
public class TagController {
    @Autowired
    private TagService tagService;

    @GetMapping("/all")
    public ResponseVo all() {
        return ResponseVo.success(tagService.list());
    }

    @GetMapping("/{aid}")
    public ResponseVo articleTag(@PathVariable("aid") Integer aid) {
        return ResponseVo.success(tagService.getByAid(aid));
    }

    @GetMapping("/page")
    public PageInfo<Tag> page(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                              @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        PageInfo<Tag> info = new PageInfo<>(tagService.list());
        return info;
    }

    @PostMapping("/add")
    public ResponseVo addTag(Tag tag) {
        if (tag.getId() == null) {
            tagService.insert(tag);
        } else {
            tagService.update(tag);
        }
        return ResponseVo.success();
    }

    @PostMapping("/delete")
    public ResponseVo deleteTag(Integer[] ids) {
        if (ids == null || ids.length == 0) {
            return ResponseVo.fail("请至少选择一个标签");
        }
        for (Integer id :
                ids) {
            tagService.delete(id);
        }
        return ResponseVo.success("共删除" + ids.length + "个标签");
    }

}

