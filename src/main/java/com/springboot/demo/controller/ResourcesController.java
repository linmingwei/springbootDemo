package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Resources;
import com.springboot.demo.entity.ResourcesNode;
import com.springboot.demo.entity.User;
import com.springboot.demo.service.ResourcesService;
import com.springboot.demo.service.UserService;
import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 22:10
 **/
@RestController
public class ResourcesController {
    @Autowired
    private ResourcesService resourcesService;
    @Autowired
    private UserService userService;

    @GetMapping("/resources")
    public List<Resources> all() {
        return resourcesService.getAll();
    }

    @PostMapping("/resources")
    public ResponseVo save(Resources resources) {
        try {
            if (resources.getId() == null) {
                resourcesService.save(resources);
            }else {
                resourcesService.update(resources);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("资源保存失败");
        }
        return ResultUtil.success("资源保存成功");
    }

    @DeleteMapping("/resources")
    public ResponseVo delete(@RequestParam("ids") List<Integer> ids) {
        try {
            resourcesService.batchDelete(ids);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error("删除资源失败");
        }
        return ResponseVo.success("删除资源成功");
    }

    @GetMapping("/resources/page")
    public PageInfo<Resources> page(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                                  @RequestParam(value = "pageSize",defaultValue = "10")  Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Resources> all = resourcesService.getAll();
        PageInfo<Resources> info = new PageInfo<>(all);
        return info;
    }
    @GetMapping("/resources/parent")
    public ResponseVo parent() {
        List<Resources> list = resourcesService.getParents();
        return ResponseVo.success(list);
    }
    @GetMapping("/resources/tree")
    public ResponseVo tree() {
        List<ResourcesNode> resourceTree = resourcesService.getParentWithChildren();
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        List<Resources> resources = userService.findPermissionsByUserId(user.getId());
        Map<Integer,String> containResources = new HashMap<>();
        resources.forEach(resource ->{
            containResources.put(resource.getId(),resource.getPermission());
        });
        resourceTree.forEach(resourceNode ->{
            if (containResources.containsKey(resourceNode.getId())) {
                resourceNode.setChecked(true);
            }
            if (resourceNode.getChildren() != null) {
                resourceNode.setParent(true);
                List<ResourcesNode> children = ()resourceNode.getChildren();
            }
        });


        return ResponseVo.success(resourceTree);
    }

}
