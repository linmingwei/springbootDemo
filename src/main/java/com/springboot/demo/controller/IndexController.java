package com.springboot.demo.controller;

import com.springboot.demo.service.ArticleService;
import com.springboot.demo.service.ArticleTagService;
import com.springboot.demo.service.TagService;
import com.springboot.demo.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Auther: mingweilin
 * @Date: 4/1/2019 11:18
 * @Description:
 */
@Controller
public class IndexController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleTagService articleTagService;
    @Autowired
    private TagService tagService;
    @Autowired
    private TypeService typeService;
    @RequestMapping("/")
    public String  home(Model model) {
        model.addAttribute("typeParent",typeService.list(0));
        model.addAttribute("typeChild",typeService.list(1));
        model.addAttribute("tag",tagService.list());
        model.addAttribute("article",articleService.list());
        return "front/index";
    }
    @RequestMapping(value = "/index")
    public String  index() {
        return "index";
    }

    @RequestMapping("/good")
    @ResponseBody
    public String good() {
        return "你好";
    }

}
