<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--<link rel="stylesheet" href="/plugin/layui/css/layui.css">-->
    <!--<link rel="stylesheet" href="/plugin/font-awesome-4.7.0/css/font-awesome.min.css">-->

    <!--<link rel="stylesheet" href="/css/index.css">-->
    <!--<script src="/plugin/layui/layui.js"></script>-->
    <link rel="stylesheet" href="/static/plugin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/front/common.css">
    <link rel="stylesheet" href="/static/css/front/header.css">
    <link rel="stylesheet" href="/static/css/front/footer.css">
    <link rel="stylesheet" href="/static/css/article.css">
    <!--<script src="/static/plugin/jquery.min.js"></script>-->
    <title>Article</title>

</head>
<body class="layui-bg-gray">
<header>
    <div class="blog-header">
        <div class="brand">
            <h1 class=" pull-left">
                <i class="layui-icon layui-icon-tree" style="font-size: 30px; color: #009688;"></i>
                <a href="#home" class="brand-title">Bolg小站</a>
            </h1>
        </div>
        <div class="">
            <div class="pull-right">
                <input id="search" type="search" class="layui-input" placeholder="搜索">
            </div>

            <ul class="layui-nav blog-nav pull-right">
                <li class="layui-nav-item"><a href="#">主页</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">文章分类 <i class="layui-icon layui-icon-triangle-d"></i></a>

                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                        <dd><a href="">Spring Boot</a></dd>
                        <dd><a href="">数据库</a></dd>
                        <dd><a href="">Linux</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="#">留言板</a></li>
                <li class="layui-nav-item"><a href="#">关于本站</a></li>
            </ul>
        </div>
    </div>
</header>
<div class="container">
    <div class="blog-banner">
        <span class="layui-breadcrumb">
          <a href=""><i class="fa fa-home"></i>&nbsp; 首页 </a>
          <a href="">国际新闻</a>
          <a href="">亚太地区</a>
          <a><cite>正文</cite></a>
        </span>
    </div>
    <div class="row layui-col-space20">

        <div class="col-8">
            <div class="blog-panel">
                <div class="article-banner">
                    <span class="pull-left article-flag yc text-center">原创</span>
                    <div class="pull-right">
                    <span class="article-meta">
                        <i class="layui-icon layui-icon-date"></i>
                        <span class="inl">2018-10-29</span>&nbsp;&nbsp;
                        <i class="fa fa-eye" aria-hidden="true"></i>
                        <span>浏览(20)</span>&nbsp;&nbsp;
                        <i class="fa fa-comments-o" aria-hidden="true"></i>
                        <span>0</span>
                    </span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="article-content" id="content">

                </div>
                <div class="hr text-center">
                    <span>正文结束</span>
                </div>
                <div class="article-foot text-center">
                    <span class="like">
                        <a href="#like"><i class="fa fa-thumbs-up"></i>&nbsp; 赞</a>
                    </span>

                    <span class="reward">
                            <span class="reward-empty"></span>
                            <span></span>
                            <a href="#reward" class="layui-circle">赏</a>
                        </span>
                    <span class="share">
                        <a href="#share"><i class="fa fa-share-alt"></i>&nbsp; 分享</a>
                    </span>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="article-footbar">
                <p>所属分类： &nbsp;<a href="#Java" style="color: #009a61;font-size: 16px">Java</a></p>
            </div>
            <div class="blog-panel article-tag" style="margin-top: 15px;">
                <p>
                    <strong>本文标签：</strong>
                    <span><a href="#">Spring Boot</a></span>
                    <span><a href="#">Spring Boot</a></span>
                    <span><a href="#">Spring Boot</a></span>
                </p>
                <p>
                    <strong>版权声明：</strong>
                    本站原创文章，于2018年09月12日由张亚东发布，转载请注明出处
                </p>

            </div>
            <div class="blog-panel">
                <div class="meta-nav text-center">
                    <a href="#" style="border-right: 1px solid rgba(0,0,0,0.1);">
                        <i class="fa fa-angle-left"></i>&nbsp;上一篇 <br>
                        DBlog开源博客改名为OneBlog
                    </a>
                    <a href="#">
                        <i class="fa fa-angle-left"></i>&nbsp;下一篇 <br>
                        DBlog开源博客改名为OneBlog
                    </a>
                </div>
            </div>
            <div class="blog-panel">
                <div class="panel-title">

                    <h5 class="h5">
                        <i class="fa fa-fire"></i>
                        热门推荐
                    </h5>
                </div>
                <hr>
                <ul class="article-hot">
                    <li>
                        <div class="article-hot-img ">

                            <img src="/static/images/springboot.png" alt="">
                        </div>
                        <div class="article-hot-text text-truncate">
                            <a href="#">Springboot + Freemarker项目中使用自定义注解Springboot + Freemarker项目中使用自定义注解</a>
                            <p>

                                <span>浏览（3367）</span>
                                <span>评论 (0)</span>
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="article-hot-img">

                            <img src="/static/images/springboot.png" alt="">
                        </div>
                        <div class="article-hot-text text-truncate">
                            <a href="#">Springboot + Freemarker项目中使用自定义注解Springboot + Freemarker项目中使用自定义注解</a>
                            <p>

                                <span>浏览（3367）</span>
                                <span>评论 (0)</span>
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="article-hot-img">

                            <img src="/static/images/springboot.png" alt="">
                        </div>
                        <div class="article-hot-text text-truncate">
                            <a href="#">Springboot + Freemarker项目中使用自定义注解Springboot + Freemarker项目中使用自定义注解</a>
                            <p>

                                <span>浏览（3367）</span>
                                <span>评论 (0)</span>
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="article-hot-img">

                            <img src="/static/images/springboot.png" alt="">
                        </div>
                        <div class="article-hot-text text-truncate">
                            <a href="#">Springboot + Freemarker项目中使用自定义注解Springboot + Freemarker项目中使用自定义注解</a>
                            <p>

                                <span>浏览（3367）</span>
                                <span>评论 (0)</span>
                            </p>
                        </div>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="blog-panel article-rel">
                <div class="panel-title">
                    <h5 class="h5">
                        <i class="fa fa-google-wallet"></i>
                        相关文章
                    </h5>
                    <hr>
                    <a href="#" class="text-truncate link-green">Springboot + Freemarker项目中使用自定义注解Springboot +
                        Freemarker项目中使用自定义注解</a>
                    <a href="#" class="text-truncate link-green">Springboot + Freemarker项目中使用自定义注解Springboot +
                        Freemarker项目中使用自定义注解</a>
                    <a href="#" class="text-truncate link-green">Springboot + Freemarker项目中使用自定义注解Springboot +
                        Freemarker项目中使用自定义注解</a>
                    <a href="#" class="text-truncate link-green">Springboot + Freemarker项目中使用自定义注解Springboot +
                        Freemarker项目中使用自定义注解</a>

                </div>
            </div>
            <div class="blog-panel">
                <div class="panel-title" id="comment-post">
                    <h5 class="h5">
                        <i class="fa fa-commenting-o"></i>
                        评论
                    </h5>
                    <hr>
                    <form action="/" class="layui-form" id="comment-form">
                        <textarea name="" required placeholder="请输入" class="layui-textarea CodeMirror CodeMirror-scroll"
                                  id="comment-area">
                        </textarea>
                        <button class="layui-btn layui-btn-fluid" style="margin: 15px 0">提交评论</button>
                    </form>

                </div>
                <div class="panel-title">
                    <h5 class="h5">
                        <i class="fa fa-comments-o"></i>
                        <em style="font-size: 18px;color: red;font-weight: 700;font-family: Georgia;">7</em>
                        条评论
                    </h5>
                </div>
                <hr>
                <ul>
                    <li class="content-li">
                        <div class="comment-header">
                            <div class="user-img">
                                <img src="/static/images/user.png" alt="">
                            </div>
                            <div class="user-info">
                                <div class="nickname">
                                    <a href="#" style="color: #009a61;"><strong>匿名</strong></a>

                                </div>
                                <div class="timer">
                                    <i class="fa fa-clock-o"></i>
                                    2018-11-6 17.07 &nbsp;
                                    <i class="fa fa-map-marker"></i>
                                    上海浦东新区
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="comment-content">test</div>
                        <hr>
                        <div class="content-meta" style="">
                            <a href="#">
                                <i class="fa fa-thumbs-up"></i> 赞(0)
                            </a>
                            <i class="sepa"></i>
                            <a href="">
                                <i class="fa fa-thumbs-down"></i> 踩(0)
                            </a>
                            <i class="sepa"></i>
                            <a id="reply-A" class="" style="padding-right: 15px;cursor: pointer;">
                                <i class="fa fa-reply"></i> 回复
                                <!--<i class="fa fa-share"></i> 取消回复-->
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-4">
            <!--说给你听-->
            <div class="blog-panel">
                <div class="panel-title">
                    <h5>
                        <i class="fa fa-hand-peace-o"></i>
                        说给你听
                    </h5>
                </div>
                <hr>
                <blockquote class="layui-elem-quote" style="border-left: none; ">
                    路一步一步走，坑一个一个踩。
                </blockquote>
            </div>
            <!--文章目录-->
            <div class="blog-panel">
                <div class="panel-title">
                    <h5>
                        <i class="fa fa-book"></i>
                        文章目录
                    </h5>
                </div>
                <hr>
                <ul>
                    <li>
                        <a href="#" class="text-green" style="padding: 0 10px;line-height: 2;">
                            <i class="fa fa-angle-right"></i>
                            &nbsp;前言
                        </a>
                    </li>
                    <li>
                        <a href="#" class="text-green" style="padding: 0 10px;line-height: 2;">
                            <i class="fa fa-angle-right"></i>
                            &nbsp;前言
                        </a>
                    </li>
                    <li>
                        <a href="#" class="text-green" style="padding: 0 10px;line-height: 2;">
                            <i class="fa fa-angle-right"></i>
                            &nbsp;前言
                        </a>
                    </li>
                    <li>
                        <a href="#" class="text-green" style="padding: 0 10px;line-height: 2;">
                            <i class="fa fa-angle-right"></i>
                            &nbsp;前言
                        </a>
                    </li>
                </ul>
            </div>

            <!--标签云-->
            <div class="blog-panel blog-tag bg-white">
                <div class="panel-title">
                    <h5>
                        <i class="fa fa-tags" aria-hidden="true"></i>
                        <span class="font-strong">文章标签</span>
                    </h5>
                    <hr>

                </div>
                <div class="tag-body">
                    <div class="tag-content">
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">god</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                        <a href="#tag" class="border-gray">Java</a>
                    </div>
                </div>

            </div>
            <!--近期、推荐、随机文章列表-->
            <div class="blog-panel article-list">
                <div class="layui-tab">
                    <ul class="layui-tab-title">
                        <li class="layui-this"><i class="fa fa-th-list"></i> 近期文章</li>
                        <li><i class="fa fa-thumbs-o-up"></i> 站长推荐</li>
                        <li><i class="fa fa-hand-peace-o"></i> 随机文章</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <ul class="article-list">
                                <li>
                                    <a href="#" class="text-truncate">Java是世界上最好的语言Java是世界上最好的语言Java是世界上最好的语言</a>
                                </li>
                                <li>
                                    <a href="#">Java是世界上最好的语言</a>
                                </li>
                                <li>
                                    <a href="#">Java是世界上最好的语言</a>
                                </li>
                                <li>
                                    <a href="#">Java是世界上最好的语言</a>
                                </li>
                                <li>
                                    <a href="#">Java是世界上最好的语言</a>
                                </li>
                            </ul>
                        </div>
                        <div class="layui-tab-item">内容2</div>
                        <div class="layui-tab-item">内容3</div>
                    </div>
                </div>
            </div>
            <!--博客信息-->
            <div class="blog-panel">
                <div class="panel-title">
                    <h5>
                        <i class="fa fa-info-circle"></i>
                        <span class="font-strong">博客信息</span>
                    </h5>
                    <hr>
                    <ul class="info-list">
                        <li>
                            <i class="fa fa-file"></i>&nbsp;
                            <span>文章总数：&nbsp; 124 篇</span>
                        </li>
                        <li>
                            <i class="fa fa-tags"></i>&nbsp;
                            <span>标签总数：&nbsp; 124 篇</span>
                        </li>
                        <li>
                            <i class="fa fa-folder-open"></i>&nbsp;
                            <span>分类总数：&nbsp; 124 篇</span>
                        </li>
                        <li>
                            <i class="fa fa-comment"></i>&nbsp;
                            <span>留言数量：&nbsp; 124 篇</span>
                        </li>
                        <li>
                            <i class="fa fa-calendar-times-o"></i>&nbsp;
                            <span>运行天数：&nbsp; 124 篇</span>
                        </li>
                        <li>
                            <i class="fa fa-pencil-square"></i>&nbsp;
                            <span>最后更新：&nbsp; 124 篇</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="demo2">
    # OneBlog简介
    OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。

    **网站预览**

    [https://www.zhyd.me](https://www.zhyd.me)

    **开源地址**
    1. [Gitee](https://gitee.com/yadong.zhang/DBlog)
    2. [Github](https://github.com/zhangyd-c/DBlog)

    ## 写在前面的话
    ps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：

    发现更新代码了 --> 下载源码后重复上面的步骤
    发现没更新代码 --> 直接关闭浏览器

    虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：

    **如果喜欢，请多多分享！！多多Star！！fork可以，但还是请star一下！！**


    ### 开发环境

    | 工具    | 版本或描述                |
    | ----- | -------------------- |
    | OS    | Windows 7            |
    | JDK   | 1.7+                 |
    | IDE   | IntelliJ IDEA 2017.3 |
    | Maven | 3.3.1                |
    | MySQL | 5.6.4                |

    ### 模块划分

    | 模块         | 释义                      |
    | ---------- | ----------------------- |
    | blog-core  | 核心业务类模块，提供基本的数据操作、工具处理等 |
    | blog-admin | 后台管理模块                  |
    | blog-web   | 前台模块                    |


    ### 技术栈

    - Springboot 1.5.9
    - Apache Shiro 1.2.2
    - Logback
    - Redis
    - Lombok
    - Websocket
    - MySQL、Mybatis、Mapper、Pagehelper
    - Freemarker
    - Bootstrap 3.3.0
    - wangEditor
    - jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck
    - 阿里云OSS
    - kaptcha
    - Qiniu
    - ...


    ### 使用方法

    1. 使用IDE导入本项目
    2. 新建数据库`CREATE DATABASE dblog;`
    3. 导入数据库`docs/db/dblog.sql`
    4. 修改(`resources/application.yml`)配置文件
    1. 数据库链接属性(可搜索`datasource`或定位到L.19)
    2. redis配置(可搜索`redis`或定位到L.69)
    3. mail配置(可搜索`mail`或定位到L.89)
    4. 【[七牛云](http://qiniu.com)】配置(见sys_config表中qiniu_*开头的字段)
    注：因为系统存在redis缓存，如果是第一次使用，可以直接修改sys_config表内容，如果不是第一次用，建议使用admin项目中的`系统配置`页面修改相关配置内容
    5. 运行项目(三种方式)
    1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true`编译打包，然后执行`java -jar target/blog-web.jar`
    2. 项目根目录下执行`mvn springboot:run`
    3. 直接运行`BlogWebApplication.java`
    6. 浏览器访问`http://127.0.0.1:8443`


    **后台用户**

    _超级管理员_： 账号：root  密码：123456  （本地测试使用这个账号，admin没设置权限）

    _普通管理员_： 账号：admin  密码：123456

    _评论审核管理员_： 账号：comment-admin  密码：123456

    注：后台用户的创建，尽可能做到**权限最小化**

    更多详情，请参考【[Wiki](https://gitee.com/yadong.zhang/DBlog/wikis)】

    ### 更新日志

    2018-06-10

    **修改功能：**

    新增：
    markdown版的编辑器、评论框
    控制文章的评论框是否显示
    修改密码功能
    优化：相关页面进行优化

    2018-06-05

    **修改功能：**

    修复： admin用户首页报错的问题

    优化：
    1. ROOT用户默认拥有所有权限
    2. admin页面改为macro引用的方式
    3. 登录界面
    4. 日志记录

    2018-05-25

    **修改功能：**

    1. 修复后台标签等分页失败的问题
    2. 修复前台自动申请友链失败的问题
    3. 其他一些问题


    2018-05-22

    **修改功能：**

    1. 完善shiro权限（数据库、页面）。注：需要重新执行下`sys_resources`和`sys_role_resources`两张表的`insert`语句
    2. redis配置默认不含密码（鉴于大多数朋友的redis都没有密码做此修改，不过本人 **强烈建议**设置下密码）

    2018-05-18

    **修复bug：**

    1. web端自动申请友链后不显示的问题
    2. config表修改后不能实时刷新的问题

    **增加功能：**
    1. 网站赞赏码
    2. 百度推送功能(链接提交到百度站长平台)

    **修改功能：**
    1. 百度api的ak和百度推送的token以及七牛云的配置改为通过config表管理
    3. admin模块菜单通过标签实时获取
    3. 弹窗工具类js结构调整

    你能看到这儿已经很不容易了，剩下的自己先摸索摸索吧，实在不行，加QQ群[190886500](http://shang.qq.com/wpa/qunwpa?idkey=9f986e9b33b1de953e1ef9a96cdeec990affd0ac7855e00ff103514de2027b60)，进群可以选择性的备注：~~欧巴群主我爱你~~(咳咳，鉴于部分群友的抗议，该备注就不用了)，麻烦大家换成：`我猜群主一定很帅`

    ### 图片预览

    **前台页面**
    ![PC-首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-index.png?v=1.0)
    ![PC-文章详情页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/pc-detail.png?v=1.0)
    ![手机](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/m.png?v=1.0)
    **后台页面**
    ![首页](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-index.png?v=1.0)
    ![菜单](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-menu.png?v=1.0)
    ![文章列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-articles.png?v=1.0)
    ![发表文章](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-article2.png?v=1.0)
    ![markdown版的编辑器](https://gitee.com/uploads/images/2018/0610/145228_06541ada_784199.png?v=1.0 "markdown版的编辑器")
    ![角色列表](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role.png?v=1.0)
    ![角色分配](https://gitee.com/yadong.zhang/DBlog/raw/master/docs/img/admin-role2.png?v=1.0)


    ### 生命不息，折腾不止！ 更多信息，请关注：
    1. [我的博客](https://www.zhyd.me)
    2. [我的微博](http://weibo.com/211230415)
    3. [我的头条号](http://www.toutiao.com/c/user/3286958681/)
    4. [我的mooc](http://www.imooc.com/u/1175248/articles)

    ### 有任何问题可以
    - [给我留言](https://www.zhyd.me/guestbook)


    ### 开源协议

    [MIT](https://gitee.com/yadong.zhang/OneBlog/blob/master/LICENSE)
</div>
<div id="demo1" class="markdown-body">
    ## Try CommonMark

    You can try CommonMark here.  This dingus is powered by
    [commonmark.js](https://github.com/jgm/commonmark.js), the
    JavaScript reference implementation.

    1. item one
    2. item two
        - sublist
        - sublist


    <!--![Showdown][sd-logo]-->
    <!--Showdown is a Javascript Markdown to HTML converter, based on the original works by John Gruber. It can be used client side (in the browser) or server side (with Node or io).-->
    <!--# Installation-->
    <!--## Download tarball/nYou can download the latest release tarball directly from [releases]-->
    <!--# Marked in the browser\n\nRendered by **marked**.-->
</div>
<footer>
    <div class="blog-panel text-center footer-info">

        Copyright © 2017 Blog小站 All rights reserved.

        <a href="#map">站点地图</a>
    </div>
</footer>
<script>
    layui.use(['element', 'jquery', 'util'], function () {
        var element = layui.element
            , util = layui.util,
            $ = layui.jquery;

        //    fixBar
        util.fixbar({
            bgcolor: '#009a61bf'
        });
        //初始化评论框
        var simplemde = new SimpleMDE({
            element: document.getElementById("comment-area"),
            autoDownloadFontAwesome: false,
            status: false,
            hideIcons: ['heading', 'unordered-list', 'ordered-list', 'link', 'image', 'fullscreen']
            // showIcons: ['bold','italic','code','quote','preview','guide']
        });
        //回复点击逻辑
        $('#reply-A').click(function () {
            var comment_form = $('#comment-form');
            if (!$(this).hasClass('pull-right')) {
                $(this).parent().after(comment_form);
                $(this).addClass('pull-right').html('<i class="fa fa-share"></i> 取消回复');
            }else {
                $('#comment-post').after(comment_form);
                $(this).removeClass('pull-right').html('<i class="fa fa-reply"></i> 回复');
            }
        });
        console.log("goood");
        var article = $('#demo2').text().split('\n');
        var art = [];
        var par = /^\s{4}/;
        $.each(article,function (i,n) {
            // console.log(n.match(par));
            n=n.replace(/^\s{4}/,'');
            // n= $.trim(n);
            if(n != ''){
            console.log( "Item #" + i + ": " + n );
            art.push(n);
            }



        });
            console.log(art.join('\n'));
        document.getElementById('content').innerHTML =
            // marked('# 文章待填');
            marked(art.join('\n'));
        console.log(marked(art.join('\n')));
    });

</script>
</body>
</html>