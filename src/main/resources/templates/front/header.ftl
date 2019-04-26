<header class="bg-white border-bottom py-1 ">
    <div class="container  mw-100">

        <nav class="navbar navbar-expand-lg navbar-light px-0 py-2 ">
            <a class="navbar-brand" href="/">BLOG</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <@customTag method="types">
                        <#if types??>
                            <#list types?sort_by("order") as parent>
                                <#if parent.children?size gt 0 >
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#"
                                       role="button"
                                       data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false" data-offset="10,60">
                                        ${parent.name}
                                    </a>
                                    <div class="dropdown-menu">
                                        <#list parent.children as child>

                                        <a class="dropdown-item" href="/${child.id}">${child.name}</a>
                                        </#list>
                                    </div>
                                </li>
                                <#else>
                                <li class="nav-item">
                                    <a class="nav-link" href="/${parent.id}">${parent.name}</a>
                                </li>
                                </#if>

                            </#list>

                        </#if>
                    </@customTag>
                    <li class="nav-item">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </li>

                </ul>
            </div>
        </nav>
    </div>
</header>
