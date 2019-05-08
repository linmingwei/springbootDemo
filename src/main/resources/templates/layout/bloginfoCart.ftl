<!--博客信息-->
                <div class="blog-panel">
                    <div class="panel-title">
                        <div class="h5">
                            <i class="fa fa-info-circle"></i>
                            <span class="">博客信息</span>
                        </div>
                        <div class="hr"></div>
                        <ul class="pl-3 info-list list-unstyled">
                            <@customTag method="website">

                            <li>
                                <i class="fa fa-file"></i>&nbsp;
                                <span>文章总数：&nbsp; ${website.articleNum} 篇</span>
                            </li>
                            <li>
                                <i class="fa fa-tags"></i>&nbsp;
                                <span>标签总数：&nbsp; ${website.tagNum} 个</span>
                            </li>
                            <li>
                                <i class="fa fa-folder-open"></i>&nbsp;
                                <span>分类总数：&nbsp; ${website.typeNum} 个</span>
                            </li>
                            <li>
                                <i class="fa fa-comment"></i>&nbsp;
                                <span>留言数量：&nbsp; ${website.commentNum} 条</span>
                            </li>
                            <li>
                                <i class="fa fa-calendar-times-o"></i>&nbsp;
                                <span>运行天数：&nbsp; ${website.days} 天</span>
                            </li>
                            <li>
                                <i class="fa fa-pencil-square"></i>&nbsp;
                                <span>最后更新：&nbsp; ${website.updateTime}</span>
                            </li>
                            </@customTag>
                        </ul>
                    </div>
                </div>
