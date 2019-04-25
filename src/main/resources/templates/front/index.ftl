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
                        <div class="carousel-item active">
                            <img src="/static/images/item1.jpg" height="500px" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>First slide label</h5>
                                <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="/static/images/item2.jpg" height="500px" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Second slide label</h5>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="/static/images/item3.jpg" height="500px" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Third slide label</h5>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
                            </div>
                        </div>
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

                <div class="media rounded p-3 bg-white shadow-sm mt-3">
                    <img class="mr-3" src="/static/images/20181024185055343.jpg" height="150" width="150"
                         alt="Generic placeholder image">
                    <div class="media-body pr-1"
                         style="min-width: calc(100% - 180px);max-height: 150px;overflow: hidden;">
                        <h5 class="mt-0 text-truncate">
                            <a href="/article/${article.id}" class="text-dark">${article.title}</a>
                        </h5>
                        ${article.content}
                    </div>
                </div>
                </#list>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>

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
                <div class="blog-panel blog-tag bg-white">
                    <div class="panel-title">
                        <h5>
                            <i class="fa fa-tags" aria-hidden="true"></i>
                            <span class="">文章标签</span>
                        </h5>
                        <hr>

                    </div>
                    <div class="tag-body">
                        <div class="tag-content">
                            <#list tags as tag>

                            <a href="#tag" class="border-gray text-decoration-none">${tag.name}</a>
                            </#list>
                        </div>
                    </div>

                </div>
                <!--文章列表-->
                <div class="blog-panel article-list">
                    <ul class="nav nav-tabs justify-content-around flex-nowrap" id="myTab" role="tablist" >
                        <li class="nav-item">
                            <a class="nav-link active border-0 text-dark" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">
                              <i class="fa fa-list"></i>  近期文章</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link border-0 text-dark" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">
                               <i class="fa fa-thumbs-up"></i> 站长推荐</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link border-0 text-dark" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">
                               <i class="fa fa-hand-peace-o"></i> 随机文章</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <ul class="article-list list-unstyled ">
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
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
                    </div>
                </div>
                <!--博客信息-->
                <div class="blog-panel">
                    <div class="panel-title">
                        <h5>
                            <i class="fa fa-info-circle"></i>
                            <span class="">博客信息</span>
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
</div>
<@footer>

</@footer>
