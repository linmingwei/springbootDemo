package com.springboot.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springboot.demo.entity.Type;
import com.springboot.demo.service.TypeService;
import com.springboot.demo.vo.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Auther: mingweilin
 * @Date: 4/18/2019 14:28
 * @Description:
 */
@RestController
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @GetMapping("/child")
    public ResponseVo child() {
        List<Type> list = typeService.list(1);
        return ResponseVo.success(list);
    }

    @GetMapping("/all")
    public PageInfo<Type> all(@RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,@RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Type> list = typeService.list(null);
        List<Type> parentsList = typeService.list(0);

        Map<Integer,Type> map = new HashMap<>();
        Map<Integer, Type> parentsMap = parentsList.stream().filter(type -> type.getPid() == 0).collect(Collectors.toMap(Type::getId, type -> {
            return type;
        }));
        for (Type type : list) {
            if (type.getPid() != 0) {
                type.setParent(parentsMap.get(type.getPid()));
            }
        }
        PageInfo<Type> info = new PageInfo<>(list);
        return info;
    }
    @GetMapping("/parent")
    public ResponseVo parent() {
        List<Type> list = typeService.list(0);
        return ResponseVo.success(list);
    }
    @PostMapping("/add")
    public ResponseVo addType(@Valid Type type){
        if (type.getId() == null) {
            typeService.insert(type);
        }else {
            typeService.update(type);
        }
        return ResponseVo.success("添加分类成功");

    }
    @PostMapping("/delete")
    public ResponseVo deleteType(Integer[] ids) {
        if (ids == null || ids.length == 0) {
            return ResponseVo.fail("请至少选择一个分类");
        }
        for (Integer id :
                ids) {
            typeService.delete(id);
        }
        return ResponseVo.success("共删除" + ids.length + "个分类");    }
}
