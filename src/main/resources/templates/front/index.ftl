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
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <#list carouselArticles as carousel>
                            <div class="carousel-item ${(carousel?counter == 1)?then("active","")}">
                                <img src="/${(article.image)!"static/images/item1.jpg"}" height="500px"
                                     class="d-block w-100" alt="...">
                                <div class="carousel-caption d-none d-md-block">
                                    <h1>${carousel.title}</h1>
                                    <p>${carousel.description}</p>
                                </div>
                            </div>
                        </#list>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <#list articles as article>

                <div class="media position-relative rounded p-3 bg-white shadow-sm mt-3">
                    <img class="mr-3" src="/${(article.image)!"static/images/20181024185055343.jpg"}" height="150"
                         width="150"
                         alt="Generic placeholder image">
                    <div class="media-body pr-1"
                         style="min-width: calc(100% - 180px);max-height: 150px;overflow: hidden;">
                        <h5 class="mt-0 text-truncate">
                            <a href="/${article.typeId}/${article.id}" class="text-dark">${article.title}</a>
                        </h5>
                        ${(article.description)!""}
                    </div>
                    <div class="media-footer">
                        <span class="article-meta">
                            <i class="fa fa-calendar-o"></i>
                            <span class="inl">${(article.createTime?datetime)!"未知时间"}</span>&nbsp;&nbsp;
                            <i class="fa fa-eye" aria-hidden="true"></i>
                            <span>浏览(${(article.look)!"0"})</span>&nbsp;&nbsp;
                            <i class="fa fa-comments-o" aria-hidden="true"></i>
                            <span>0</span>
                        </span>
                        <div class="read-all position-absolute text-center">
                            <a href="/${article.typeId}/${article.id}" >
                            阅读全文</a>
                        </div>

                    </div>
                </div>
                </#list>

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
                        <img class="mr-3 rounded-circle" src="/static/images/20181024185055343.jpg" width="60"
                             height="60" alt="avater">
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
