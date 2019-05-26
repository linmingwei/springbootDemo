<div class="side-scroll">

    <div class="left side-menu">
        <div class="brand" style="position: fixed;top: 0;">
            <img src="/static/images/logo.png" alt="logo">

        </div>
        <div class="user-box d-flex pl-4" style="padding-top: 7rem;">
            <div class="user-img flex-grow-1">
                <img class="rounded-circle img-fluid" width="48" height="48" src="/static/images/head.jpg" alt="">
            </div>
            <div class="user-info w-50 ">
                <h6 class="text-truncate"><a href="#"><@shiro.principal property="nickname"/></a></h6>
                <p class="text-truncate text-muted"><@shiro.principal property="username"/></p>
            </div>
        </div>
        <div id="sidebar-menu">
            <ul class="d-flex flex-column" id="side-menu">
                <li class=" py-2" id="home_li">
                    <a class="" href="/admin/home">
                        <i class="fa fa-home" aria-hidden="true"></i>
                        <span class="d-inline-block ml-2">首页</span>
                    </a>
                </li>
                <@customTag method="resources">
                    <#if resources??>
                        <#list resources as resource>
                        <li class=" py-2 " id="${(resource.alias)!""}_li">
                            <a data-toggle="collapse" href="#${(resource.alias)!""}-mng" role="button" aria-expanded="false"
                               aria-controls="article-mng">
                                <i class="${(resource.icon)!""}" aria-hidden="true"></i>
                                <span class="d-inline-block ml-2">${(resource.name)!""}</span>
                            </a>
                            <div class="collapse" id="${(resource.alias)!""}-mng">
                            <#if resource.children?? && resource.children?size gt 0>
                                <ul class="d-flex flex-column list-unstyled pl-4 pt-2">
                                    <#list resource.children as child>
                                        <#if child.permission??>
                                            <@shiro.hasPermission name="${child.permission?if_exists}">
                                             <li class="py-2 px-2" id="${(resource.alias)!""}_${(child.alias)!""}">
                                                 <a class="" href="${(child.url)!""}">
                                                     <span class="d-inline-block ml-2">${(child.name)!""}</span>
                                                 </a>
                                             </li>
                                            </@shiro.hasPermission>
                                        <#--<#else>-->
                                     <#--<li class="py-2 px-2" id="${(resource.alias)!""}_${(child.alias)!""}">-->
                                         <#--<a class="" href="${(child.url)!""}">-->
                                             <#--<span class="d-inline-block ml-2">${(child.name)!""}</span>-->
                                         <#--</a>-->
                                     <#--</li>-->
                                        </#if>
                                    </#list>
                                </ul>
                            </#if>
                            </div>
                        </li>

                        </#list>
                    </#if>
                </@customTag>
            </ul>
        </div>

    </div>
</div>
