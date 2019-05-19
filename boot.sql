-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for CYGWIN (x86_64)
--
-- Host: 127.0.0.1    Database: bootdemo
-- ------------------------------------------------------
-- Server version	5.6.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` int(11) unsigned DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `typeId` int(22) unsigned NOT NULL,
  `comment` tinyint(1) unsigned zerofill DEFAULT '1',
  `top` tinyint(1) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  `look` int(11) DEFAULT '0',
  `favorite` int(11) DEFAULT '0',
  `contentHTML` text NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (110,'test','# OneBlog简介\n    OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\n\n    **网站预览**\n\n    [https://www.zhyd.me](https://www.zhyd.me)\n\n    **开源地址**\n    1. [Gitee](https://gitee.com/yadong.zhang/DBlog)\n    2. [Github](https://github.com/zhangyd-c/DBlog)\n\n    ## 写在前面的话\n    ps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：\n\n    发现更新代码了 --> 下载源码后重复上面的步骤\n    发现没更新代码 --> 直接关闭浏览器\n\n    虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\n\n    **如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\n\n\n    ### 开发环境\n\n    | 工具    | 版本或描述                |\n    | ----- | -------------------- |\n    | OS    | Windows 7            |\n    | JDK   | 1.7                  |\n    | IDE   | IntelliJ IDEA 2017.3 |\n    | Maven | 3.3.1                |\n    | MySQL | 5.6.4                |\n\n    ### 模块划分\n\n    | 模块         | 释义                      |\n    | ---------- | ----------------------- |\n    | blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\n    | blog-admin | 后台管理模块                  |\n    | blog-web   | 前台模块                    |\n\n\n    ### 技术栈\n\n    - Springboot 1.5.9\n    - Apache Shiro 1.2.2\n    - Logback\n    - Redis\n    - Lombok\n    - Websocket\n    - MySQL、Mybatis、Mapper、Pagehelper\n    - Freemarker\n    - Bootstrap 3.3.0\n    - wangEditor\n    - jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\n    - 阿里云OSS\n    - kaptcha\n    - Qiniu\n    - ...\n\n\n    ### 使用方法\n\n    1. 使用IDE导入本项目\n    2. 新建数据库`CREATE DATABASE dblog;`\n    3. 导入数据库`docs/db/dblog.sql`\n    4. 修改(`resources/application.yml`)配置文件\n    1. 数据库链接属性(可搜索`datasource`或定位到L.19)\n    2. redis配置(可搜索`redis`或定位到L.69)\n    3. mail配置(可搜索`mail`或定位到L.89)\n    4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)\n    注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\n    5. 运行项目(三种方式)\n    1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\n    2. 项目根目录下执行`mvn springboot:run`\n    3. 直接运行`BlogWebApplication.java`\n    6. 浏览器访问`http://127.0.0.1:8443`\n\n\n    **后台用户**\n\n    _超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\n\n    _普通管理员_： 账号：admin  密码：123456\n\n    _评论审核管理员_： 账号：comment-admin  密码：123456\n\n    注：后台用户的创建，尽可能做到**权限最小化**\n\n    更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】\n\n    ### 更新日志\n\n    2018-06-10\n\n    **修改功能：**\n\n    新增：\n    markdown版的编辑器、评论框\n    控制文章的评论框是否显示\n    修改密码功能\n    优化：相关页面进行优化\n\n    2018-06-05\n\n    **修改功能：**\n\n    修复： admin用户首页报错的问题\n\n    优化：\n    1. ROOT用户默认拥有所有权限\n    2. admin页面改为macro引用的方式\n    3. 登录界面\n    4. 日志记录\n\n    2018-05-25\n\n    **修改功能：**\n\n    1. 修复后台标签等分页失败的问题\n    2. 修复前台自动申请友链失败的问题\n    3. 其他一些问题\n\n\n    2018-05-22\n\n    **修改功能：**\n\n    1. 完善shiro权限（数据库、页面）。注：需要重新执行下`sys_resources`和`sys_role_resources`两张表的`insert`语句\n    2. redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 **强烈建议**设置下密码）\n\n    2018-05-18\n\n    **修复bug：**\n\n    1. web端自动申请友链后不显示的问题\n    2. config表修改后不能实时刷新的问题\n\n    **增加功能：**\n    1. 网站赞赏码\n    2. 百度推送功能(链接提交到百度站长平台)\n\n    **修改功能：**\n    1. 百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理\n    3. admin模块菜单通过标签实时获取\n    3. 弹窗工具类js结构调整\n\n    你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群[190886500](http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60)，进群可以选择性的备注：~~欧巴群主我爱你~~(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：`我猜群主一定很帅`\n\n    ### 图片预览\n\n    **前台页面**\n    ![PC-首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0)\n    ![PC-文章详情页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0)\n    ![手机](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0)\n    **后台页面**\n    ![首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0)\n    ![菜单](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0)\n    ![文章列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0)\n    ![发表文章](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0)\n    ![markdown版的编辑器](https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0',0,'这是第10篇文章',NULL,'2019-05-08 23:57:27',4,1,NULL,0,99999,0,'<h1><a href=\"#oneblog简介\" name=\"oneblog简介\"></a>OneBlog简介</h1>\n<pre><code>OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\n\n**网站预览**\n\n[https://www.zhyd.me](https://www.zhyd.me)\n\n**开源地址**\n1. [Gitee](https://gitee.com/yadong.zhang/DBlog)\n2. [Github](https://github.com/zhangyd-c/DBlog)\n\n## 写在前面的话\nps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：\n\n发现更新代码了 --&gt; 下载源码后重复上面的步骤\n发现没更新代码 --&gt; 直接关闭浏览器\n\n虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\n\n**如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\n\n\n### 开发环境\n\n| 工具    | 版本或描述                |\n| ----- | -------------------- |\n| OS    | Windows 7            |\n| JDK   | 1.7                  |\n| IDE   | IntelliJ IDEA 2017.3 |\n| Maven | 3.3.1                |\n| MySQL | 5.6.4                |\n\n### 模块划分\n\n| 模块         | 释义                      |\n| ---------- | ----------------------- |\n| blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\n| blog-admin | 后台管理模块                  |\n| blog-web   | 前台模块                    |\n\n\n### 技术栈\n\n- Springboot 1.5.9\n- Apache Shiro 1.2.2\n- Logback\n- Redis\n- Lombok\n- Websocket\n- MySQL、Mybatis、Mapper、Pagehelper\n- Freemarker\n- Bootstrap 3.3.0\n- wangEditor\n- jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\n- 阿里云OSS\n- kaptcha\n- Qiniu\n- ...\n\n\n### 使用方法\n\n1. 使用IDE导入本项目\n2. 新建数据库`CREATE DATABASE dblog;`\n3. 导入数据库`docs/db/dblog.sql`\n4. 修改(`resources/application.yml`)配置文件\n1. 数据库链接属性(可搜索`datasource`或定位到L.19)\n2. redis配置(可搜索`redis`或定位到L.69)\n3. mail配置(可搜索`mail`或定位到L.89)\n4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)\n注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\n5. 运行项目(三种方式)\n1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\n2. 项目根目录下执行`mvn springboot:run`\n3. 直接运行`BlogWebApplication.java`\n6. 浏览器访问`http://127.0.0.1:8443`\n\n\n**后台用户**\n\n_超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\n\n_普通管理员_： 账号：admin  密码：123456\n\n_评论审核管理员_： 账号：comment-admin  密码：123456\n\n注：后台用户的创建，尽可能做到**权限最小化**\n\n更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】\n\n### 更新日志\n\n2018-06-10\n\n**修改功能：**\n\n新增：\nmarkdown版的编辑器、评论框\n控制文章的评论框是否显示\n修改密码功能\n优化：相关页面进行优化\n\n2018-06-05\n\n**修改功能：**\n\n修复： admin用户首页报错的问题\n\n优化：\n1. ROOT用户默认拥有所有权限\n2. admin页面改为macro引用的方式\n3. 登录界面\n4. 日志记录\n\n2018-05-25\n\n**修改功能：**\n\n1. 修复后台标签等分页失败的问题\n2. 修复前台自动申请友链失败的问题\n3. 其他一些问题\n\n\n2018-05-22\n\n**修改功能：**\n\n1. 完善shiro权限（数据库、页面）。注：需要重新执行下`sys_resources`和`sys_role_resources`两张表的`insert`语句\n2. redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 **强烈建议**设置下密码）\n\n2018-05-18\n\n**修复bug：**\n\n1. web端自动申请友链后不显示的问题\n2. config表修改后不能实时刷新的问题\n\n**增加功能：**\n1. 网站赞赏码\n2. 百度推送功能(链接提交到百度站长平台)\n\n**修改功能：**\n1. 百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理\n3. admin模块菜单通过标签实时获取\n3. 弹窗工具类js结构调整\n\n你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群[190886500](http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60)，进群可以选择性的备注：~~欧巴群主我爱你~~(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：`我猜群主一定很帅`\n\n### 图片预览\n\n**前台页面**\n![PC-首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0)\n![PC-文章详情页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0)\n![手机](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0)\n**后台页面**\n![首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0)\n![菜单](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0)\n![文章列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0)\n![发表文章](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0)\n![markdown版的编辑器](https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0\n</code></pre>','1557382057203.jpg'),(111,'test','哦哦对是哦',0,'这是第11篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,0,0,'',NULL),(112,'test','哦哦对是哦',0,'这是第12篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,0,0,'',NULL),(113,'test','哦哦对是哦',0,'这是第13篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(114,'test','哦哦对是哦',0,'这是第14篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(115,'test','哦哦对是哦',0,'这是第15篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(116,'test','哦哦对是哦',0,'这是第16篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(117,'test','# OneBlog简介\r\n    OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\r\n\r\n    **网站预览**\r\n\r\n    [https://www.zhyd.me](https://www.zhyd.me)\r\n\r\n    **开源地址**\r\n    1. [Gitee](https://gitee.com/yadong.zhang/DBlog)\r\n    2. [Github](https://github.com/zhangyd-c/DBlog)\r\n\r\n    ## 写在前面的话\r\n    ps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：\r\n\r\n    发现更新代码了 --> 下载源码后重复上面的步骤\r\n    发现没更新代码 --> 直接关闭浏览器\r\n\r\n    虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\r\n\r\n    **如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\r\n\r\n\r\n    ### 开发环境\r\n\r\n    | 工具    | 版本或描述                |\r\n    | ----- | -------------------- |\r\n    | OS    | Windows 7            |\r\n    | JDK   | 1.7+                 |\r\n    | IDE   | IntelliJ IDEA 2017.3 |\r\n    | Maven | 3.3.1                |\r\n    | MySQL | 5.6.4                |\r\n\r\n    ### 模块划分\r\n\r\n    | 模块         | 释义                      |\r\n    | ---------- | ----------------------- |\r\n    | blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\r\n    | blog-admin | 后台管理模块                  |\r\n    | blog-web   | 前台模块                    |\r\n\r\n\r\n    ### 技术栈\r\n\r\n    - Springboot 1.5.9\r\n    - Apache Shiro 1.2.2\r\n    - Logback\r\n    - Redis\r\n    - Lombok\r\n    - Websocket\r\n    - MySQL、Mybatis、Mapper、Pagehelper\r\n    - Freemarker\r\n    - Bootstrap 3.3.0\r\n    - wangEditor\r\n    - jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\r\n    - 阿里云OSS\r\n    - kaptcha\r\n    - Qiniu\r\n    - ...\r\n\r\n\r\n    ### 使用方法\r\n\r\n    1. 使用IDE导入本项目\r\n    2. 新建数据库`CREATE DATABASE dblog;`\r\n    3. 导入数据库`docs/db/dblog.sql`\r\n    4. 修改(`resources/application.yml`)配置文件\r\n    1. 数据库链接属性(可搜索`datasource`或定位到L.19)\r\n    2. redis配置(可搜索`redis`或定位到L.69)\r\n    3. mail配置(可搜索`mail`或定位到L.89)\r\n    4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)\r\n    注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\r\n    5. 运行项目(三种方式)\r\n    1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\r\n    2. 项目根目录下执行`mvn springboot:run`\r\n    3. 直接运行`BlogWebApplication.java`\r\n    6. 浏览器访问`http://127.0.0.1:8443`\r\n\r\n\r\n    **后台用户**\r\n\r\n    _超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\r\n\r\n    _普通管理员_： 账号：admin  密码：123456\r\n\r\n    _评论审核管理员_： 账号：comment-admin  密码：123456\r\n\r\n    注：后台用户的创建，尽可能做到**权限最小化**\r\n\r\n    更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】\r\n\r\n    ### 更新日志\r\n\r\n    2018-06-10\r\n\r\n    **修改功能：**\r\n\r\n    新增：\r\n    markdown版的编辑器、评论框\r\n    控制文章的评论框是否显示\r\n    修改密码功能\r\n    优化：相关页面进行优化\r\n\r\n    2018-06-05\r\n\r\n    **修改功能：**\r\n\r\n    修复： admin用户首页报错的问题\r\n\r\n    优化：\r\n    1. ROOT用户默认拥有所有权限\r\n    2. admin页面改为macro引用的方式\r\n    3. 登录界面\r\n    4. 日志记录\r\n\r\n    2018-05-25\r\n\r\n    **修改功能：**\r\n\r\n    1. 修复后台标签等分页失败的问题\r\n    2. 修复前台自动申请友链失败的问题\r\n    3. 其他一些问题\r\n\r\n\r\n    2018-05-22\r\n\r\n    **修改功能：**\r\n\r\n    1. 完善shiro权限（数据库、页面）。注：需要重新执行下`sys_resources`和`sys_role_resources`两张表的`insert`语句\r\n    2. redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 **强烈建议**设置下密码）\r\n\r\n    2018-05-18\r\n\r\n    **修复bug：**\r\n\r\n    1. web端自动申请友链后不显示的问题\r\n    2. config表修改后不能实时刷新的问题\r\n\r\n    **增加功能：**\r\n    1. 网站赞赏码\r\n    2. 百度推送功能(链接提交到百度站长平台)\r\n\r\n    **修改功能：**\r\n    1. 百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理\r\n    3. admin模块菜单通过标签实时获取\r\n    3. 弹窗工具类js结构调整\r\n\r\n    你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群[190886500](http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60)，进群可以选择性的备注：~~欧巴群主我爱你~~(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：`我猜群主一定很帅`\r\n\r\n    ### 图片预览\r\n\r\n    **前台页面**\r\n    ![PC-首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0)\r\n    ![PC-文章详情页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0)\r\n    ![手机](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0)\r\n    **后台页面**\r\n    ![首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0)\r\n    ![菜单](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0)\r\n    ![文章列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0)\r\n    ![发表文章](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0)\r\n    ![markdown版的编辑器](https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0 \"markdown版的编辑器\")\r\n    ![角色列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role.png?v=1.0)\r\n    ![角色分配](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role2.png?v=1.0)\r\n\r\n\r\n    ### 生命不息，折腾不止！ 更多信息，请关注：\r\n    1. [我的博客](https://www.zhyd.me)\r\n    2. [我的微博](http://weibo.com/211230415)\r\n    3. [我的头条号](http://www.toutiao.com/c/user/3286958681/)\r\n    4. [我的mooc](http://www.imooc.com/u/1175248/articles)\r\n\r\n    ### 有任何问题可以\r\n    - [给我留言](https://www.zhyd.me/guestbook)\r\n\r\n\r\n    ### 开源协议\r\n\r\n    [MIT](https://gitee.com/yadong.zhang/OneBlog/blob/master/LICENSE)',0,'这是第17篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,1,NULL,0,0,'',NULL),(118,'test','哦哦对是哦',0,'这是第18篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(119,'test','    ## Try CommonMark\r\n\r\n    You can try CommonMark here.  This dingus is powered by\r\n    [commonmark.js](https://github.com/jgm/commonmark.js), the\r\n    JavaScript reference implementation.\r\n\r\n    1. item one\r\n    2. item two\r\n    - sublist\r\n    - sublist\r\n',0,'这是第19篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(120,'test','哦哦对是哦',0,'这是第20篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(121,'test','# OneBlog简介\r\n    OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\r\n\r\n    **网站预览**\r\n\r\n    [https://www.zhyd.me](https://www.zhyd.me)\r\n\r\n    **开源地址**\r\n    1. [Gitee](https://gitee.com/yadong.zhang/DBlog)\r\n    2. [Github](https://github.com/zhangyd-c/DBlog)\r\n\r\n    ## 写在前面的话\r\n    ps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：\r\n\r\n    发现更新代码了 --> 下载源码后重复上面的步骤\r\n    发现没更新代码 --> 直接关闭浏览器\r\n\r\n    虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\r\n\r\n    **如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\r\n\r\n\r\n    ### 开发环境\r\n\r\n    | 工具    | 版本或描述                |\r\n    | ----- | -------------------- |\r\n    | OS    | Windows 7            |\r\n    | JDK   | 1.7+                 |\r\n    | IDE   | IntelliJ IDEA 2017.3 |\r\n    | Maven | 3.3.1                |\r\n    | MySQL | 5.6.4                |\r\n\r\n    ### 模块划分\r\n\r\n    | 模块         | 释义                      |\r\n    | ---------- | ----------------------- |\r\n    | blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\r\n    | blog-admin | 后台管理模块                  |\r\n    | blog-web   | 前台模块                    |\r\n\r\n\r\n    ### 技术栈\r\n\r\n    - Springboot 1.5.9\r\n    - Apache Shiro 1.2.2\r\n    - Logback\r\n    - Redis\r\n    - Lombok\r\n    - Websocket\r\n    - MySQL、Mybatis、Mapper、Pagehelper\r\n    - Freemarker\r\n    - Bootstrap 3.3.0\r\n    - wangEditor\r\n    - jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\r\n    - 阿里云OSS\r\n    - kaptcha\r\n    - Qiniu\r\n    - ...\r\n\r\n\r\n    ### 使用方法\r\n\r\n    1. 使用IDE导入本项目\r\n    2. 新建数据库`CREATE DATABASE dblog;`\r\n    3. 导入数据库`docs/db/dblog.sql`\r\n    4. 修改(`resources/application.yml`)配置文件\r\n    1. 数据库链接属性(可搜索`datasource`或定位到L.19)\r\n    2. redis配置(可搜索`redis`或定位到L.69)\r\n    3. mail配置(可搜索`mail`或定位到L.89)\r\n    4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)\r\n    注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\r\n    5. 运行项目(三种方式)\r\n    1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\r\n    2. 项目根目录下执行`mvn springboot:run`\r\n    3. 直接运行`BlogWebApplication.java`\r\n    6. 浏览器访问`http://127.0.0.1:8443`\r\n\r\n\r\n    **后台用户**\r\n\r\n    _超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\r\n\r\n    _普通管理员_： 账号：admin  密码：123456\r\n\r\n    _评论审核管理员_： 账号：comment-admin  密码：123456\r\n\r\n    注：后台用户的创建，尽可能做到**权限最小化**\r\n\r\n    更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】\r\n\r\n    ### 更新日志\r\n\r\n    2018-06-10\r\n\r\n    **修改功能：**\r\n\r\n    新增：\r\n    markdown版的编辑器、评论框\r\n    控制文章的评论框是否显示\r\n    修改密码功能\r\n    优化：相关页面进行优化\r\n\r\n    2018-06-05\r\n\r\n    **修改功能：**\r\n\r\n    修复： admin用户首页报错的问题\r\n\r\n    优化：\r\n    1. ROOT用户默认拥有所有权限\r\n    2. admin页面改为macro引用的方式\r\n    3. 登录界面\r\n    4. 日志记录\r\n\r\n    2018-05-25\r\n\r\n    **修改功能：**\r\n\r\n    1. 修复后台标签等分页失败的问题\r\n    2. 修复前台自动申请友链失败的问题\r\n    3. 其他一些问题\r\n\r\n\r\n    2018-05-22\r\n\r\n    **修改功能：**\r\n\r\n    1. 完善shiro权限（数据库、页面）。注：需要重新执行下`sys_resources`和`sys_role_resources`两张表的`insert`语句\r\n    2. redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 **强烈建议**设置下密码）\r\n\r\n    2018-05-18\r\n\r\n    **修复bug：**\r\n\r\n    1. web端自动申请友链后不显示的问题\r\n    2. config表修改后不能实时刷新的问题\r\n\r\n    **增加功能：**\r\n    1. 网站赞赏码\r\n    2. 百度推送功能(链接提交到百度站长平台)\r\n\r\n    **修改功能：**\r\n    1. 百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理\r\n    3. admin模块菜单通过标签实时获取\r\n    3. 弹窗工具类js结构调整\r\n\r\n    你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群[190886500](http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60)，进群可以选择性的备注：~~欧巴群主我爱你~~(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：`我猜群主一定很帅`\r\n\r\n    ### 图片预览\r\n\r\n    **前台页面**\r\n    ![PC-首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0)\r\n    ![PC-文章详情页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0)\r\n    ![手机](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0)\r\n    **后台页面**\r\n    ![首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0)\r\n    ![菜单](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0)\r\n    ![文章列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0)\r\n    ![发表文章](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0)\r\n    ![markdown版的编辑器](https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0 \"markdown版的编辑器\")\r\n    ![角色列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role.png?v=1.0)\r\n    ![角色分配](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role2.png?v=1.0)\r\n\r\n\r\n    ### 生命不息，折腾不止！ 更多信息，请关注：\r\n    1. [我的博客](https://www.zhyd.me)\r\n    2. [我的微博](http://weibo.com/211230415)\r\n    3. [我的头条号](http://www.toutiao.com/c/user/3286958681/)\r\n    4. [我的mooc](http://www.imooc.com/u/1175248/articles)\r\n\r\n    ### 有任何问题可以\r\n    - [给我留言](https://www.zhyd.me/guestbook)\r\n\r\n\r\n    ### 开源协议\r\n\r\n    [MIT](https://gitee.com/yadong.zhang/OneBlog/blob/master/LICENSE)',0,'这是第21篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(122,'test','哦哦对是哦',0,'这是第22篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(123,'test','哦哦对是哦',0,'这是第23篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(124,'test','# OneBlog简介\r\n    OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\r\n\r\n    **网站预览**\r\n\r\n    [https://www.zhyd.me](https://www.zhyd.me)\r\n\r\n    **开源地址**\r\n    1. [Gitee](https://gitee.com/yadong.zhang/DBlog)\r\n    2. [Github](https://github.com/zhangyd-c/DBlog)\r\n\r\n    ## 写在前面的话\r\n    ps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：\r\n\r\n    发现更新代码了 --> 下载源码后重复上面的步骤\r\n    发现没更新代码 --> 直接关闭浏览器\r\n\r\n    虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\r\n\r\n    **如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\r\n\r\n\r\n    ### 开发环境\r\n\r\n    | 工具    | 版本或描述                |\r\n    | ----- | -------------------- |\r\n    | OS    | Windows 7            |\r\n    | JDK   | 1.7+                 |\r\n    | IDE   | IntelliJ IDEA 2017.3 |\r\n    | Maven | 3.3.1                |\r\n    | MySQL | 5.6.4                |\r\n\r\n    ### 模块划分\r\n\r\n    | 模块         | 释义                      |\r\n    | ---------- | ----------------------- |\r\n    | blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\r\n    | blog-admin | 后台管理模块                  |\r\n    | blog-web   | 前台模块                    |\r\n\r\n\r\n    ### 技术栈\r\n\r\n    - Springboot 1.5.9\r\n    - Apache Shiro 1.2.2\r\n    - Logback\r\n    - Redis\r\n    - Lombok\r\n    - Websocket\r\n    - MySQL、Mybatis、Mapper、Pagehelper\r\n    - Freemarker\r\n    - Bootstrap 3.3.0\r\n    - wangEditor\r\n    - jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\r\n    - 阿里云OSS\r\n    - kaptcha\r\n    - Qiniu\r\n    - ...\r\n\r\n\r\n    ### 使用方法\r\n\r\n    1. 使用IDE导入本项目\r\n    2. 新建数据库`CREATE DATABASE dblog;`\r\n    3. 导入数据库`docs/db/dblog.sql`\r\n    4. 修改(`resources/application.yml`)配置文件\r\n    1. 数据库链接属性(可搜索`datasource`或定位到L.19)\r\n    2. redis配置(可搜索`redis`或定位到L.69)\r\n    3. mail配置(可搜索`mail`或定位到L.89)\r\n    4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)\r\n    注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\r\n    5. 运行项目(三种方式)\r\n    1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\r\n    2. 项目根目录下执行`mvn springboot:run`\r\n    3. 直接运行`BlogWebApplication.java`\r\n    6. 浏览器访问`http://127.0.0.1:8443`\r\n\r\n\r\n    **后台用户**\r\n\r\n    _超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\r\n\r\n    _普通管理员_： 账号：admin  密码：123456\r\n\r\n    _评论审核管理员_： 账号：comment-admin  密码：123456\r\n\r\n    注：后台用户的创建，尽可能做到**权限最小化**\r\n\r\n    更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】\r\n\r\n    ### 更新日志\r\n\r\n    2018-06-10\r\n\r\n    **修改功能：**\r\n\r\n    新增：\r\n    markdown版的编辑器、评论框\r\n    控制文章的评论框是否显示\r\n    修改密码功能\r\n    优化：相关页面进行优化\r\n\r\n    2018-06-05\r\n\r\n    **修改功能：**\r\n\r\n    修复： admin用户首页报错的问题\r\n\r\n    优化：\r\n    1. ROOT用户默认拥有所有权限\r\n    2. admin页面改为macro引用的方式\r\n    3. 登录界面\r\n    4. 日志记录\r\n\r\n    2018-05-25\r\n\r\n    **修改功能：**\r\n\r\n    1. 修复后台标签等分页失败的问题\r\n    2. 修复前台自动申请友链失败的问题\r\n    3. 其他一些问题\r\n\r\n\r\n    2018-05-22\r\n\r\n    **修改功能：**\r\n\r\n    1. 完善shiro权限（数据库、页面）。注：需要重新执行下`sys_resources`和`sys_role_resources`两张表的`insert`语句\r\n    2. redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 **强烈建议**设置下密码）\r\n\r\n    2018-05-18\r\n\r\n    **修复bug：**\r\n\r\n    1. web端自动申请友链后不显示的问题\r\n    2. config表修改后不能实时刷新的问题\r\n\r\n    **增加功能：**\r\n    1. 网站赞赏码\r\n    2. 百度推送功能(链接提交到百度站长平台)\r\n\r\n    **修改功能：**\r\n    1. 百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理\r\n    3. admin模块菜单通过标签实时获取\r\n    3. 弹窗工具类js结构调整\r\n\r\n    你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群[190886500](http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60)，进群可以选择性的备注：~~欧巴群主我爱你~~(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：`我猜群主一定很帅`\r\n\r\n    ### 图片预览\r\n\r\n    **前台页面**\r\n    ![PC-首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0)\r\n    ![PC-文章详情页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0)\r\n    ![手机](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0)\r\n    **后台页面**\r\n    ![首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0)\r\n    ![菜单](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0)\r\n    ![文章列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0)\r\n    ![发表文章](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0)\r\n    ![markdown版的编辑器](https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0 \"markdown版的编辑器\")\r\n    ![角色列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role.png?v=1.0)\r\n    ![角色分配](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role2.png?v=1.0)\r\n\r\n\r\n    ### 生命不息，折腾不止！ 更多信息，请关注：\r\n    1. [我的博客](https://www.zhyd.me)\r\n    2. [我的微博](http://weibo.com/211230415)\r\n    3. [我的头条号](http://www.toutiao.com/c/user/3286958681/)\r\n    4. [我的mooc](http://www.imooc.com/u/1175248/articles)\r\n\r\n    ### 有任何问题可以\r\n    - [给我留言](https://www.zhyd.me/guestbook)\r\n\r\n\r\n    ### 开源协议\r\n\r\n    [MIT](https://gitee.com/yadong.zhang/OneBlog/blob/master/LICENSE)',0,'这是第24篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(125,'test','    ## Try CommonMark\r\n\r\n    You can try CommonMark here.  This dingus is powered by\r\n    [commonmark.js](https://github.com/jgm/commonmark.js), the\r\n    JavaScript reference implementation.\r\n\r\n    1. item one\r\n    2. item two\r\n    - sublist\r\n    - sublist\r\n',0,'这是第25篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(126,'test','    ## Try CommonMark\r\n\r\n    You can try CommonMark here.  This dingus is powered by\r\n    [commonmark.js](https://github.com/jgm/commonmark.js), the\r\n    JavaScript reference implementation.\r\n\r\n    1. item one\r\n    2. item two\r\n    - sublist\r\n    - sublist\r\n',0,'这是第26篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(127,'test','哦哦对是哦',0,'这是第27篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(128,'test','    ## Try CommonMark\r\n\r\n    You can try CommonMark here.  This dingus is powered by\r\n    [commonmark.js](https://github.com/jgm/commonmark.js), the\r\n    JavaScript reference implementation.\r\n\r\n    1. item one\r\n    2. item two\r\n    - sublist\r\n    - sublist\r\n',0,'这是第28篇文章','2019-04-26 06:41:06','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(129,'test','哦哦对是哦',0,'这是第29篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',2,1,0,NULL,0,0,'',NULL),(130,'test','哦哦对是哦',0,'这是第30篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',4,1,0,NULL,0,0,'',NULL),(131,'test','哦哦对是哦',0,'这是第31篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,0,0,'',NULL),(132,'test','哦哦对是哦',0,'这是第32篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,0,0,'',NULL),(133,'test','哦哦对是哦',0,'这是第33篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,0,0,'',NULL),(134,'test','# OneBlog简介\r\n    OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。\r\n\r\n    **网站预览**\r\n\r\n    [https://www.zhyd.me](https://www.zhyd.me)\r\n\r\n    **开源地址**\r\n    1. [Gitee](https://gitee.com/yadong.zhang/DBlog)\r\n    2. [Github](https://github.com/zhangyd-c/DBlog)\r\n\r\n    ## 写在前面的话\r\n    ps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：\r\n\r\n    发现更新代码了 --> 下载源码后重复上面的步骤\r\n    发现没更新代码 --> 直接关闭浏览器\r\n\r\n    虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：\r\n\r\n    **如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**\r\n\r\n\r\n    ### 开发环境\r\n\r\n    | 工具    | 版本或描述                |\r\n    | ----- | -------------------- |\r\n    | OS    | Windows 7            |\r\n    | JDK   | 1.7+                 |\r\n    | IDE   | IntelliJ IDEA 2017.3 |\r\n    | Maven | 3.3.1                |\r\n    | MySQL | 5.6.4                |\r\n\r\n    ### 模块划分\r\n\r\n    | 模块         | 释义                      |\r\n    | ---------- | ----------------------- |\r\n    | blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |\r\n    | blog-admin | 后台管理模块                  |\r\n    | blog-web   | 前台模块                    |\r\n\r\n\r\n    ### 技术栈\r\n\r\n    - Springboot 1.5.9\r\n    - Apache Shiro 1.2.2\r\n    - Logback\r\n    - Redis\r\n    - Lombok\r\n    - Websocket\r\n    - MySQL、Mybatis、Mapper、Pagehelper\r\n    - Freemarker\r\n    - Bootstrap 3.3.0\r\n    - wangEditor\r\n    - jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck\r\n    - 阿里云OSS\r\n    - kaptcha\r\n    - Qiniu\r\n    - ...\r\n\r\n\r\n    ### 使用方法\r\n\r\n    1. 使用IDE导入本项目\r\n    2. 新建数据库`CREATE DATABASE dblog;`\r\n    3. 导入数据库`docs/db/dblog.sql`\r\n    4. 修改(`resources/application.yml`)配置文件\r\n    1. 数据库链接属性(可搜索`datasource`或定位到L.19)\r\n    2. redis配置(可搜索`redis`或定位到L.69)\r\n    3. mail配置(可搜索`mail`或定位到L.89)\r\n    4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)\r\n    注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容\r\n    5. 运行项目(三种方式)\r\n    1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`\r\n    2. 项目根目录下执行`mvn springboot:run`\r\n    3. 直接运行`BlogWebApplication.java`\r\n    6. 浏览器访问`http://127.0.0.1:8443`\r\n\r\n\r\n    **后台用户**\r\n\r\n    _超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）\r\n\r\n    _普通管理员_： 账号：admin  密码：123456\r\n\r\n    _评论审核管理员_： 账号：comment-admin  密码：123456\r\n\r\n    注：后台用户的创建，尽可能做到**权限最小化**\r\n\r\n    更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】\r\n\r\n    ### 更新日志\r\n\r\n    2018-06-10\r\n\r\n    **修改功能：**\r\n\r\n    新增：\r\n    markdown版的编辑器、评论框\r\n    控制文章的评论框是否显示\r\n    修改密码功能\r\n    优化：相关页面进行优化\r\n\r\n    2018-06-05\r\n\r\n    **修改功能：**\r\n\r\n    修复： admin用户首页报错的问题\r\n\r\n    优化：\r\n    1. ROOT用户默认拥有所有权限\r\n    2. admin页面改为macro引用的方式\r\n    3. 登录界面\r\n    4. 日志记录\r\n\r\n    2018-05-25\r\n\r\n    **修改功能：**\r\n\r\n    1. 修复后台标签等分页失败的问题\r\n    2. 修复前台自动申请友链失败的问题\r\n    3. 其他一些问题\r\n\r\n\r\n    2018-05-22\r\n\r\n    **修改功能：**\r\n\r\n    1. 完善shiro权限（数据库、页面）。注：需要重新执行下`sys_resources`和`sys_role_resources`两张表的`insert`语句\r\n    2. redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 **强烈建议**设置下密码）\r\n\r\n    2018-05-18\r\n\r\n    **修复bug：**\r\n\r\n    1. web端自动申请友链后不显示的问题\r\n    2. config表修改后不能实时刷新的问题\r\n\r\n    **增加功能：**\r\n    1. 网站赞赏码\r\n    2. 百度推送功能(链接提交到百度站长平台)\r\n\r\n    **修改功能：**\r\n    1. 百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理\r\n    3. admin模块菜单通过标签实时获取\r\n    3. 弹窗工具类js结构调整\r\n\r\n    你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群[190886500](http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60)，进群可以选择性的备注：~~欧巴群主我爱你~~(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：`我猜群主一定很帅`\r\n\r\n    ### 图片预览\r\n\r\n    **前台页面**\r\n    ![PC-首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0)\r\n    ![PC-文章详情页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0)\r\n    ![手机](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0)\r\n    **后台页面**\r\n    ![首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0)\r\n    ![菜单](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0)\r\n    ![文章列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0)\r\n    ![发表文章](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0)\r\n    ![markdown版的编辑器](https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0 \"markdown版的编辑器\")\r\n    ![角色列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role.png?v=1.0)\r\n    ![角色分配](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role2.png?v=1.0)\r\n\r\n\r\n    ### 生命不息，折腾不止！ 更多信息，请关注：\r\n    1. [我的博客](https://www.zhyd.me)\r\n    2. [我的微博](http://weibo.com/211230415)\r\n    3. [我的头条号](http://www.toutiao.com/c/user/3286958681/)\r\n    4. [我的mooc](http://www.imooc.com/u/1175248/articles)\r\n\r\n    ### 有任何问题可以\r\n    - [给我留言](https://www.zhyd.me/guestbook)\r\n\r\n\r\n    ### 开源协议\r\n\r\n    [MIT](https://gitee.com/yadong.zhang/OneBlog/blob/master/LICENSE)',0,'这是第34篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,0,0,'',NULL),(135,'test','哦哦对是哦',0,'这是第35篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(136,'test','哦哦对是哦',0,'这是第36篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,0,0,'',NULL),(137,'test','哦哦对是哦',0,'这是第37篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,0,0,'',NULL),(138,'test','哦哦对是哦',0,'这是第38篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,0,0,'',NULL),(139,'test','哦哦对是哦',0,'这是第39篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,0,0,'',NULL),(140,'test','哦哦对是哦',0,'这是第40篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,1,NULL,100,0,'',NULL),(141,'test','哦哦对是哦',0,'这是第41篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,345,0,'',NULL),(142,'test','哦哦对是哦',0,'这是第42篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,23,0,'',NULL),(143,'test','哦哦对是哦',0,'这是第43篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,32145,0,'',NULL),(144,'test','哦哦对是哦',0,'这是第44篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,536,0,'',NULL),(145,'test','哦哦对是哦',0,'这是第45篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',6,1,0,NULL,67,0,'',NULL),(146,'test','哦哦对是哦',0,'这是第46篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,34,0,'',NULL),(147,'test','哦哦对是哦',0,'这是第47篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,12745,0,'',NULL),(148,'test','哦哦对是哦',0,'这是第48篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,245,0,'',NULL),(149,'test','哦哦对是哦',0,'这是第49篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,5634,0,'',NULL),(150,'test','哦哦对是哦',0,'这是第50篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,236,0,'',NULL),(151,'test','哦哦对是哦',0,'这是第51篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,457,0,'',NULL),(152,'test','哦哦对是哦',0,'这是第52篇文章',NULL,'2019-05-08 20:12:06',7,1,NULL,NULL,NULL,NULL,'<p>哦哦对是哦</p>','1557375070868.jpg'),(153,'test','哦哦对是哦',0,'这是第53篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,3457,0,'',NULL),(154,'test','哦哦对是哦',0,'这是第54篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,23,0,'',NULL),(155,'test','哦哦对是哦',0,'这是第55篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,0,0,'',NULL),(156,'test','哦哦对是哦',0,'这是第56篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,0,0,'',NULL),(157,'test','哦哦对是哦',0,'这是第57篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,0,0,'',NULL),(158,'test','哦哦对是哦',0,'这是第58篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',7,1,0,NULL,0,0,'',NULL),(159,'test','哦哦对是哦',0,'这是第59篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(160,'test','哦哦对是哦',0,'这是第60篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(161,'test','哦哦对是哦',0,'这是第61篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(162,'test','哦哦对是哦',0,'这是第62篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(163,'test','哦哦对是哦',0,'这是第63篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(164,'test','哦哦对是哦',0,'这是第64篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(165,'test','哦哦对是哦',0,'这是第65篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(166,'test','哦哦对是哦',0,'这是第66篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(167,'test','哦哦对是哦',0,'这是第67篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(168,'test','哦哦对是哦',0,'这是第68篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(169,'test','哦哦对是哦',0,'这是第69篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(170,'test','哦哦对是哦',0,'这是第70篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(171,'test','哦哦对是哦',0,'这是第71篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(172,'test','哦哦对是哦',0,'这是第72篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',8,1,0,NULL,0,0,'',NULL),(173,'test','哦哦对是哦',0,'这是第73篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(174,'test','哦哦对是哦',0,'这是第74篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(175,'test','哦哦对是哦',0,'这是第75篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(176,'test','哦哦对是哦',0,'这是第76篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',55,1,0,NULL,0,0,'',NULL),(177,'test','哦哦对是哦',0,'这是第77篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(178,'test','哦哦对是哦',0,'这是第78篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(179,'test','哦哦对是哦',0,'这是第79篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(180,'test','哦哦对是哦',0,'这是第80篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(181,'test','哦哦对是哦',0,'这是第81篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(182,'test','哦哦对是哦',0,'这是第82篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(183,'test','哦哦对是哦',0,'这是第83篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(184,'test','哦哦对是哦',0,'这是第84篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(185,'test','哦哦对是哦',0,'这是第85篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(186,'test','哦哦对是哦',0,'这是第86篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(187,'test','哦哦对是哦',0,'这是第87篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(188,'test','哦哦对是哦',0,'这是第88篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(189,'test','哦哦对是哦',0,'这是第89篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(190,'test','哦哦对是哦',0,'这是第90篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(191,'test','哦哦对是哦',0,'这是第91篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(192,'test','哦哦对是哦',0,'这是第92篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(193,'test','哦哦对是哦',0,'这是第93篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(194,'test','哦哦对是哦',0,'这是第94篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(195,'test','哦哦对是哦',0,'这是第95篇文章','2019-05-06 10:04:50','2019-04-14 13:13:21',5,1,0,NULL,0,0,'',NULL),(196,'test','哦哦对是哦',0,'这是第96篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(197,'test','哦哦对是哦',0,'这是第97篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(198,'test','哦哦对是哦',0,'这是第98篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(199,'test','哦哦对是哦',0,'这是第99篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(200,'test','哦哦对是哦',0,'这是第100篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0,'',NULL),(201,'插入时间','怎得是 士大夫',0,NULL,'2019-04-20 15:38:05','2019-04-20 15:37:56',1,0,0,NULL,0,0,'',NULL),(202,'可以的','士大夫士大夫啊',0,NULL,'2019-04-20 15:43:39','2019-04-20 15:39:14',1,0,0,0,0,0,'',NULL),(204,'已发布','是不是已发布',0,'有描述',NULL,NULL,9,1,NULL,NULL,NULL,NULL,'',NULL),(205,'md转html111','# Intro\nGo ahead, play around with the editor! Be sure to check out **bold** and *italic* styling, or even [links](https://google.com). You can type the Markdown syntax, use the toolbar, or use shortcuts like `cmd-b` or `ctrl-b`.\n\n## Lists\nUnordered lists can be started using the toolbar or by typing `* `, `- `, or `  `. Ordered lists can be started by typing `1. `.\n\n#### Unordered\n* Lists are a piece of cake\n* They even auto continue as you type\n* A double enter will end them\n* Tabs and shift-tabs work too\n\n#### Ordered\n1. Numbered lists...\n2. ...work too!\n\n## What about images?\n![Yes](https://i.imgur.com/sZlktY7.png)',0,'阿斯蒂芬',NULL,NULL,7,1,NULL,NULL,NULL,NULL,'',NULL),(206,'md转html222','# Intro\nGo ahead, play around with the editor! Be sure to check out **bold** and *italic* styling, or even [links](https://google.com). You can type the Markdown syntax, use the toolbar, or use shortcuts like `cmd-b` or `ctrl-b`.\n\n## Lists\nUnordered lists can be started using the toolbar or by typing `* `, `- `, or `  `. Ordered lists can be started by typing `1. `.\n\n#### Unordered\n* Lists are a piece of cake\n* They even auto continue as you type\n* A double enter will end them\n* Tabs and shift-tabs work too\n\n#### Ordered\n1. Numbered lists...\n2. ...work too!\n\n## What about images?\n![Yes](https://i.imgur.com/sZlktY7.png)',0,'阿斯',NULL,NULL,11,1,1,NULL,NULL,NULL,'<h1><a href=\"#intro\" name=\"intro\"></a>Intro</h1>\n<p>Go ahead, play around with the editor! Be sure to check out <strong>bold</strong> and <em>italic</em> styling, or even <a href=\"https://google.com\">links</a>. You can type the Markdown syntax, use the toolbar, or use shortcuts like <code>cmd-b</code> or <code>ctrl-b</code>.</p>\n<h2><a href=\"#lists\" name=\"lists\"></a>Lists</h2>\n<p>Unordered lists can be started using the toolbar or by typing <code>*</code>, <code>-</code>, or ` <code>. Ordered lists can be started by typing</code>1. `.</p>\n<h4><a href=\"#unordered\" name=\"unordered\"></a>Unordered</h4>\n<ul>\n  <li>Lists are a piece of cake</li>\n  <li>They even auto continue as you type</li>\n  <li>A double enter will end them</li>\n  <li>Tabs and shift-tabs work too</li>\n</ul>\n<h4><a href=\"#ordered\" name=\"ordered\"></a>Ordered</h4>\n<ol>\n  <li>Numbered lists&hellip;</li>\n  <li>&hellip;work too!</li>\n</ol>\n<h2><a href=\"#what-about-images-\" name=\"what-about-images-\"></a>What about images?</h2>\n<p><img src=\"https://i.imgur.com/sZlktY7.png\" alt=\"Yes\" /></p>',NULL),(207,'这是一个带图片的文章','这是一个带图片的文章这是一个带图片的文章这是一个带图片的文章',0,'这是一个带图片的文章',NULL,NULL,5,1,NULL,NULL,NULL,NULL,'<p>这是一个带图片的文章这是一个带图片的文章这是一个带图片的文章</p>','1557305325713.jpg'),(208,'这是一个标准的MD文章','## 主要内容\n> #### Markdown*是什么*？\n> #### *谁*创造了它？\n> #### *为什么*要使用它？\n> #### *怎么*使用？\n> #### *谁*在用？\n> #### 尝试一下\n\n## 正文\n### 1. Markdown*是什么*？\n**Markdown**是一种轻量级**标记语言**，它以纯文本形式(*易读、易写、易更改*)编写文档，并最终以HTML格式发布。    \n**Markdown**也可以理解为将以MARKDOWN语法编写的语言转换成HTML内容的工具。    \n\n### 2. *谁*创造了它？\n它由[**Aaron Swartz**](http://www.aaronsw.com/)和**John Gruber**共同设计，**Aaron Swartz**就是那位于去年（*2013年1月11日*）自杀,有着**开挂**一般人生经历的程序员。维基百科对他的[介绍](http://zh.wikipedia.org/wiki/亚伦·斯沃茨)是：**软件工程师、作家、政治组织者、互联网活动家、维基百科人**。    \n\n他有着足以让你跪拜的人生经历：    \n  **14岁**参与RSS 1.0规格标准的制订。     \n  **2004**年入读**斯坦福**，之后退学。   \n  **2005**年创建[Infogami](http://infogami.org/)，之后与[Reddit](http://www.reddit.com/)合并成为其合伙人。   \n  **2010**年创立求进会（Demand Progress），积极参与禁止网络盗版法案（SOPA）活动，最终该提案被撤回。   \n  **2011**年7月19日，因被控从MIT和JSTOR下载480万篇学术论文并以免费形式上传于网络被捕。     \n  **2013**年1月自杀身亡。    \n\n![Aaron Swartz](https://github.com/younghz/Markdown/raw/master/resource/Aaron_Swartz.jpg)\n\n天才都有早逝的归途。\n\n### 3. *为什么*要使用它？\n  它是易读（看起来舒服）、易写（语法简单）、易更改**纯文本**。处处体现着**极简主义**的影子。\n  兼容HTML，可以转换为HTML格式发布。\n  跨平台使用。\n  越来越多的网站支持Markdown。\n  更方便清晰地组织你的电子邮件。（Markdown-here, Airmail）\n  摆脱Word（我不是认真的）。\n\n### 4. *怎么*使用？\n如果不算**扩展**，Markdown的语法绝对**简单**到让你爱不释手。\n\nMarkdown语法主要分为如下几大部分：\n**标题**，**段落**，**区块引用**，**代码区块**，**强调**，**列表**，**分割线**，**链接**，**图片**，**反斜杠 `\\`**，**符号\'`\'**。\n\n#### 4.1 标题\n两种形式：  \n1）使用`=`和`-`标记一级和二级标题。\n> 一级标题   \n> `=========`   \n> 二级标题    \n> `---------`\n\n效果：\n> 一级标题   \n> =========   \n> 二级标题\n> ---------  \n\n2）使用`#`，可表示1-6级标题。\n> \\# 一级标题   \n> \\## 二级标题   \n> \\### 三级标题   \n> \\#### 四级标题   \n> \\##### 五级标题   \n> \\###### 六级标题    \n\n效果：\n> # 一级标题   \n> ## 二级标题   \n> ### 三级标题   \n> #### 四级标题   \n> ##### 五级标题   \n> ###### 六级标题\n\n#### 4.2 段落\n段落的前后要有空行，所谓的空行是指没有文字内容。若想在段内强制换行的方式是使用**两个以上**空格加上回车（引用中换行省略回车）。\n\n#### 4.3 区块引用\n在段落的每行或者只在第一行使用符号`>`,还可使用多个嵌套引用，如：\n> \\> 区块引用  \n> \\>> 嵌套引用  \n\n效果：\n> 区块引用  \n>> 嵌套引用\n\n#### 4.4 代码区块\n代码区块的建立是在每行加上4个空格或者一个制表符（如同写代码一样）。如    \n普通段落：\n\nvoid main()    \n{    \n    printf(\"Hello, Markdown.\");    \n}    \n\n代码区块：\n\n    void main()\n    {\n        printf(\"Hello, Markdown.\");\n    }\n\n**注意**:需要和普通段落之间存在空行。\n\n#### 4.5 强调\n在强调内容两侧分别加上`*`或者`_`，如：\n> \\*斜体\\*，\\_斜体\\_    \n> \\*\\*粗体\\*\\*，\\_\\_粗体\\_\\_\n\n效果：\n> *斜体*，_斜体_    \n> **粗体**，__粗体__\n\n#### 4.6 列表\n使用`·`、` `、或`-`标记无序列表，如：\n> \\-（ \\*） 第一项\n> \\-（ \\*） 第二项\n> \\- （ \\*）第三项\n\n**注意**：标记后面最少有一个_空格_或_制表符_。若不在引用区块中，必须和前方段落之间存在空行。\n\n效果：\n>   第一项\n>   第二项\n>   第三项\n\n有序列表的标记方式是将上述的符号换成数字,并辅以`.`，如：\n> 1 . 第一项   \n> 2 . 第二项    \n> 3 . 第三项    \n\n效果：\n> 1. 第一项\n> 2. 第二项\n> 3. 第三项\n\n#### 4.7 分割线\n分割线最常使用就是三个或以上`*`，还可以使用`-`和`_`。\n\n#### 4.8 链接\n链接可以由两种形式生成：**行内式**和**参考式**。    \n**行内式**：\n> \\[younghz的Markdown库\\]\\(https:://github.com/younghz/Markdown \"Markdown\"\\)。\n\n效果：\n> [younghz的Markdown库](https:://github.com/younghz/Markdown \"Markdown\")。\n\n**参考式**：\n> \\[younghz的Markdown库1\\]\\[1\\]    \n> \\[younghz的Markdown库2\\]\\[2\\]    \n> \\[1\\]:https:://github.com/younghz/Markdown \"Markdown\"    \n> \\[2\\]:https:://github.com/younghz/Markdown \"Markdown\"    \n\n效果：\n> [younghz的Markdown库1][1]    \n> [younghz的Markdown库2][2]\n\n[1]: https:://github.com/younghz/Markdown \"Markdown\"\n[2]: https:://github.com/younghz/Markdown \"Markdown\"\n\n**注意**：上述的`[1]:https:://github.com/younghz/Markdown \"Markdown\"`不出现在区块中。\n\n#### 4.9 图片\n添加图片的形式和链接相似，只需在链接的基础上前方加一个`！`。\n#### 4.10 反斜杠`\\`\n相当于**反转义**作用。使符号成为普通符号。\n#### 4.11 符号\'`\'\n起到标记作用。如：\n>\\`ctrl a\\`\n\n效果：\n>`ctrl a`    \n\n#### 5. *谁*在用？\nMarkdown的使用者：\n  GitHub\n  简书\n  Stack Overflow\n  Apollo\n  Moodle\n  Reddit\n  等等\n\n#### 6. 尝试一下\n  **Chrome**下的插件诸如`stackedit`与`markdown-here`等非常方便，也不用担心平台受限。\n  **在线**的dillinger.io评价也不错   \n  **Windowns**下的MarkdownPad也用过，不过免费版的体验不是很好。    \n  **Mac**下的Mou是国人贡献的，口碑很好。\n  **Linux**下的ReText不错。    \n\n**当然，最终境界永远都是笔下是语法，心中格式化 :)。**\n\n****\n**注意**：不同的Markdown解释器或工具对相应语法（扩展语法）的解释效果不尽相同，具体可参见工具的使用说明。\n虽然有人想出面搞一个所谓的标准化的Markdown，[没想到还惹怒了健在的创始人John Gruber]\n(http://blog.codinghorror.com/standard-markdown-is-now-common-markdown/ )。\n****\n以上基本是所有traditonal markdown的语法。\n\n### 其它：\n列表的使用(非traditonal markdown)：\n\n用`|`表示表格纵向边界，表头和表内容用`-`隔开，并可用`:`进行对齐设置，两边都有`:`则表示居中，若不加`:`则默认左对齐。\n\n|代码库                              |链接                                |\n|:------------------------------------:|------------------------------------|\n|MarkDown                              |[https://github.com/younghz/Markdown](https://github.com/younghz/Markdown \"Markdown\")|\n|MarkDownCopy                              |[https://github.com/younghz/Markdown](https://github.com/younghz/Markdown \"Markdown\")|\n\n\n关于其它扩展语法可参见具体工具的使用说明。',0,'这是一个标准的MD文章','2019-05-08 01:26:48',NULL,7,1,1,NULL,NULL,NULL,'<h2><a href=\"#主要内容\" name=\"主要内容\"></a>主要内容</h2>\n<blockquote>\n  <h4><a href=\"#markdown-是什么-\" name=\"markdown-是什么-\"></a>Markdown*是什么*？</h4>\n  <h4><a href=\"#谁创造了它-\" name=\"谁创造了它-\"></a><em>谁</em>创造了它？</h4>\n  <h4><a href=\"#为什么要使用它-\" name=\"为什么要使用它-\"></a><em>为什么</em>要使用它？</h4>\n  <h4><a href=\"#怎么使用-\" name=\"怎么使用-\"></a><em>怎么</em>使用？</h4>\n  <h4><a href=\"#谁在用-\" name=\"谁在用-\"></a><em>谁</em>在用？</h4>\n  <h4><a href=\"#尝试一下\" name=\"尝试一下\"></a>尝试一下</h4>\n</blockquote>\n<h2><a href=\"#正文\" name=\"正文\"></a>正文</h2>\n<h3><a href=\"#1-markdown-是什么-\" name=\"1-markdown-是什么-\"></a>1. Markdown*是什么*？</h3>\n<p><strong>Markdown</strong>是一种轻量级**标记语言**，它以纯文本形式(*易读、易写、易更改*)编写文档，并最终以HTML格式发布。<br/><strong>Markdown</strong>也可以理解为将以MARKDOWN语法编写的语言转换成HTML内容的工具。 </p>\n<h3><a href=\"#2-谁创造了它-\" name=\"2-谁创造了它-\"></a>2. <em>谁</em>创造了它？</h3>\n<p>它由<a href=\"http://www.aaronsw.com/\"><strong>Aaron Swartz</strong></a>和**John Gruber**共同设计，**Aaron Swartz**就是那位于去年（*2013年1月11日*）自杀,有着**开挂**一般人生经历的程序员。维基百科对他的<a href=\"http://zh.wikipedia.org/wiki/亚伦·斯沃茨\">介绍</a>是：**软件工程师、作家、政治组织者、互联网活动家、维基百科人**。 </p>\n<p>他有着足以让你跪拜的人生经历：<br/> <strong>14岁</strong>参与RSS 1.0规格标准的制订。<br/> <strong>2004</strong>年入读**斯坦福**，之后退学。<br/> <strong>2005</strong>年创建<a href=\"http://infogami.org/\">Infogami</a>，之后与<a href=\"http://www.reddit.com/\">Reddit</a>合并成为其合伙人。<br/> <strong>2010</strong>年创立求进会（Demand Progress），积极参与禁止网络盗版法案（SOPA）活动，最终该提案被撤回。<br/> <strong>2011</strong>年7月19日，因被控从MIT和JSTOR下载480万篇学术论文并以免费形式上传于网络被捕。<br/> <strong>2013</strong>年1月自杀身亡。 </p>\n<p><img src=\"https://github.com/younghz/Markdown/raw/master/resource/Aaron_Swartz.jpg\" alt=\"Aaron Swartz\" /></p>\n<p>天才都有早逝的归途。</p>\n<h3><a href=\"#3-为什么要使用它-\" name=\"3-为什么要使用它-\"></a>3. <em>为什么</em>要使用它？</h3>\n<p>它是易读（看起来舒服）、易写（语法简单）、易更改**纯文本**。处处体现着**极简主义**的影子。<br/> 兼容HTML，可以转换为HTML格式发布。<br/> 跨平台使用。<br/> 越来越多的网站支持Markdown。<br/> 更方便清晰地组织你的电子邮件。（Markdown-here, Airmail）<br/> 摆脱Word（我不是认真的）。</p>\n<h3><a href=\"#4-怎么使用-\" name=\"4-怎么使用-\"></a>4. <em>怎么</em>使用？</h3>\n<p>如果不算**扩展**，Markdown的语法绝对**简单**到让你爱不释手。</p>\n<p>Markdown语法主要分为如下几大部分：<br/><strong>标题</strong>，**段落**，**区块引用**，**代码区块**，**强调**，**列表**，**分割线**，**链接**，**图片**，**反斜杠 <code>\\</code>**，**符号&rsquo;`&rsquo;**。</p>\n<h4><a href=\"#4-1-标题\" name=\"4-1-标题\"></a>4.1 标题</h4>\n<p>两种形式：<br/>1）使用<code>=</code>和<code>-</code>标记一级和二级标题。</p>\n<blockquote>\n  <p>一级标题<br/><code>=========</code><br/>二级标题<br/><code>---------</code></p>\n</blockquote>\n<p>效果：</p>\n<blockquote>\n  <h1><a href=\"#一级标题\" name=\"一级标题\"></a>一级标题</h1>\n  <h2><a href=\"#二级标题\" name=\"二级标题\"></a>二级标题</h2>\n</blockquote>\n<p>2）使用<code>#</code>，可表示1-6级标题。</p>\n<blockquote>\n  <p># 一级标题<br/>## 二级标题<br/>### 三级标题<br/>#### 四级标题<br/>##### 五级标题<br/>###### 六级标题 </p>\n</blockquote>\n<p>效果：</p>\n<blockquote>\n  <h1><a href=\"#一级标题\" name=\"一级标题\"></a>一级标题</h1>\n  <h2><a href=\"#二级标题\" name=\"二级标题\"></a>二级标题</h2>\n  <h3><a href=\"#三级标题\" name=\"三级标题\"></a>三级标题</h3>\n  <h4><a href=\"#四级标题\" name=\"四级标题\"></a>四级标题</h4>\n  <h5><a href=\"#五级标题\" name=\"五级标题\"></a>五级标题</h5>\n  <h6><a href=\"#六级标题\" name=\"六级标题\"></a>六级标题</h6>\n</blockquote>\n<h4><a href=\"#4-2-段落\" name=\"4-2-段落\"></a>4.2 段落</h4>\n<p>段落的前后要有空行，所谓的空行是指没有文字内容。若想在段内强制换行的方式是使用**两个以上**空格加上回车（引用中换行省略回车）。</p>\n<h4><a href=\"#4-3-区块引用\" name=\"4-3-区块引用\"></a>4.3 区块引用</h4>\n<p>在段落的每行或者只在第一行使用符号<code>&gt;</code>,还可使用多个嵌套引用，如：</p>\n<blockquote>\n  <p>&gt; 区块引用<br/>&gt;&gt; 嵌套引用 </p>\n</blockquote>\n<p>效果：</p>\n<blockquote>\n  <p>区块引用 </p>\n  <blockquote>\n    <p>嵌套引用</p>\n  </blockquote>\n</blockquote>\n<h4><a href=\"#4-4-代码区块\" name=\"4-4-代码区块\"></a>4.4 代码区块</h4>\n<p>代码区块的建立是在每行加上4个空格或者一个制表符（如同写代码一样）。如<br/>普通段落：</p>\n<p>void main()<br/>{<br/> printf(&ldquo;Hello, Markdown.&rdquo;);<br/>} </p>\n<p>代码区块：</p>\n<pre><code>void main()\n{\n    printf(&quot;Hello, Markdown.&quot;);\n}\n</code></pre>\n<p><strong>注意</strong>:需要和普通段落之间存在空行。</p>\n<h4><a href=\"#4-5-强调\" name=\"4-5-强调\"></a>4.5 强调</h4>\n<p>在强调内容两侧分别加上<code>*</code>或者<code>_</code>，如：</p>\n<blockquote>\n  <p>*斜体*，_斜体_<br/>**粗体**，__粗体__</p>\n</blockquote>\n<p>效果：</p>\n<blockquote>\n  <p><em>斜体</em>，_斜体_<br/><strong>粗体</strong>，__粗体__</p>\n</blockquote>\n<h4><a href=\"#4-6-列表\" name=\"4-6-列表\"></a>4.6 列表</h4>\n<p>使用<code>·</code>、` <code>、或</code>-`标记无序列表，如：</p>\n<blockquote>\n  <p>-（ *） 第一项<br/>-（ *） 第二项<br/>- （ *）第三项</p>\n</blockquote>\n<p><strong>注意</strong>：标记后面最少有一个_空格_或_制表符_。若不在引用区块中，必须和前方段落之间存在空行。</p>\n<p>效果：</p>\n<blockquote>\n  <p>第一项<br/> 第二项<br/> 第三项</p>\n</blockquote>\n<p>有序列表的标记方式是将上述的符号换成数字,并辅以<code>.</code>，如：</p>\n<blockquote>\n  <p>1 . 第一项<br/>2 . 第二项<br/>3 . 第三项 </p>\n</blockquote>\n<p>效果：</p>\n<blockquote>\n  <ol>\n    <li>第一项</li>\n    <li>第二项</li>\n    <li>第三项</li>\n  </ol>\n</blockquote>\n<h4><a href=\"#4-7-分割线\" name=\"4-7-分割线\"></a>4.7 分割线</h4>\n<p>分割线最常使用就是三个或以上<code>*</code>，还可以使用<code>-</code>和<code>_</code>。</p>\n<h4><a href=\"#4-8-链接\" name=\"4-8-链接\"></a>4.8 链接</h4>\n<p>链接可以由两种形式生成：**行内式**和**参考式**。<br/><strong>行内式</strong>：</p>\n<blockquote>\n  <p>[younghz的Markdown库](https:://github.com/younghz/Markdown &ldquo;Markdown&rdquo;)。</p>\n</blockquote>\n<p>效果：</p>\n<blockquote>\n  <p><a href=\"https:://github.com/younghz/Markdown\" title=\"Markdown\">younghz的Markdown库</a>。</p>\n</blockquote>\n<p><strong>参考式</strong>：</p>\n<blockquote>\n  <p>[younghz的Markdown库1][1]<br/>[younghz的Markdown库2][2]<br/>[1]:https:://github.com/younghz/Markdown &ldquo;Markdown&rdquo;<br/>[2]:https:://github.com/younghz/Markdown &ldquo;Markdown&rdquo; </p>\n</blockquote>\n<p>效果：</p>\n<blockquote>\n  <p><a href=\"https:://github.com/younghz/Markdown\" title=\"Markdown\">younghz的Markdown库1</a><br/><a href=\"https:://github.com/younghz/Markdown\" title=\"Markdown\">younghz的Markdown库2</a></p>\n</blockquote>\n<p><strong>注意</strong>：上述的<code>[1]:https:://github.com/younghz/Markdown &quot;Markdown&quot;</code>不出现在区块中。</p>\n<h4><a href=\"#4-9-图片\" name=\"4-9-图片\"></a>4.9 图片</h4>\n<p>添加图片的形式和链接相似，只需在链接的基础上前方加一个<code>！</code>。</p>\n<h4><a href=\"#4-10-反斜杠\" name=\"4-10-反斜杠\"></a>4.10 反斜杠<code>\\</code></h4>\n<p>相当于**反转义**作用。使符号成为普通符号。</p>\n<h4><a href=\"#4-11-符号ctrl-a-\" name=\"4-11-符号ctrl-a-\"></a>4.11 符号&rsquo;<code>&#39;\n起到标记作用。如：\n&gt;\\</code>ctrl a`</h4>\n<p>效果：</p>\n<blockquote>\n  <p><code>ctrl a</code> </p>\n</blockquote>\n<h4><a href=\"#5-谁在用-\" name=\"5-谁在用-\"></a>5. <em>谁</em>在用？</h4>\n<p>Markdown的使用者：<br/> GitHub<br/> 简书<br/> Stack Overflow<br/> Apollo<br/> Moodle<br/> Reddit<br/> 等等</p>\n<h4><a href=\"#6-尝试一下\" name=\"6-尝试一下\"></a>6. 尝试一下</h4>\n<p><strong>Chrome</strong>下的插件诸如<code>stackedit</code>与<code>markdown-here</code>等非常方便，也不用担心平台受限。<br/> <strong>在线</strong>的dillinger.io评价也不错<br/> <strong>Windowns</strong>下的MarkdownPad也用过，不过免费版的体验不是很好。<br/> <strong>Mac</strong>下的Mou是国人贡献的，口碑很好。<br/> <strong>Linux</strong>下的ReText不错。 </p>\n<p><strong>当然，最终境界永远都是笔下是语法，心中格式化 :)。</strong></p>\n<hr/>\n<p><strong>注意</strong>：不同的Markdown解释器或工具对相应语法（扩展语法）的解释效果不尽相同，具体可参见工具的使用说明。<br/>虽然有人想出面搞一个所谓的标准化的Markdown，<a href=\"http://blog.codinghorror.com/standard-markdown-is-now-common-markdown/\">没想到还惹怒了健在的创始人John Gruber</a>。<br/>****<br/>以上基本是所有traditonal markdown的语法。</p>\n<h3><a href=\"#其它-\" name=\"其它-\"></a>其它：</h3>\n<p>列表的使用(非traditonal markdown)：</p>\n<p>用<code>|</code>表示表格纵向边界，表头和表内容用<code>-</code>隔开，并可用<code>:</code>进行对齐设置，两边都有<code>:</code>则表示居中，若不加<code>:</code>则默认左对齐。</p>\n<table>\n  <thead>\n    <tr>\n      <th align=\"center\">代码库 </th>\n      <th>链接 </th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td align=\"center\">MarkDown </td>\n      <td><a href=\"https://github.com/younghz/Markdown\" title=\"Markdown\">https://github.com/younghz/Markdown</a></td>\n    </tr>\n    <tr>\n      <td align=\"center\">MarkDownCopy </td>\n      <td><a href=\"https://github.com/younghz/Markdown\" title=\"Markdown\">https://github.com/younghz/Markdown</a></td>\n    </tr>\n  </tbody>\n</table>\n<p>关于其它扩展语法可参见具体工具的使用说明。</p>','1557307593338.jpg');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` VALUES (4,204,2),(5,205,2),(6,205,4),(7,206,4),(8,206,5),(9,207,1),(10,207,2),(11,208,1),(12,208,2),(14,152,4),(17,110,2);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `aid` int(22) unsigned NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `pid` int(22) DEFAULT '0',
  `status` int(10) DEFAULT '0',
  `favorite` int(22) DEFAULT '0',
  `ipaddr` varchar(45) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'匿名',NULL,152,NULL,NULL,'就是为了测试下\n# good \n## 二级标签','linmingwei001@163.com',NULL,0,NULL,NULL,NULL),(2,'匿名2',NULL,152,NULL,NULL,'就是为了测试下\n# good \n## 二级标签','test@163.com',NULL,0,NULL,NULL,NULL),(3,'匿名',NULL,152,NULL,NULL,'为了休息一下','teee@qq.com',NULL,0,NULL,NULL,NULL),(4,'nisdf',NULL,152,'2019-04-29 08:24:01','2019-04-29 08:21:05','sadfa','asdf',0,2,0,NULL,NULL),(7,'时间',NULL,152,'2019-04-29 00:45:51',NULL,'在测试下时间','shijian@qq.com',NULL,NULL,NULL,NULL,NULL),(8,'匿名',NULL,152,'2019-04-29 04:03:17',NULL,'test Pid 1','testpid1@qq.com',0,NULL,NULL,NULL,NULL),(9,'匿名',NULL,152,'2019-04-29 04:05:10',NULL,'这是 id为1的 自评论','id1@qq.com',1,NULL,NULL,NULL,NULL),(10,'good',NULL,152,'2019-04-29 04:24:27',NULL,'回复回复你   四手动阀撒','tswss@',4,NULL,NULL,NULL,NULL),(11,'邵磊',NULL,152,'2019-04-29 04:26:14',NULL,'在稍微评论下','youxiang',0,NULL,NULL,NULL,NULL),(12,'匿名',NULL,205,'2019-04-29 04:34:56',NULL,'测试下','a',0,NULL,NULL,NULL,NULL),(13,'匿名',NULL,205,'2019-04-29 04:35:12',NULL,'回复测试下','aaa',12,NULL,NULL,NULL,NULL),(14,'匿名',NULL,110,'2019-05-05 18:58:17',NULL,'没有评论','mingweilin@contractor.ea.com',0,NULL,NULL,NULL,NULL),(15,'匿名',NULL,110,'2019-05-05 18:58:37',NULL,'真的没有','linmingwei001@163.com',14,NULL,NULL,NULL,NULL),(16,'匿名',NULL,204,'2019-05-06 01:59:38',NULL,'asdfsdf','asdfg@',0,NULL,NULL,NULL,NULL),(17,'匿名',NULL,204,'2019-05-06 01:59:47',NULL,'asdfasdf','bhefrg',16,NULL,NULL,NULL,NULL),(18,'匿名',NULL,204,'2019-05-06 02:00:00',NULL,'sedgfasdg','dfhbdfh',17,NULL,NULL,NULL,NULL),(19,'匿名',NULL,204,'2019-05-06 02:00:11',NULL,'e5u4444','tkj',18,NULL,NULL,NULL,NULL),(20,'匿名',NULL,204,'2019-05-06 02:00:20',NULL,'1325r4213','dfh',19,NULL,NULL,NULL,NULL),(21,'eehdv',NULL,204,'2019-05-06 02:00:36',NULL,'236534656','s3wer5',20,NULL,NULL,NULL,NULL),(22,'匿名',NULL,152,'2019-05-08 19:28:04',NULL,'测试下评论','as',0,NULL,NULL,NULL,NULL),(23,'匿名',NULL,143,'2019-05-08 19:39:33',NULL,'给你稍微来个评论','aaa',0,NULL,NULL,NULL,NULL),(24,'匿名',NULL,114,'2019-05-09 03:50:30',NULL,'测试一下','',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL COMMENT '链接地址',
  `name` varchar(50) DEFAULT NULL COMMENT '链接名',
  `description` varchar(300) DEFAULT NULL COMMENT '链接介绍',
  `email` varchar(100) DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(13) DEFAULT NULL COMMENT '友链站长QQ',
  `favicon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态',
  `home_page_display` tinyint(1) unsigned DEFAULT '1' COMMENT '是否首页显示',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `source` enum('ADMIN','AUTOMATIC') DEFAULT 'ADMIN' COMMENT '来源：管理员添加、自动申请',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'https://www.zhyd.me','张亚东博客','一个程序员的个人博客','yadong.zhang0415@gmail.com',NULL,'https://static.zhyd.me/static/img/favicon.ico',1,1,NULL,'ADMIN','2016-11-16 23:32:03','2018-01-23 11:27:19'),(13,'http://tool.zhyd.me','在线工具','在线工具，只做最有用、最简单、最干净、最方便的工具网站。','yadong.zhang0415@gmail.com','','https://static.zhyd.me/static/img/favicon.ico',1,0,'',NULL,NULL,NULL),(35,'http://music.zhyd.me','我的音乐馆','我的音乐馆','yadong.zhang0415@gmail.com',NULL,'http://music.zhyd.me/images/favicon.ico',1,0,NULL,'ADMIN','2018-04-19 20:01:35','2018-04-19 20:01:35'),(36,'www.baidu.com','百度','','sdf@eami.com','','',1,1,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '被通知的用户ID',
  `status` enum('RELEASE','NOT_RELEASE') DEFAULT 'NOT_RELEASE' COMMENT '通知状态',
  `title` varchar(200) DEFAULT NULL COMMENT '通知的标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '通知的内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,1,'RELEASE','OneBlog开源博客','OneBlog开源博客，一款超好用的Java版开源博客','2018-05-22 10:26:26','2018-08-28 23:37:46'),(2,1,'RELEASE','问题反馈','在使用过程中，有问题请先参考相关文档，确实无法解决的，请优先提Issue，感谢各位老铁','2018-08-28 23:40:45','2018-08-28 23:40:45'),(3,NULL,'RELEASE','good,test21','的风格',NULL,NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `permission` varchar(45) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `available` tinyint(4) DEFAULT '1',
  `icon` varchar(45) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `alias` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'文章管理','menu','',NULL,0,3,1,'fa fa-list','2019-05-18 10:42:18','2019-05-18 10:42:18','article'),(2,'写文章','menu','/admin/article/write','article:write',1,31,1,NULL,'2019-05-18 11:07:28','2019-05-18 11:07:28','write'),(3,'发表文章','button',NULL,'article:publish',2,NULL,1,NULL,NULL,NULL,NULL),(4,'文章列表','menu','/admin/article/list','articles',1,32,1,NULL,'2019-05-18 11:09:20','2019-05-18 11:09:20','list'),(5,'批量发布文章','button','','article:batchPublish',4,NULL,1,NULL,'2019-05-18 09:23:58','2019-05-18 09:23:58',NULL),(6,'批量删除文章','button',NULL,'article:batchDelete',4,NULL,1,NULL,'2019-05-18 09:24:02','2019-05-18 09:24:02',NULL),(7,'编辑文章','button',NULL,'article:edit',4,NULL,1,NULL,'2019-05-18 09:13:12','2019-05-18 09:13:12',NULL),(8,'删除文章','button',NULL,'article:delete',4,NULL,1,NULL,'2019-05-18 09:13:03','2019-05-18 09:13:03',NULL),(9,'分类列表','menu','/admin/article/type','types',1,33,1,NULL,'2019-05-18 11:10:32','2019-05-18 11:10:32','type'),(10,'新增分类','button',NULL,'type:add',9,NULL,1,NULL,'2019-05-18 09:12:22','2019-05-18 09:12:22',NULL),(11,'批量删除分类','button',NULL,'type:batchDelete',9,NULL,1,NULL,'2019-05-18 09:24:06','2019-05-18 09:24:06',NULL),(12,'编辑分类','button',NULL,'type:edit',9,NULL,1,NULL,'2019-05-18 09:12:24','2019-05-18 09:12:24',NULL),(13,'删除分类','button',NULL,'type:delete',9,NULL,1,NULL,'2019-05-18 09:12:36','2019-05-18 09:12:36',NULL),(14,'标签列表','menu','/admin/article/tag','tags',1,34,1,NULL,'2019-05-18 11:10:44','2019-05-18 11:10:44','tag'),(15,'新增标签','button',NULL,'tag:add',14,NULL,1,NULL,'2019-05-18 09:23:37','2019-05-18 09:23:37',NULL),(16,'批量删除标签','button',NULL,'tag:batchDelete',14,NULL,1,NULL,'2019-05-18 09:24:11','2019-05-18 09:24:11',NULL),(17,'编辑标签','button',NULL,'tag:edit',14,NULL,1,NULL,'2019-05-18 09:24:15','2019-05-18 09:24:15',NULL),(18,'删除标签','button',NULL,'tag:delete',14,NULL,1,NULL,'2019-05-18 09:24:27','2019-05-18 09:24:27',NULL),(19,'评论列表','menu','/admin/article/comment','comments',1,35,1,NULL,'2019-05-18 11:10:28','2019-05-18 11:10:28','comment'),(20,'批量删除评论','button',NULL,'comment:batchDelete',19,NULL,1,NULL,'2019-05-18 09:24:58','2019-05-18 09:24:58',NULL),(21,'网站管理','menu','',NULL,0,5,1,'fa fa-globe','2019-05-18 10:42:23','2019-05-18 10:42:23','website'),(22,'友情链接','menu','/admin/website/link','links',21,51,1,NULL,'2019-05-18 11:10:36','2019-05-18 11:10:36','link'),(23,'公告管理','menu','/admin/website/notice','notices',21,52,1,NULL,'2019-05-18 13:06:28','2019-05-18 13:06:28','notice'),(24,'权限管理','menu','',NULL,0,7,1,'fa fa-cogs','2019-05-18 11:43:12','2019-05-18 11:43:12','perms'),(25,'资源管理','menu','/admin/perms/resources','resources',24,71,1,NULL,'2019-05-19 10:05:53','2019-05-19 10:05:53','resources'),(26,'角色管理','menu','/admin/perms/role','roles',24,72,1,NULL,'2019-05-18 13:07:26','2019-05-18 13:07:26','role'),(27,'用户管理','menu',NULL,NULL,0,9,1,'fa fa-user','2019-05-18 10:42:39','2019-05-18 10:42:39','users'),(28,'用户列表','menu','/admin/users/list','users',27,91,1,NULL,'2019-05-18 13:07:13','2019-05-18 13:07:13','list'),(29,'新增用户','button',NULL,'user:add',28,NULL,1,NULL,'2019-05-18 10:38:38','2019-05-18 10:38:38',NULL),(30,'批量删除用户','button',NULL,'user:batchDelete',28,NULL,1,NULL,'2019-05-18 10:38:38','2019-05-18 10:38:38',NULL),(31,'编辑用户','button',NULL,'user:edit',28,NULL,1,NULL,'2019-05-18 10:38:39','2019-05-18 10:38:39',NULL),(32,'删除用户','button',NULL,'user:delete',28,NULL,1,NULL,'2019-05-18 10:38:39','2019-05-18 10:38:39',NULL),(33,'分配角色','button',NULL,'user:assignRole',28,NULL,1,NULL,'2019-05-18 10:38:41','2019-05-18 10:38:41',NULL),(34,'回复评论','button',NULL,'comment:reply',19,NULL,1,NULL,'2019-05-18 09:25:12','2019-05-18 09:25:12',NULL),(35,'审核评论','button',NULL,'comment:check',19,NULL,1,NULL,'2019-05-18 09:25:18','2019-05-18 09:25:18',NULL),(36,'删除评论','button',NULL,'comment:delete',19,NULL,1,NULL,'2019-05-18 09:25:28','2019-05-18 09:25:28',NULL),(37,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(38,'新增友链','button',NULL,'link:add',22,NULL,1,NULL,'2019-05-18 11:50:19','2019-05-18 11:50:19',NULL),(39,'批量删除友链','button',NULL,'link:batchDelete',22,NULL,1,NULL,'2019-05-18 11:50:22','2019-05-18 11:50:22',NULL),(40,'编辑友链','button',NULL,'link:edit',22,NULL,1,NULL,'2019-05-18 11:50:21','2019-05-18 11:50:21',NULL),(41,'删除友链','button',NULL,'link:delete',22,NULL,1,NULL,'2019-05-18 11:50:23','2019-05-18 11:50:23',NULL),(42,'新增公告','button',NULL,'notice:add',23,NULL,1,NULL,'2019-05-18 11:50:27','2019-05-18 11:50:27',NULL),(43,'批量删除公告','button',NULL,'notice:batchDelete',23,NULL,1,NULL,'2019-05-18 11:50:28','2019-05-18 11:50:28',NULL),(44,'编辑公告','button',NULL,'notice:edit',23,NULL,1,NULL,'2019-05-18 11:50:29','2019-05-18 11:50:29',NULL),(45,'删除公告','button',NULL,'notice:delete',23,NULL,1,NULL,'2019-05-18 11:50:30','2019-05-18 11:50:30',NULL),(46,'新增资源','button',NULL,'resources:add',25,NULL,1,NULL,'2019-05-18 11:50:37','2019-05-18 11:50:37',NULL),(47,'批量删除资源','button',NULL,'resources:batchDelete',25,NULL,1,NULL,'2019-05-18 11:50:38','2019-05-18 11:50:38',NULL),(48,'编辑资源','button',NULL,'resources:edit',25,NULL,1,NULL,'2019-05-18 11:50:39','2019-05-18 11:50:39',NULL),(49,'删除资源','button',NULL,'resources:delete',25,NULL,1,NULL,'2019-05-18 11:50:40','2019-05-18 11:50:40',NULL),(50,'新增角色','button',NULL,'role:add',26,NULL,1,NULL,'2019-05-18 11:50:43','2019-05-18 11:50:43',NULL),(51,'删除角色','button',NULL,'role:delete',26,NULL,1,NULL,'2019-05-18 11:50:44','2019-05-18 11:50:44',NULL),(52,'编辑角色','button',NULL,'role:edit',26,NULL,1,NULL,'2019-05-18 11:50:44','2019-05-18 11:50:44',NULL),(53,'分配资源',NULL,NULL,'role:assignResources',26,NULL,1,NULL,'2019-05-18 11:50:45','2019-05-18 11:50:45',NULL);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `avaliable` tinyint(4) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'role:root','超级管理员',1,NULL,NULL),(2,'role:admin','管理员',1,NULL,NULL),(3,'role:user','用户',1,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_resources`
--

DROP TABLE IF EXISTS `role_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `resourcesId` int(11) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_resources`
--

LOCK TABLES `role_resources` WRITE;
/*!40000 ALTER TABLE `role_resources` DISABLE KEYS */;
INSERT INTO `role_resources` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,1,6,NULL,NULL),(7,1,7,NULL,NULL),(8,1,8,NULL,NULL),(9,1,9,NULL,NULL),(10,1,10,NULL,NULL),(11,1,11,NULL,NULL),(12,1,12,NULL,NULL),(13,1,13,NULL,NULL),(14,1,14,NULL,NULL),(15,1,15,NULL,NULL),(16,1,16,NULL,NULL),(17,1,17,NULL,NULL),(18,1,18,NULL,NULL),(19,1,19,NULL,NULL),(20,1,20,NULL,NULL),(21,1,34,NULL,NULL),(22,1,35,NULL,NULL),(23,1,36,NULL,NULL),(24,1,21,NULL,NULL),(25,1,22,NULL,NULL),(26,1,38,NULL,NULL),(27,1,39,NULL,NULL),(28,1,40,NULL,NULL),(29,1,41,NULL,NULL),(30,1,23,NULL,NULL),(31,1,42,NULL,NULL),(32,1,43,NULL,NULL),(33,1,44,NULL,NULL),(34,1,45,NULL,NULL),(35,1,24,NULL,NULL),(36,1,25,NULL,NULL),(37,1,46,NULL,NULL),(38,1,47,NULL,NULL),(39,1,48,NULL,NULL),(40,1,49,NULL,NULL),(41,1,26,NULL,NULL),(42,1,50,NULL,NULL),(43,1,51,NULL,NULL),(44,1,52,NULL,NULL),(45,1,53,NULL,NULL),(46,1,27,NULL,NULL),(47,1,28,NULL,NULL),(48,1,29,NULL,NULL),(49,1,30,NULL,NULL),(50,1,31,NULL,NULL),(51,1,32,NULL,NULL),(52,1,33,NULL,NULL),(53,2,1,NULL,NULL),(54,2,2,NULL,NULL),(55,2,3,NULL,NULL),(56,2,4,NULL,NULL),(57,2,5,NULL,NULL),(58,2,6,NULL,NULL),(59,2,7,NULL,NULL),(60,2,8,NULL,NULL),(61,2,9,NULL,NULL),(62,2,10,NULL,NULL),(63,2,11,NULL,NULL),(64,2,12,NULL,NULL),(65,2,13,NULL,NULL),(66,2,14,NULL,NULL),(67,2,15,NULL,NULL),(68,2,16,NULL,NULL),(69,2,17,NULL,NULL),(70,2,18,NULL,NULL),(71,2,19,NULL,NULL),(72,2,20,NULL,NULL),(73,2,34,NULL,NULL),(74,2,35,NULL,NULL),(75,2,36,NULL,NULL),(76,2,21,NULL,NULL),(77,2,22,NULL,NULL),(78,2,38,NULL,NULL),(79,2,39,NULL,NULL),(80,2,40,NULL,NULL),(81,2,41,NULL,NULL),(82,2,23,NULL,NULL),(83,2,42,NULL,NULL),(84,2,43,NULL,NULL),(85,2,44,NULL,NULL),(86,2,45,NULL,NULL),(87,3,1,NULL,NULL),(88,3,2,NULL,NULL),(89,3,3,NULL,NULL),(90,3,4,NULL,NULL),(91,3,5,NULL,NULL),(92,3,6,NULL,NULL),(93,3,7,NULL,NULL),(94,3,8,NULL,NULL),(95,3,9,NULL,NULL),(96,3,10,NULL,NULL),(97,3,11,NULL,NULL),(98,3,12,NULL,NULL),(99,3,13,NULL,NULL),(100,3,14,NULL,NULL),(101,3,15,NULL,NULL),(102,3,16,NULL,NULL),(103,3,17,NULL,NULL),(104,3,18,NULL,NULL),(105,3,19,NULL,NULL),(106,3,20,NULL,NULL),(107,3,34,NULL,NULL),(108,3,35,NULL,NULL),(109,3,36,NULL,NULL);
/*!40000 ALTER TABLE `role_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Linux',NULL,NULL,NULL,NULL),(2,'Java',NULL,NULL,NULL,NULL),(3,'Spring',NULL,NULL,NULL,NULL),(4,'Spring Boot',NULL,NULL,NULL,NULL),(5,'并发',NULL,NULL,NULL,NULL),(6,'怎么说','阿斯蒂芬',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` int(22) unsigned NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'前端技术','没啥描述',0,'2019-04-23 03:24:50',NULL,10),(2,'后端技术',NULL,0,'2019-04-23 03:24:50',NULL,20),(3,'服务器',NULL,0,'2019-04-23 03:24:50',NULL,30),(4,'CSS',NULL,1,NULL,NULL,NULL),(5,'JS',NULL,1,NULL,NULL,NULL),(6,'VUE',NULL,1,NULL,NULL,NULL),(7,'Spring Boot',NULL,2,NULL,NULL,NULL),(8,'Java',NULL,2,NULL,NULL,NULL),(9,'并发',NULL,2,NULL,NULL,NULL),(10,'Linux',NULL,3,NULL,NULL,NULL),(11,'Shell',NULL,3,NULL,NULL,NULL),(12,'岁的法国',NULL,1,'2019-04-18 02:40:09','2019-04-18 02:40:09',NULL);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(2) DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `userType` enum('ROOT','ADMIN','USER') DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `regIp` varchar(45) DEFAULT NULL,
  `lastLoginIp` varchar(45) DEFAULT NULL,
  `lastLoginTime` timestamp NULL DEFAULT NULL,
  `loginCount` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','df655ad8d3229f3269fad2a8bab59b6c','管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'user','f3206cba20994d17d5e0a47abe8648f9','用户',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'root','28cf327cd6b46986752f4a396aecfa23','超级管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL,
  `roleId` int(10) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,2,NULL,NULL),(2,2,3,NULL,NULL),(3,3,1,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 18:06:43
