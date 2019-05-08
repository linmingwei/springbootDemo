package com.springboot.demo.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ResourceUtils;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Auther: mingweilin
 * @Date: 4/1/2019 11:16
 * @Description:
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${web.upload-path}")
    private String baseUploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations(ResourceUtils.CLASSPATH_URL_PREFIX+"/static/");
//        registry.addResourceHandler("/images/**").addResourceLocations(ResourceUtils.FILE_URL_PREFIX+"d:/articleImg/");
    }
}
