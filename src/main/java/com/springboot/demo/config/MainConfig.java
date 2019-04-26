package com.springboot.demo.config;

import org.pegdown.PegDownProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * @Auther: mingweilin
 * @Date: 4/1/2019 10:41
 * @Description:
 */
@Configuration
public class MainConfig {

    @Bean
    public MultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setMaxUploadSize(1000000);
        return resolver;
    }

    @Bean
    public PegDownProcessor peg() {
        return new PegDownProcessor(Integer.MAX_VALUE);
    }
}
