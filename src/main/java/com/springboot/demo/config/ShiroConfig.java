package com.springboot.demo.config;

import com.springboot.demo.shiro.CustomRealm;
import com.springboot.demo.shiro.RetryLimitCredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.crazycake.shiro.RedisCacheManager;
import org.crazycake.shiro.RedisManager;
import org.crazycake.shiro.RedisSessionDAO;
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
        CustomRealm realm = new CustomRealm();
        realm.setCredentialsMatcher(retryLimitCredentialsMatcher());
        return realm;
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
        shiroFilterFactoryBean.setLoginUrl("/login");
        shiroFilterFactoryBean.setSuccessUrl("/admin/home");
        Map<String ,String > filterMap = new LinkedHashMap<>();
        filterMap.put("/static/**","anon");
        filterMap.put("/webjars/**","anon");
        filterMap.put("/toLogin","anon");
        filterMap.put("/admin/**","authc");
        filterMap.put("/**","anon");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterMap);
        return shiroFilterFactoryBean;
    }
    /**
     * 开启shiro aop注解支持.
     * 使用代理方式;所以需要开启代码支持;
     *
     * @param securityManager
     * @return
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    @Bean(name = "retryLimitCredentialsMatcher")
    public RetryLimitCredentialsMatcher retryLimitCredentialsMatcher() {
        RetryLimitCredentialsMatcher credentialsMatcher = new RetryLimitCredentialsMatcher();
        credentialsMatcher.setHashAlgorithmName("MD5");
        //加密次数
        credentialsMatcher.setHashIterations(1024);
        credentialsMatcher.setStoredCredentialsHexEncoded(true);
        return credentialsMatcher;

    }
//    /**
//     * 配置shiro redisManager
//     * 使用的是shiro-redis开源插件
//     *
//     * @return
//     */
//    public RedisManager redisManager() {
//        CustomRedisManager redisManager = new CustomRedisManager();
//        redisManager.setHost(redisProperties.getHost());
//        redisManager.setPort(redisProperties.getPort());
//        redisManager.setDatabase(redisProperties.getDatabase());
//        redisManager.setExpire(redisProperties.getExpire());
//        redisManager.setTimeout(redisProperties.getTimeout().getNano()*1000);
//        redisManager.setPassword(redisProperties.getPassword());
//        return redisManager;
//    }
//
//    /**
//     * cacheManager 缓存 redis实现
//     * 使用的是shiro-redis开源插件
//     *
//     * @return
//     */
//    @Bean
//    public RedisCacheManager redisCacheManager() {
//        RedisCacheManager redisCacheManager = new RedisCacheManager();
//        redisCacheManager.setRedisManager(redisManager());
//        return redisCacheManager;
//    }
//
//
//    /**
//     * RedisSessionDAO shiro sessionDao层的实现 通过redis
//     * 使用的是shiro-redis开源插件
//     */
////    @Bean
//    public RedisSessionDAO redisSessionDAO() {
//        RedisSessionDAO redisSessionDAO = new RedisSessionDAO();
//        redisSessionDAO.setRedisManager(redisManager());
//        return redisSessionDAO;
//    }
//
//    /**
//     * shiro session的管理
//     */
//    @Bean
//    public DefaultWebSessionManager sessionManager() {
//        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
//        sessionManager.setSessionDAO(redisSessionDAO());
//        return sessionManager;
//    }


}
