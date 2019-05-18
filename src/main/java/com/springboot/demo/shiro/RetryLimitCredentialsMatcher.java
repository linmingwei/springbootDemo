package com.springboot.demo.shiro;

import com.springboot.demo.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.concurrent.TimeUnit;

/**
 * @author ldd
 * @desc
 * @create 2019-05-18 11:58
 **/
public class RetryLimitCredentialsMatcher extends HashedCredentialsMatcher {
    /**
     * 用户登录次数计数
     */
    private static final String SHIRO_LOGIN_COUNT = "shiro_login_count_";
    /**
     * 用户是否被锁定
     */
    private static final String SHIRO_IS_LOCK = "shiro_is_lock_";
    /**
     * 最大尝试次数
     */
    private static final int MAX_RETRY_LIMIT = 7;

    @Autowired
    UserService userService;
    @Autowired
    RedisTemplate redisTemplate;

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        String username = (String) info.getPrincipals().getPrimaryPrincipal();
        String loginCountKey = SHIRO_LOGIN_COUNT + username;
        String isLock = SHIRO_IS_LOCK + username;
        //每次登录计数加1
        ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
        valueOperations.increment(loginCountKey, 1);

        if (redisTemplate.hasKey(isLock)) {
            throw new ExcessiveAttemptsException("帐号[" + username + "]已被禁止登录！");
        }
        String loginCount = String.valueOf(valueOperations.get(loginCountKey));
        Integer retryCount = MAX_RETRY_LIMIT - Integer.parseInt(loginCount);
        if (retryCount <= 0) {
            valueOperations.set(isLock, "LOCK");
            redisTemplate.expire(loginCountKey, 30, TimeUnit.MINUTES);
            redisTemplate.expire(isLock, 30, TimeUnit.MINUTES);
            throw new ExcessiveAttemptsException("由于密码输入错误次数过多，帐号[" + username + "]已被禁止登录！");
        }
        boolean matches = super.doCredentialsMatch(token, info);
        if (!matches) {
            String msg = retryCount <= 0 ? "您的账号已被锁定，30分钟内禁止登录" : "用户名或密码错误，您还剩" + retryCount + "次重试的机会";
            throw new ExcessiveAttemptsException(msg);
        }
        //清空登录计数
        redisTemplate.delete(loginCountKey);

        return true;
    }
}
