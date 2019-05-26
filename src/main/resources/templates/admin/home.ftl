<#include "/include/macros.ftl"/>
<@header>

</@header>

<div class=" d-flex justify-content-between flex-wrap">
    <div class="shadow-sm bg-white rounded item">
        <a href="/admin/article/list" class="d-flex p-2 align-items-center" >
            <div class="item-count ml-3 mr-5">
                <h2>${articleCount!0}</h2>
                <h6>文章</h6>
            </div>
            <div class="item-icon ml-5 mr-2">
                <i class="fa fa-envira" style="font-size: 40px"></i>
            </div>
        </a>
    </div>
    <div class="shadow-sm bg-white rounded item">
        <a href="/admin/article/type" class="d-flex p-2 align-items-center" onclick="auth()">
            <div class="item-count ml-3 mr-5">
                <h2>${typeCount!0}</h2>
                <h6>分类</h6>
            </div>
            <div class="item-icon ml-5 mr-2">
                <i class="fa fa-th" style="font-size: 40px"></i>
            </div>
        </a>
    </div>
    <div class="shadow-sm bg-white rounded item">
        <a href="/admin/article/tag" class="d-flex p-2 align-items-center">
            <div class="item-count ml-3 mr-5">
                <h2>${tagCount!0}</h2>
                <h6>标签</h6>
            </div>
            <div class="item-icon ml-5 mr-2">
                <i class="fa fa-tags" style="font-size: 40px"></i>
            </div>
        </a>
    </div>
    <div class="shadow-sm bg-white rounded item">
        <a href="/admin/article/comment" class="d-flex p-2 align-items-center">
            <div class="item-count ml-3 mr-5">
                <h2>4</h2>
                <h6>评论</h6>
            </div>
            <div class="item-icon ml-5 mr-2">
                <i class="fa fa-comment" style="font-size: 40px"></i>
            </div>
        </a>
    </div>
</div>
<div class="mt-4 d-flex justify-content-between">
    <div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
        <h5>最近文章</h5>
        <hr>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">标题</th>
                <th scope="col">分类</th>
                <th scope="col">浏览数</th>
                <th scope="col">发布时间</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@TwBootstrap</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td colspan="2">Larry the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
        <h5>最近文章</h5>
        <hr>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">发起人</th>
                <th scope="col">评论内容</th>
                <th scope="col">出处</th>
                <th scope="col">评论时间</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@TwBootstrap</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td colspan="2">Larry the Bird</td>
                huang
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<@footer>
<script>
    function auth(e) {
        e.preventDefault();
        alert("good");

    }
</script>
</@footer>
