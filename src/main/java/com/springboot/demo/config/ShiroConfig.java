package com.springboot.demo.config;

import com.springboot.demo.shiro.CustomRealm;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Auther: mingweilin
 * @Date: 5/14/2019 19:04
 * @Description:
 */
@Configuration
public class ShiroConfig {
    @Bean(name = "customRealm")
    public CustomRealm customRealm() {
        return new CustomRealm();
    }

    @Bean(name = "securityManager")
    public DefaultWebSecurityManager securityManager(@Qualifier("customRealm") CustomRealm customRealm) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(customRealm);
        return securityManager;
    }

    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }
    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean(@Qualifier("securityManager") DefaultWebSecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        shiroFilterFactoryBean.setLoginUrl("/admin");
        shiroFilterFactoryBean.setSuccessUrl("/admin/home");
        Map<String ,String > filterMap = new LinkedHashMap<>();
        filterMap.put("/","anon");
        filterMap.put("/admin/**","authc");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterMap);
        return shiroFilterFactoryBean;
    }
}
