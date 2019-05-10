<!--文章列表-->
                <div class="blog-panel article-list">
                    <ul class="nav nav-tabs justify-content-around flex-nowrap" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active border-0 " id="home-tab" data-toggle="tab" href="#home" role="tab"
                               aria-controls="home" aria-selected="true">
                                <i class="fa fa-list"></i> 近期文章</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link border-0 " id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                               aria-controls="profile" aria-selected="false">
                                <i class="fa fa-thumbs-up"></i> 站长推荐</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link border-0 " id="contact-tab" data-toggle="tab" href="#contact" role="tab"
                               aria-controls="contact" aria-selected="false">
                                <i class="fa fa-hand-peace-o"></i> 随机文章</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active " id="home" role="tabpanel"
                             aria-labelledby="home-tab">
                            <ul class="article-list list-unstyled ">
                                <@customTag method="recentArticle">
                                    <#if recentArticle??>
                                        <#list recentArticle as article>
                                        <li>
                                            <a href="/${article.typeId}/${article.id}"
                                               class="text-truncate text-decoration-none">${article.title}</a>
                                        </li>
                                        </#list>
                                    </#if>
                                </@customTag>
                            </ul>

                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <ul class="article-list list-unstyled ">
                            <@customTag method="recommendArticle">
                                <#if recommendArticle??>
                                    <#list recommendArticle as article>
                                    <li>
                                        <a href="/${article.typeId}/${article.id}"
                                           class="text-truncate text-decoration-none">${article.title}</a>
                                    </li>
                                    </#list>
                                </#if>
                            </@customTag>
                            </ul>


                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <ul class="article-list list-unstyled ">
                            <@customTag method="randomArticle">
                                <#if randomArticle??>
                                    <#list randomArticle as article>
                                    <li>
                                        <a href="/${article.typeId}/${article.id}"
                                           class="text-truncate text-decoration-none">${article.title}</a>
                                    </li>
                                    </#list>
                                </#if>
                            </@customTag>
                            </ul>

                        </div>
                    </div>
                </div>
