<#include "/include/macros.ftl"/>
<@header>
    <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>评论列表</h4>
    <hr>
    <form action="/">
        <div class="form-group">
            <div id="toolbar" class="btn-group">
                <button id="batch_delete" type="button" class="btn btn-light">
                    <i class="fa fa-minus" aria-hidden="true"></i> 批量删除
                </button>
            </div>
            <table id="comment_table"></table>
        </div>
    </form>
</div>
<!-- Modal -->
<div class="modal" id="reply_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">回复审核</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="reply_form" method="post">
                    <input type="hidden" name="pid">

                    <div class="form-group row">
                    <label class="col-sm-3 col-form-label">评论</label>
                    <div class="flex-fill">
                        <textarea name="content"  rows="6"  class="form-control" placeholder="请输入评论"></textarea>
                    </div>
                </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="reply_btn">回复</button>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="check_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">审核评论</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="check_form" method="post">
                    <input type="hidden" name="pid">
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">状态</label>
                    <div class="flex-fill">
                        <select class="custom-select" name="status">
                            <option selected>请选择</option>
                            <option value="0">审核通过</option>
                            <option value="2">审核失败</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">回复该评论</label>
                    <div class="flex-fill">
                        <textarea name="content"  rows="6"  class="form-control" placeholder="请输入评论"></textarea>
                    </div>
                </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="check_btn">提交审核</button>
            </div>
        </div>
    </div>
</div>



<@footer>
<script src="/static/js/bootstrap-table.min.js"></script>
<script>
    window.operateEvents = {
        'click .comment-reply ': function (e, value, row, index) {
            e.preventDefault();
            $('#reply_form').find('input[name="pid"]').val(row.id);
            $('#reply_modal').modal('show');
        },
        'click .comment-check':function (e, value, row, index) {
            e.preventDefault();
            $('#check_form').find('input[name="pid"]').val(row.id);
            $('#check_modal').modal('show');
        },
        'click .comment-delete': function (e, value, row, index) {
            e.preventDefault();
            var ids = [];
            ids[0] = row.id;
            deleteComment(ids);
        }
    };

    var columns = [{
        field: 'state',
        // halign:'center',
        checkbox: true
    }, {
        field: 'id',
        title: 'ID'
        // formatter: title_for
    }, {
        field: 'username',
        title: '用户名',
        formatter: username_formatter
    }, {
        field: 'content',
        title: '内容',
        formatter: content_formatter
    }, {
        field: 'createTime',
        title: '创建时间'
    }, {
        field: 'favorite',
        title: '赞',
        formatter:favorite_formatter
    }, {
        field: 'status',
        title: '状态',
        formatter:status_formatter
    }, {
        field: 'operate',
        title: '操作',
        align: 'center',
        events: 'operateEvents',
        formatter: addButton
    }];
    $('#comment_table').bootstrapTable({
        url: "/comment/page",                           //请求后台的URL（*）
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
    //丰富username
    function username_formatter(value, row, index) {
        if (row.ipaddr == null) {
            row.ipaddr = '未知';
        }
        if (row.local == null) {
            row.local = '未知';
        }

        return[
            '<span class="text-primary">'+row.username+'</span><br>'+
            '<span style="font-size:13px" class="text-secondary"><i class="fa fa-address-book"></i>&nbsp;'+row.ipaddr+' |&nbsp;'+row.local+'</span>'

        ]
    }
    //丰富content
    function content_formatter(value,row, index) {
        return[
            '<p class="border-bottom mb-2">评论自：<a class="text-primary" href="/'+row.article.typeId+'/'+row.article.id+'">'+row.article.title+'</a></p>' +
            '<span style="font-size: 13px" class="text-secondary">'+row.content+'</span>'

        ]

    }
    //丰富赞
    function favorite_formatter(value,row, index) {
        if (row.favorite == null) {
            row.favorite = 0;
        }
        return row.favorite;
    }
    //丰富状态
    function status_formatter(value, row, index) {
        if (row.status == null) {
            return '<span class="badge badge-danger">未知错误</span>'
        }else if (row.status == 0) {
            return '<span class="badge badge-success">审核通过</span>'
        }else if (row.status == 1) {
            return '<span class="badge badge-info">正在审核</span>'
        }else if (row.status == 2) {
            return '<span class="badge badge-danger">审核未通过</span>'
        }
    }

    //添加操作按钮
    function addButton(value, row, index) {
        return [
            '<div class="d-inline-flex">',
            '<button  class="btn comment-reply btn-primary btn-sm mr-3"><i class="fa fa-pencil" aria-hidden="true"></i>回复</button>',
            '<button  class="btn comment-check btn-info btn-sm mr-3"><i class="fa fa-pencil" aria-hidden="true"></i>审核</button>',
            '<button class="btn comment-delete btn-danger btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i>删除</button>',
            '</div>'
        ].join('');
    }
    //回复评论
    $('#reply_btn').click(function (e) {
        e.preventDefault();
        general_comment('/comment/reply',$('#reply_form'), $('#reply_modal'));
    });
    //审核评论
    $('#check_btn').click(function (e) {
        e.preventDefault();
        if ($('#check_form').find('select').val() == '请选择') {
            alert("请选择审核状态");
            return;
        }

        general_comment('/comment/check',$('#check_form'),$('#check_modal'));
    });

    function general_comment(url, form, modal) {
        $.post({
            url:url,
            data:form.serialize(),
            success:function (res) {
                modal.modal('hide');
                alert(res.msg);
                $('button[name="refresh"]').click();
            },
            error:function () {
                alert("出现未知错误，请重试！");
            }
        });

    }



    function deleteComment(ids) {
        $.post({
            url:'/comment/delete',
            data:{ids:ids},
            dataType:'json',
            traditional: true,
            success:function (res) {
                alert(res.msg);
                $('button[name="refresh"]').click();
            }
        });
    }
    $('#batch_delete').click(function () {
        var rows = $('#comment_table').bootstrapTable('getSelections');
        var ids =[];
        $.each(rows,function (i, value) {
            ids[i] =value.id;
        });
        deleteComment(ids);
    });

</script>
</@footer>