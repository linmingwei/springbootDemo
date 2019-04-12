<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.1.3/css/bootstrap.min.css"/>
    <script src="/webjars/jquery/3.2.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.1.3/js/bootstrap.bundle.js"></script>
    <style>
        .form-box {
            height: 80vh;
        }

        .wh-100 {
            margin: auto;
            width: 300px;
        }
    </style>
    <title>Document</title>
</head>
<body class="bg-light">
<div  class="d-flex justify-content-center align-items-center form-box">
    <form class="wh-100" novalidate>
        <div class="form-group">
            <label for="usernameInput">用户名</label>
            <input type="text" class="form-control" id="usernameInput" name="username" placeholder="请输入用户名" required>
        </div>
        <div class="form-group">
            <label for="passwordInput">密码</label>
            <input type="password" class="form-control" id="passwordInput" placeholder="请输入密码" required>
        </div>
        <button type="submit" class="btn btn-block btn-primary" style="margin-top: 30px;">登录</button>
    </form>
</div>
</body>
</html>
