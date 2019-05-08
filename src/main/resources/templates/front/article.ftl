<#include "/include/front.ftl"/>
<@header>
<link rel="stylesheet" href="/static/css/simplemde.min.css"/>
<link rel="stylesheet" href="/static/css/front/article.css">
<link rel="stylesheet" href="/static/css/front/markdown.css">
</@header>
<div class="container p-0" style="max-width: 88%;">
    <div class="row ">

        <div class="col-9">
            <div class="blog-banner">
        <span class="layui-breadcrumb">
          <a href="/"><i class="fa fa-home"></i>&nbsp; 首页 </a>
          <a href="">国际新闻</a>
          <a href="">亚太地区</a>
          <a><cite>正文</cite></a>
        </span>
            </div>
            <div class="blog-panel">
                <div class="article-banner">
                    <span class="pull-left article-flag yc text-center">原创</span>
                    <div class="pull-right">
                    <span class="article-meta">
                        <i class="fa fa-clock-o"></i>
                        <span class="inl">${(article.createTime?datetime)!"未知时间"}</span>&nbsp;&nbsp;
                        <i class="fa fa-eye" aria-hidden="true"></i>
                        <span>浏览(${(article.look)!"0"})</span>&nbsp;&nbsp;
                        <i class="fa fa-comments-o" aria-hidden="true"></i>
                        <span>0</span>
                    </span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="article-content markdown-body border-bottom-0 border-left-0 border-right-0" id="content">
                    <#--<div data-spy="scroll" data-target="#article-scroll" data-offset="0" class="scrollspy-example">-->
                    ${(article.contentHTML)!""}

                    <#--</div>-->
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
                <p>所属分类： &nbsp;<a href="/type/${article.typeId}/1" style="color: #009a61;font-size: 16px">Java</a></p>
            </div>
            <div class="blog-panel article-tag" style="margin-top: 15px;">
                <p>
                    <strong>本文标签：</strong>
                    <#if tags??>
                        <#list tags as tag>

                        <span><a href="/tag/${tag.id}/1">${tag.name}</a></span>
                        </#list>
                    </#if>
                </p>
                <p>
                    <strong>版权声明：</strong>
                    本站原创文章，于2018年09月12日由BLOG发布，转载请注明出处
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

                    <div class="h5">
                        <i class="fa fa-fire"></i>
                        热门推荐
                    </div>
                </div>
                <div class="hr"></div>
                <ul class="article-hot list-unstyled">
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
                    <div class="h5">
                        <i class="fa fa-google-wallet"></i>
                        相关文章
                    </div>
                    <div class="hr"></div>
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
                    <div class="h5">
                        <i class="fa fa-commenting-o"></i>
                        评论
                    </div>
                    <div class="hr"></div>
                    <div class="" id="commentContent">
                        <input type="hidden" value="${article.id}">
                        <textarea name="" required placeholder="请输入" class="layui-textarea CodeMirror CodeMirror-scroll"
                                  id="comment-area">
                        </textarea>
                        <button data-toggle="modal" data-target="#commentModal" class="btn btn-primary pull-right"
                                style="margin: 15px 0">提交评论
                        </button>
                        <div class="clearfix"></div>
                    </div>

                </div>
                <div class="panel-title">
                    <div class="h5">
                        <i class="fa fa-comments-o"></i>
                        <em style="font-size: 18px;color: red;font-weight: 700;font-family: Georgia;">${comments?size!"0"}</em>
                        条评论
                    </div>
                </div>
                <div class="hr"></div>
                <#if comments??>
                <ul class="list-unstyled">
                    <#list comments as comment>

                        <li class="content-li">
                            <div class="comment-header">
                                <div class="user-img">
                                    <img src="/static/images/user.png" alt="">
                                </div>
                                <div class="user-info">
                                    <div class="nickname">
                                        <a href="#" style="color: #009a61;"><strong>${(comment.username)!"匿名"}</strong></a>

                                    </div>
                                    <div class="timer">
                                        <i class="fa fa-clock-o"></i>
                                        ${(comment.createTime?datetime)!"未知时间"} &nbsp;
                                        <i class="fa fa-map-marker"></i>
                                        上海浦东新区
                                    </div>
                                </div>
                            </div>
                            <div class="hr"></div>
                            <div class="comment-content">
                                <#if comment.parent??>
                                    <a class="" href="#">@${(comment.parent.username)!""}</a>
                                    <div class="alert alert-secondary"
                                         style="background-color: #eeeeee;border-color: white" role="alert">
                                        ${(comment.parent.content)!""}
                                    </div>

                                </#if>
                                ${(comment.content)!""}</div>
                            <div class="hr"></div>
                            <div class="content-meta" style="">
                                <a href="#">
                                    <i class="fa fa-thumbs-up"></i> 赞(${(comment.favorate)!"0"})
                                </a>
                                <i class="sepa"></i>

                                <input type="hidden" name="id" value="${comment.id}">
                                <a id="" class="reply-A" style="padding-right: 15px;cursor: pointer;">
                                    <i class="fa fa-reply"></i> 回复
                                    <!--<i class="fa fa-share"></i> 取消回复-->
                                </a>
                            </div>
                        </li>
                    </#list>
                </ul>
                </#if>
            </div>
        </div>
        <div class="col-3">
            <!--说给你听-->
            <div class="blog-panel mt-3">
                <div class="panel-title">
                    <div class="h5">
                        <i class="fa fa-hand-peace-o"></i>
                        说给你听
                    </div>
                </div>
                <div class="hr"></div>
                <p class="mb-0 py-2 pl-2" style="border-left: none; background-color: #f5f5f5;">
                    路一步一步走，坑一个一个踩。
                </p>
            </div>
            <!--文章目录-->
            <div class="blog-panel " id="article-wrapper">
                <div class="panel-title">
                    <div class="h5">
                        <i class="fa fa-book"></i>
                        文章目录
                    </div>
                </div>
                <div class="hr"></div>
                <div id="article-scroll" class="list-group">
                    <ul class="nav " role="tablist">

                    </ul>
                    <#--<a class="list-group-item list-group-item-action" href="#list-item-4">Item 4</a>-->
                </div>
            </div>

            <!--标签云-->
            <@tagCart></@tagCart>
            <!--近期、推荐、随机文章列表-->
            <@articlelistCart></@articlelistCart>
            <!--博客信息-->
            <@bloginfoCart></@bloginfoCart>
        </div>
        <div class="modal" tabindex="-1" data-backdrop="static" role="dialog" id="commentModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="h5 modal-title" id="exampleModalLabel">评论信息框</div>
                    </div>
                    <div class="modal-body">
                        <form id="commentForm">
                            <input type="hidden" value="${article.id}" name="aid">
                            <input type="hidden" name="pid">
                            <div class="form-group">
                                <label for="">昵称</label>
                                <input type="text" name="username" class="form-control" id=""
                                       aria-describedby="emailHelp" placeholder="" value="匿名">
                            </div>
                            <div class="form-group">
                                <label for="">邮箱</label>
                                <input type="email" name="email" class="form-control" id="" aria-describedby="emailHelp"
                                       placeholder="">
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                            <button type="button" id="commentBtn" class="btn btn-primary">提交</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<@footer>
<script src="/static/js/simplemde.min.js"></script>
<script>
    //初始化评论框
    var simplemde = new SimpleMDE({
        element: document.getElementById("comment-area"),
        autoDownloadFontAwesome: false,
        status: false,
        hideIcons: ['heading', 'unordered-list', 'ordered-list', 'link', 'image', 'fullscreen']
        // showIcons: ['bold','italic','code','quote','preview','guide']
    });
    //回复点击逻辑
    $('.reply-A').click(function () {
        var comment_form = $('#commentContent');
        var pid = $(this).parent().find('input[name="id"]').val();
        if (!$(this).hasClass('pull-right')) {
            $(this).parent().after(comment_form);
            $('#commentModal').find('input[name="pid"]').val(pid);
            $(this).addClass('pull-right').html('<i class="fa fa-share"></i> 取消回复');
        } else {
            $('#comment-post').after(comment_form);
            $(this).removeClass('pull-right').html('<i class="fa fa-reply"></i> 回复');
            $('#commentModal').find('input[name="pid"]').val(0);
        }
        console.log(pid);
    });
    //    评论提交
    $('#commentBtn').click(function (e) {
        e.preventDefault();
        var content = simplemde.value();
        console.log($('#commentForm').serialize() + '&content=' + simplemde.value());
        var data = $('#commentForm').serialize() + '&content=' + simplemde.value();


        $.post({
            url: '/comment/add',
            data: data,
            success: function (res) {
                $('#commentModal').modal('hide');
                alert(res.msg);
                window.location.reload();
            }
        })

    });
    //滚动监听功能实现
    var mdhead = $('.markdown-body').children('h1,h2,h3,h4,h5');
    $.each(mdhead,function (i, value) {
        $(value).attr('id',$(value).prop('tagName')+i);
        // console.log($(value).prop('tagName')+': '+ $(value).text());
        $('#article-scroll').find('ul').append('<a class="px-3 py-1 border-0 list-group-item list-group-item-action" href=#'+$(value).attr('id')+'>'+$(value).text()+'</a>')
    });
    var dh = $(document).height();
    var vh = $(window).height();
    var sHeight = dh -vh;
    var ah = $('#article-wrapper').height();
    var aw = $('#article-wrapper').innerWidth();
    console.log('dh:'+dh+'; vh:' + vh+';ah:'+ah);
    var offsetA = $('#article-wrapper').offset();
    $(window).scroll(function () {
        if ($(window).scrollTop() > offsetA.top) {
            $('#article-wrapper').css({position:'fixed',top:'50px',width:aw*2/3,right:0});
            return;
        }else{
            $('#article-wrapper').css({position:'static',width:aw});
        }
        console.log($(window).scrollTop());
    })


</script>
</@footer>
