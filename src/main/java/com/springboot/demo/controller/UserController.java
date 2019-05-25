package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Role;
import com.springboot.demo.entity.User;
import com.springboot.demo.entity.UserRole;
import com.springboot.demo.service.RoleService;
import com.springboot.demo.service.UserRoleService;
import com.springboot.demo.service.UserService;
import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 22:10
 **/
@RestController
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserRoleService userRoleService;

    @GetMapping("/user")
    public List<User> all() {
        return userService.getAll();
    }

    @PostMapping("/user")
    public ResponseVo save(User user) {
        try {
            if (user.getId() == null) {
                userService.save(user);
            }else {
                userService.update(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("用户保存失败");
        }
        return ResultUtil.success("用户保存成功");
    }

    @DeleteMapping("/user")
    public ResponseVo delete(@RequestParam("ids") List<Integer> ids) {
        try {
            userService.batchDelete(ids);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("删除用户失败");
        }
        return ResponseVo.success("删除用户成功");
    }

    @GetMapping("/user/page")
    public PageInfo<User> page(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> all = userService.getAll();
        PageInfo<User> info = new PageInfo<>(all);
        return info;
    }

    @GetMapping("/user/tree/{userId}")
    public List<Map<String, Object>> tree(@PathVariable("userId") Integer userId) {
        Integer roleIdByUserId = userRoleService.getRoleIdByUserId(userId);
        List<Role> all = roleService.getAll();
        List<Map<String, Object>> mapList = new ArrayList<>();

        all.forEach(role ->{
            Map<String ,Object> map = new HashMap<>();
            map.put("id",role.getId());
            map.put("name",role.getDescription());
            if (roleIdByUserId .equals(role.getId())) {
                map.put("checked",true);
            }else {
                map.put("checked",false);
            }
            mapList.add(map);
        });
        return mapList;
    }
    @PostMapping("/user/{userId}")
    public ResponseVo updateRole(@PathVariable("userId")Integer userId
            ,@RequestParam("roleId")Integer roleId) {
        UserRole entity = userRoleService.getEntityByUserId(userId);
        if (entity == null) {
            return ResultUtil.error("操作失败");
        }
        entity.setRoleId(roleId);
        userRoleService.updateEntity(entity);
        return ResultUtil.success("更新角色成功");
    }

}
