<#macro  header>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/front/header.css">
    <link rel="stylesheet" href="/static/css/front/common.css">
    <link rel="stylesheet" href="/static/css/front/footer.css">
    <link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <script src="/webjars/jquery/3.2.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.1.3/js/bootstrap.bundle.js"></script>
    <#nested >
    <title>Blog小站</title>
</head>
<body style="background-color: #f3f6f8;">
    <#include "/front/header.ftl">
</#macro>

<#macro footer>
    <#include "/front/footer.ftl">
    <#nested >
</body>
</html>
</#macro>