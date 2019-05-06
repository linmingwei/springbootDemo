<#include "/include/macros.ftl"/>
<@header>
<link rel="stylesheet" href="/static/css/simplemde.min.css"/>
<link rel="stylesheet" href="/webjars/select2/4.0.5/css/select2.min.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>文章发布</h4>
    <hr>
    <form action="/article/publish" method="post" id="article_form">
        <div class="form-group row">
            <label for="titleInput" class="col-sm-1 col-form-label">标题</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" name="title" value="${(article.title)!}" id="titleInput"
                       placeholder="标题">
                <input type="hidden" name="id" id="aid_hide" value="${(article.id)!}">
            </div>
        </div>
        <div class="form-group">
            <textarea id="article_editor"></textarea>
            <input type="hidden" id="content_hid" value="${(article.content)!}">
        </div>
        <div class="form-group row">
            <label for="typeInput" class="col-sm-1 col-form-label">分类</label>
            <div class="col-sm-5">
                <select class="custom-select" name="typeId" id="type_select">
                </select>
                <input type="hidden" id="type_hide" value="${(article.typeId)!}">
            <#--<input type="text" class="form-control" name="type" id="typeInput" placeholder="分类">-->
            </div>
            <label for="tagInput" class="col-sm-1 col-form-label">标签</label>
            <div class="col-sm-5">
                <select class="custom-select" name="tagIds" id="tag_select" multiple="multiple">
                </select>
            <#--<input type="hidden" id="tags_hide" value="${tags!}">-->

            <#--<input type="text" class="form-control" name="tag" id="tagInput" placeholder="多个标签请用逗号分隔">-->
            </div>
        </div>
        <div class="form-group row">
            <label for="titleInput" class="col-sm-1 col-form-label">描述</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" value="${(article.description)!}" name="description"
                       id="titleInput" placeholder="描述">
            </div>
        </div>
        <div class="form-group row">
            <label for="titleInput" class="col-sm-1 col-form-label">图片</label>
            <div class="col-sm-11">
                <div class="custom-file" style="cursor: pointer;">
                    <input type="file" name="image" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile" ></label>
                </div>
            </div>
        </div>

        <div class="form-group row">
            <label for="comment" class="col-sm-1 col-form-label">评论</label>
            <div class="col-sm-5">
                <input type="checkbox" ${((article.comment)?string('checked',''))!}
                       class="check-switch check-switch-anim mt-2" name="comment" id="comment">
            </div>
            <label for="top" class="col-sm-1 col-form-label">置顶</label>
            <div class="col-sm-5">
                <input type="checkbox" ${((article.top)?string('checked',''))!}
                       class="check-switch check-switch-anim mt-2" name="top" id="top">
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
<script src="/webjars/select2/4.0.5/js/select2.min.js"></script>
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
    var value = $('#content_hid').val();
    simplemde.value(value);
    $('#tag_select').select2({
        ajax: {
            url: '/tag/all',
            type: 'get',
            dataType: 'json',
            processResults: function (res) {
                var data_select = [];
                $.each(res.data, function (i, value) {
                    data_select.push({id: value.id, text: value.name});
                });
                return {
                    results: data_select
                };
            },
            cache: true
        }
    });
    $.get({
                url: '/tag/' + $('#aid_hide').val()
            }
    ).then(function (res) {
        console.log(res);
        var data = res.data;
        // create the option and append to Select2
        $.each(data, function (i, value) {

            var option = new Option(value.name, value.id, true, true);
            $('#tag_select').append(option).trigger('change');
        });

        // manually trigger the `select2:select` event
        $('#tag_select').trigger({
            type: 'select2:select',
            params: {
                data: data
            }
        });

    });
    $('#draft_btn').click(function (e) {
        e.preventDefault();
        publish_article('&status=1');
    });
    $('#publish_btn').click(function (e) {
        e.preventDefault();
        publish_article('&status=0')
    });
    function publish_article(ext){
        var data = $('#article_form').serialize();
        data += '&content=' + simplemde.value()+ext;
        console.log(JSON.stringify(data));
        $.post({
            url: '/article/publish',
            data: data,
            success: function (res) {
                alert("操作成功");
                window.location.href = '/admin/article/write';
            }
        })

    }
    $.get({
        url: '/type/child',
        success: function (res) {
            var data = res.data;
            var typeId = $('#type_hide').val();
            $.each(data, function (i, value) {
                if (value.id == typeId) {
                    $('#type_select').append('<option selected value="' + value.id + '">' + value.name + '</option>');
                } else {
                    $('#type_select').append('<option value="' + value.id + '">' + value.name + '</option>');
                }
            })

        }
    })

</script>
</@footer>