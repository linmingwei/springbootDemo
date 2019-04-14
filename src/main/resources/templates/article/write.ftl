<#include "/include/macros.ftl"/>
<@header>
<link rel="stylesheet" href="/static/css/simplemde.min.css"/>
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>文章发布</h4>
    <hr>
    <form>
        <div class="form-group row">
            <label for="titleInput" class="col-sm-1 col-form-label">标题</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" id="titleInput" placeholder="标题">
            </div>
        </div>
        <div class="form-group">
            <textarea id="article_editor"></textarea>
        </div>
        <div class="form-group row">
            <label for="typeInput" class="col-sm-1 col-form-label">分类</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="typeInput" placeholder="分类">
            </div>
            <label for="tagInput" class="col-sm-1 col-form-label">标签</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="tagInput" placeholder="多个标签请用逗号分隔">
            </div>
        </div>
        <div class="form-group row">
            <label for="titleInput" class="col-sm-1 col-form-label">描述</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" id="titleInput" placeholder="描述">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-6">

                <label for="canComment" class=" col-form-label">评论</label>
                <div class="custom-control custom-radio custom-control-inline ml-5 mt-2">
                    <input type="radio" id="canComment" name="canComment" class="custom-control-input">
                    <label class="custom-control-label" for="canComment">开启</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline mt-2">
                    <input type="radio" id="customRadioInline2" name="canComment" class="custom-control-input">
                    <label class="custom-control-label" for="customRadioInline2">关闭</label>
                </div>
            </div>
            <div class="col-6">

                <label for="isTop" class=" col-form-label">置顶</label>
                <div class="custom-control custom-radio custom-control-inline ml-5 mt-2">
                    <input type="radio" id="isTop" name="isTop" class="custom-control-input">
                    <label class="custom-control-label" for="isTop">是</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline mt-2">
                    <input type="radio" id="customRadioInline2" name="isTop" class="custom-control-input">
                    <label class="custom-control-label" for="customRadioInline2">否</label>
                </div>
            </div>
        </div>
        <div class="form-group text-right ">
            <button type="reset" class="btn btn-light">取消</button>
            <button class="btn btn-info">存草稿</button>
            <button type="submit" class="btn btn-primary">发布</button>
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

</script>
</@footer>