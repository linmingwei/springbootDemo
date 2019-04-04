<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/static/css/home.css"/>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.bundle.js"></script>
    <title>Document</title>
</head>
<body class="bg-light">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3" style="min-height: 100vh;background-color: #222d32;">
            <div class="sidebar">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" style="color: #b8c7ce;" aria-expanded="false" aria-controls="article_drp" data-toggle="collapse"
                           href="#article_drp" role="button">Dashboard</a>
                        <ul id="article_drp" class="collapse">
                            <li class="c-li">
                                <a href="#" class="nav-link">
                                    Child Dashboard
                                </a>
                            </li>

                        </ul>
                    </li>
            </div>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg navbar-light bg-white p-0">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-lg-end px-2 py-3" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item active pl-1 pr-1">
                            <a class="nav-link" href="#">访问前台 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item pl-1 pr-1">
                            <a class="nav-link" href="#">访问前台</a>
                        </li>
                        <li class="nav-item pl-1 pr-1">
                            <a class="nav-link" href="#">
                            </a>
                        </li>
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle text-hide" data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false" data-offset="10,20">

                                <img src="/images/head.jpg" class="img-thumbnail" width="40" height="40" alt="">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
