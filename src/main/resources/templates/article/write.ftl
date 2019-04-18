<#include "/include/macros.ftl"/>
<@header>
<link rel="stylesheet" href="/static/css/simplemde.min.css"/>
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>文章发布</h4>
    <hr>
    <form action="/article/publish" method="post" id="article_form">
        <div class="form-group row">
            <label for="titleInput" class="col-sm-1 col-form-label">标题</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" name="title" id="titleInput" placeholder="标题">
            </div>
        </div>
        <div class="form-group">
            <textarea  id="article_editor"></textarea>
        </div>
        <div class="form-group row">
            <label for="typeInput" class="col-sm-1 col-form-label">分类</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="type" id="typeInput" placeholder="分类">
            </div>
            <label for="tagInput" class="col-sm-1 col-form-label">标签</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="tag" id="tagInput" placeholder="多个标签请用逗号分隔">
            </div>
        </div>
        <div class="form-group row">
            <label for="titleInput" class="col-sm-1 col-form-label">描述</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" name="description" id="titleInput" placeholder="描述">
            </div>
        </div>

        <div class="form-group row">
            <label for="comment" class="col-sm-1 col-form-label">评论</label>
            <div class="col-sm-5">
                <input type="checkbox" class="check-switch check-switch-anim mt-2" name="comment" id="comment" >
            </div>
            <label for="top" class="col-sm-1 col-form-label">置顶</label>
            <div class="col-sm-5">
                <input type="checkbox" class="check-switch check-switch-anim mt-2" name="top" id="top" >
            </div>

        </div>
        <div class="form-group text-right ">
            <button type="reset" class="btn btn-light">取消</button>
            <button class="btn btn-info" id="draft_btn">存草稿</button>
            <button type="submit" class="btn btn-primary" id="publish_btn">发布</button>
        </div>
    </form>
</div>
<@footer>
<script src="/static/js/simplemde.min.js"></script>
<script>
    var simplemde = new SimpleMDE({
        element: document.getElementById("article_editor"),
        spellChecker: false,
        autofocus: true,
        autoDownloadFontAwesome: false,
        placeholder: "Type here...",
        autosave: {
            enabled: true,
            uniqueId: "article_editor",
            delay: 1000
        },
        tabSize: 4,
        status: false,
        lineWrapping: false,
        renderingConfig: {
            codeSyntaxHighlighting: true
        }

    });
    $('#publish_btn').click(function (e) {
        e.preventDefault();
        var data = $('#article_form').serialize();
        data+='&content='+simplemde.value();
        console.log(data.comment);
        console.log(data);
        $.post({
            url:'/article/publish',
            data:data,
            success:function (res) {
                console.log(JSON.stringify(res));
            }
        })

    })

</script>
</@footer>