<!--标签云-->
                <div class="blog-panel blog-tag bg-white">
                    <div class="panel-title">
                        <div class="h5">
                            <i class="fa fa-tags" aria-hidden="true"></i>
                            <span class="">文章标签</span>
                        </div>
                        <div class="hr"></div>

                    </div>
                    <div class="tag-body">
                        <div class="tag-content">
                            <@customTag method="tags">
                                <#if tags??>
                                    <#list tags as tag>
                                        <a href="/tag/${tag.id}/1" class="text-secondary border-gray text-decoration-none">${tag.name}</a>
                                    </#list>
                                </#if>
                            </@customTag>
                        </div>
                    </div>

                </div>
