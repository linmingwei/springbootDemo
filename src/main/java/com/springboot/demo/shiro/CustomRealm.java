package com.springboot.demo.shiro;

import com.springboot.demo.entity.Resources;
import com.springboot.demo.entity.User;
import com.springboot.demo.service.ResourcesService;
import com.springboot.demo.service.RoleService;
import com.springboot.demo.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


/**
 * @Auther: mingweilin
 * @Date: 5/14/2019 19:05
 * @Description:
 */

public class CustomRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;
    @Autowired
    private ResourcesService resourcesService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals){
        User user = (User) principals.getPrimaryPrincipal();
        List<Resources> resources = userService.findPermissionsByUserId(user.getId());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        resources.forEach(resource ->{
            if (resource.getPermission() != null) {
            info.addStringPermission(resource.getPermission());
            }
        });
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        User user = userService.findByName(username);
        if (user == null) {
            return null;
        }
        ByteSource salt = ByteSource.Util.bytes(username);

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(),salt, getName());
        return info;
    }
}
