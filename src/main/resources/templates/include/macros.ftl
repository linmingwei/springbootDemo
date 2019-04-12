<#macro header sidebar=true topbar=true>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="/static/css/home.css"/>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css"/>
        <script src="/webjars/jquery/3.2.1/jquery.min.js"></script>
        <script src="/webjars/bootstrap/4.1.3/js/bootstrap.bundle.js"></script>
        <#nested>
        <title>Document</title>
    </head>
    <body>
    <div class="wrapper">
        <#if sidebar>
            <#include "/layout/sidebar.ftl"/>
        </#if>
        <div class="content-page p-4">
            <#if topbar>
                <#include "/layout/topbar.ftl"/>
            </#if>
            <div class="content">
</#macro>
<#macro footer>

            </div>

        </div>
    </div>

    </body>
    <script>
        <#--点击sidebar激活样式-->

        $('#side-menu').children('li').click(function () {

            $(this).addClass("active").siblings('li').removeClass('active');
        })
    </script>
    <#nested>
    </html>
</#macro>

