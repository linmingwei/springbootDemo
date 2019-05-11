package com.springboot.demo.config;

import org.pegdown.PegDownProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor;
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
    public MethodValidationPostProcessor methodValidationPostProcessor() {
        return new MethodValidationPostProcessor();
    }

    @Bean
    public PegDownProcessor peg() {
        return new PegDownProcessor(Integer.MAX_VALUE);
    }
}
