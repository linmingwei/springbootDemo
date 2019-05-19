package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Role;
import com.springboot.demo.service.RoleService;
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
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/role")
    public List<Role> all() {
        return roleService.getAll();
    }

    @PostMapping("/role")
    public ResponseVo save(Role role) {
        try {
            if (role.getId() == null) {
                roleService.save(role);
            }else {
                roleService.update(role);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("角色保存失败");
        }
        return ResultUtil.success("角色保存成功");
    }

    @DeleteMapping("/role")
    public ResponseVo delete(@RequestParam("ids") List<Integer> ids) {
        try {
            roleService.batchDelete(ids);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("删除角色失败");
        }
        return ResponseVo.success("删除角色成功");
    }

    @GetMapping("/role/page")
    public PageInfo<Role> page(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Role> all = roleService.getAll();
        PageInfo<Role> info = new PageInfo<>(all);
        return info;
    }
}
