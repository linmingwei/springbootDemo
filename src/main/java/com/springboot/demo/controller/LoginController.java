package com.springboot.demo.controller;

import com.springboot.demo.service.UserService;
import com.springboot.demo.util.ResultUtil;
import com.springboot.demo.vo.ResponseVo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 10:58
 **/
@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String login() {
        return "admin/login";
    }

    @PostMapping("/toLogin")
    @ResponseBody
    public ResponseVo toLogin(String username, String password) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            throw new UnknownAccountException("用户名不存在，请重新输入");
        }catch (IncorrectCredentialsException e) {
            throw new IncorrectCredentialsException("用户名或密码错误，请重新输入");
        }
        return ResultUtil.success();
    }
    @GetMapping("/logout")
    public String   logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/admin";
    }

}

