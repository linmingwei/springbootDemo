package com.springboot.demo.util;

import com.springboot.demo.vo.ResponseVo;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 5/10/2019 20:21
 * @Description:
 */
public class ResultUtil {
    public static ModelAndView view(String view) {
        return new ModelAndView(view);
    }
    public static ModelAndView view(String view, Map<String,Object> model) {
        return new ModelAndView(view,model);
    }

    public static ModelAndView redirect(String view) {
        return new ModelAndView("redirect:"+view);
    }

    public static ResponseVo error(int code, String msg) {
        return new ResponseVo(code,msg);
    }

    public static ResponseVo vo(int code, String msg,Object data) {
        return new ResponseVo(code,msg,data);
    }
    public static ResponseVo success() {
        return new ResponseVo(200,"操作成功",null);
    }
    public static ResponseVo success(String msg) {
        return new ResponseVo(200,msg,null);
    }
}
