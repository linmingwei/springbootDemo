package com.springboot.demo;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.Test;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 10:38
 **/
public class HashedTest {
    @Test
    public void test() {
        String hashAlgorithmName = "MD5";//加密方式
        Object crdentials = "root";//密码原值
        Object salt = "root";//盐值
        int hashIterations = 1024;//加密1024次
        Object result = new SimpleHash(hashAlgorithmName,crdentials,salt,hashIterations);
        System.out.println(result);
    }
}
