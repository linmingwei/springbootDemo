<#include "/include/macros.ftl"/>
<@header>
<link rel="stylesheet" href="/static/css/simplemde.min.css"/>
<link rel="stylesheet" href="/webjars/select2/4.0.5/css/select2.min.css">
<style>
    .custom-file-input:lang(en)~.custom-file-label::after {
        content: "浏览";
    }
</style>
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>文章发布</h4>
    <hr>
    <form action="/article/publish" method="post" id="article_form" multiple="multilple">
        <input type="hidden" name="look" value="${(article.look?c)!"0"}">
        <input type="hidden" name="order" value="${(article.order)!"0"}">
        <input type="hidden" name="favorite" value="${(article.favorite)!"0"}">
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
                <div class="input-group">
                    <div class="custom-file">
                        <input type="file" name="image"  class="custom-file-input" id="article_img" image-name="${(article.image)!""}">
                        <label class="custom-file-label" for="article_img">选择文件</label>
                    </div>
                    <div class="input-group-append">
                        <button class="btn btn-outline-success upload-image" type="button">上传</button>
                    </div>
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
        if ($('#article_img').attr('image-name') != undefined) {
            data += '&image='+$('#article_img').attr('image-name');
        }
        console.log(JSON.stringify(data));
        $.post({
            url: '/article/publish',
            data: data,
            success: function (res) {
                alert(res.msg);
                // window.location.href = '/admin/article/write';
            },
            error:function (res) {
                alert(res.msg);
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
    });
    $(function () {
        var image_name = $('#article_img').attr('image-name');
        if (image_name != undefined && image_name != "") {
            // $('#article_img').val(image_name);
            $('#article_img').next('.custom-file-label').addClass("selected").html(image_name);
        }

    });
    $('.custom-file-input').on('change',function(){
        var fileName = $(this).val();
        $(this).next('.custom-file-label').addClass("selected").html(fileName);
        $('.upload-image').removeClass('btn-outline-success').removeClass('btn-outline-danger').addClass('btn-outline-success').text('上传');
    });
    $('.upload-image').click(function (e) {
        e.preventDefault();
        if ($(this).hasClass('btn-outline-success')) {
            var image = $('#article_img')[0].files[0];
            if (image == undefined) {
                alert("图片为空，请至少选择一张图片！");
            }else {
                var formData= new FormData();
                formData.append('image',image);
                $.post({
                    url:'/upload/img',
                    data:formData,
                    contentType: false,
                    processData: false,
                    success:function (res) {
                        alert(res.msg);
                        $('#article_img').attr('image-name',res.data);
                        $('.upload-image').text("删除").removeClass('btn-outline-success').addClass('btn-outline-danger');
                    },
                    error:function () {
                        alert("上传失败，未知错误");
                    }

                })
            }
        }else if ($(this).hasClass('btn-outline-danger')) {
            var formData = new FormData();
            formData.append("imgName", $('#article_img').attr('image-name'));
            $.post({
                url:'/upload/deleteImg',
                data:formData,
                contentType: false,
                processData: false,
                success:function (res) {
                    alert(res.msg);
                    $('#article_img').attr('image-name',"");
                    $('.upload-image').text("上传").removeClass('btn-outline-danger').addClass('btn-outline-success');
                },
                error:function () {
                    alert("删除失败，未知错误");
                }

            })

        }

    });

</script>
</@footer>