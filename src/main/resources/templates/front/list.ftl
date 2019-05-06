<#include "/include/front.ftl"/>
<@header >
<link rel="stylesheet" href="/static/css/front/index.css">
</@header>
<div class="blog-body">
    <div class="container  p-0 mw-100">
        <div class="row" style="margin-right: 0px;">
            <div class="col-9 ">
                <div class="blog-banner">
                    <i class="fa fa-volume-up" style="color:#007769">&nbsp;&nbsp;</i>
                    <a href="#banner" class="text-success">This is a Bannner</a>
                </div>
                <#list page.list as article>

                <div class="media rounded p-3 bg-white shadow-sm mt-3">
                    <img class="mr-3" src="/static/images/20181024185055343.jpg" height="150" width="150"
                         alt="Generic placeholder image">
                    <div class="media-body pr-1"
                         style="min-width: calc(100% - 180px);max-height: 150px;overflow: hidden;">
                        <h5 class="mt-0 text-truncate">
                            <a href="/${article.typeId}/${article.id}" class="text-dark">${article.title}</a>
                        </h5>
                        ${(article.description)!""}
                    </div>
                </div>
                </#list>
                <#if page.pages gt 1>
                <nav aria-label="Page navigation example">
                    <ul class="pagination d-flex justify-content-end mt-4">
                        <li class="page-item"><a class="page-link" href="${baseUrl!""}/1">首页</a></li>
                        <#if page.hasPreviousPage>
                        <li class="page-item"><a class="page-link" href="${baseUrl!""}/${page.pageNum-1}">上一页</a></li>
                        <#else >
                        <li class="page-item disabled">
                            <span class="page-link">上一页</span>
                        </li>
                        </#if>
                        <#list page.navigatepageNums as num>
                            <#if num == page.pageNum>
                            <li class="page-item active"><a class="page-link" href="${baseUrl!""}/${num}">${num}</a></li>
                            <#else >
                        <li class="page-item"><a class="page-link" href="${baseUrl!""}/${num}">${num}</a></li>
                            </#if>

                        </#list>
                        <#if page.hasNextPage>
                        <li class="page-item"><a class="page-link" href="${baseUrl!""}/${page.pageNum+1}">下一页</a></li>
                        <#else >
                        <li class="page-item disabled">
                            <span class="page-link">下一页</span>
                        </li>
                        </#if>
                        <li class="page-item"><a class="page-link" href="${baseUrl!""}/${page.pages}">末页</a></li>

                    </ul>
                </nav>
                </#if>

            </div>

            <div class="col-3 mt-3 ">
                <!--<div style="height: 5px;"></div>-->
                <div class="shadow-sm rounded bg-white ">
                    <div class="panel-title pt-2 px-2">
                        <h5>
                            <i class="fa fa-tags" aria-hidden="true"></i>
                            <span class="">关于我</span>
                        </h5>
                        <hr>

                    </div>
                    <div class="media pl-3" style="font-size: 13px;">
                        <img class="mr-3 rounded-circle" src="/static/images/20181024185055343.jpg" width="60" height="60" alt="avater">
                        <div class="media-body">
                            <h5 class="mt-0 text-dark">BLOG</h5>
                            一个程序员的个人博客，心之所向，无所不能
                        </div>
                    </div>
                    <ul class="social px-2 pb-3 justify-content-around d-flex flex-row list-unstyled ">
                        <li><a href="#social-weixin" class="weixin-icon ">
                            <i class="fa fa-weixin fa-2x" aria-hidden="true"></i>
                        </a></li>
                        <li><a href="#social-qq " class="qq-icon">
                            <i class="fa fa-qq fa-2x" aria-hidden="true"></i>
                        </a></li>
                        <li><a href="#social-weibo" class="weibo-icon">
                            <i class="fa fa-weibo fa-2x" aria-hidden="true"></i>
                        </a></li>
                        <li><a href="#social-github " class="github-icon">
                            <i class="fa fa-github fa-2x" aria-hidden="true"></i>
                        </a></li>
                    </ul>

                </div>

                <!--标签云-->
                <@tagCart></@tagCart>
                <!--文章列表-->
                <@articlelistCart></@articlelistCart>
                <!--博客信息-->
                <@bloginfoCart></@bloginfoCart>
            </div>
        </div>
    </div>
</div>
<@footer>
<script>

</script>
</@footer>
