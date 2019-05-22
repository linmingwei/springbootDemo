package com.springboot.demo.config;

import com.jagregory.shiro.freemarker.ShiroTags;
import com.springboot.demo.framework.tag.BaseTag;
import com.springboot.demo.framework.tag.CustomTag;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * @Auther: mingweilin
 * @Date: 4/26/2019 11:26
 * @Description:
 */
@Configuration
public class FreemarkerConfig {

    @Autowired
    protected freemarker.template.Configuration configuration;
    @Autowired
    protected CustomTag customTag;

    //添加自定义标签
    @PostConstruct
    public void setSharedVariable() throws TemplateModelException {
        configuration.setSharedVariable("customTag",customTag);
        configuration.setSharedVariable("shiro",new ShiroTags());
    }
}
