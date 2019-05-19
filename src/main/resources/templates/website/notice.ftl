<#include "/include/macros.ftl"/>
<@header>
    <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="/static/css/article_list.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>公告管理</h4>
    <hr>
    <form action="/">
        <div class="form-group">
            <div id="toolbar" class="btn-group">
                <button id="add_btn" type="button" data-toggle="modal" data-target="#notice_modal"
                        class="btn btn-light">
                    <i class="fa fa-plane" aria-hidden="true"></i> 新增公告
                </button>
                <button id="batch_delete" type="button" class="btn btn-light">
                    <i class="fa fa-minus" aria-hidden="true"></i> 批量删除
                </button>
            </div>
            <table id="notice_table"></table>
        </div>
    </form>
</div>
<!-- Modal -->
<div class="modal fade" data-backdrop="static" id="notice_modal" tabindex="-1" role="dialog"
     aria-labelledby="notice_modalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="notice_modalLabel">新增公告</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="mx-4 my-1" id="notice_form">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">标题</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id">
                            <input type="text" name="title" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">内容</label>
                        <div class="col-sm-10">
                            <input type="text" name="content" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">状态</label>
                        <div class="col-sm-10">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customRadioInline1" value="true" name="status"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="customRadioInline1">已发布</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customRadioInline2" value="false" name="status"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="customRadioInline2">未发布</label>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" id="save_btn" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>

<@footer>
<script src="/static/js/bootstrap-table.min.js"></script>
<script>
    window.operateEvents = {
        'click .notice-edit ': function (e, value, row, index) {
            e.preventDefault();
            var $noticeModal = $('#notice_modal');
            $noticeModal.find('input[name="id"]').val(row.id);
            $noticeModal.find('input[name="title"]').val(row.title);
            $noticeModal.find('input[name="content"]').val(row.content);
            if (row.status == 'RELEASE') {
                $noticeModal.find('input[name="status"][value="true"]').click();
            } else {
                $noticeModal.find('input[name="status"][value="false"]').click();
            }
            $noticeModal.modal('show');
        },
        'click .notice-delete': function (e, value, row, index) {
            console.log(JSON.stringify(row));
            deleteNotice(row.id);
            e.preventDefault();
        }
    };
    var columns = [{
        field: 'state',
        // halign:'center',
        checkbox: true
    }, {
        field: 'id',
        title: 'ID'
    }, {
        field: 'title',
        title: '标题',
        formatter: notice_formatter
    }, {
        field: 'content',
        title: '内容'
        // formatter: title_for
    }, {
        field: 'status',
        title: '状态',
        formatter: status_formatter
    }, {
        field: 'operate',
        title: '操作',
        align: 'center',
        events: 'operateEvents',
        formatter: addButton
    }];
    $('#notice_table').bootstrapTable({
        url: "/notice/page",                           //请求后台的URL（*）
        method: 'get',                     //请求方式（*）
        toolbar: $('#toolbar'),                   //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        dataField: "list",//这是返回的json数组的key.默认好像是"rows".这里只有前后端约定好就行
        sortable: false,                    //是否启用排序
        sortOrder: "asc",                   //排序方式
        queryParams: queryParams,           //传递参数（*），这里应该返回一个object，即形如{param1:val1,param2:val2}
        queryParamsType: '',
        checkbox: true,
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
        pageList: [5, 10, 20, 30],            //可供选择的每页的行数（*）
        search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch: true,
        // responseHandler: responseHandler    //请求成功处理方法
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        // clickToSelect: true,                //是否启用点击选中行
        //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
        showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                  //是否显示父子表
        columns: columns,
        data: []
    });

    //请求参数
    function queryParams(params) {
        return {
            pageNum: params.pageNumber,
            pageSize: params.pageSize

        }
    }

    function notice_formatter(value, row, index) {
        return row.title;
    }
    function status_formatter(value, row, index) {
        if (row.status == 'RELEASE') {
            return '已发布';
        }else {
            return '未发布';
        }
    }
    function addButton(value, row, index) {
        return [
            '<button  class="btn notice-edit btn-primary btn-sm mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></button>',
            '<button class="btn notice-delete btn-danger btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i></button>'
        ].join('')
    }

    $('#save_btn').click(function () {
        $.post({
            url: '/notice',
            data: $('#notice_form').serialize(),
            dataType: 'json',
            success: function (res) {
                $('#notice_modal').modal('hide');
                alert(res.msg);
                $('button[name="refresh"]').click();
            },
            error: function (res) {
                alert(res.responseJSON.msg);
            }
        });
    });

    function deleteNotice(ids) {
        $.ajax({
            url: '/notice',
            method: 'DELETE',
            data: {ids: ids},
            dataType: 'json',
            traditional: true,
            success: function (res) {
                alert(res.msg);
                $('button[name="refresh"]').click();
            }
        });
    }

    $('#batch_delete').click(function () {
        var rows = $('#notice_table').bootstrapTable('getSelections');
        var ids = [];
        $.each(rows, function (i, value) {
            ids[i] = value.id;
        });
        deleteNotice(ids);
    });
    $('#notice_modal').on('hidden.bs.modal',function (e) {
        $.each($(this).find(':input'),function (i, v) {
            $(v).val('');
        })
    });

</script>
</@footer>