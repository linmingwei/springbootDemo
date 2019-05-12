<#include "/include/macros.ftl"/>
<@header>
    <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="/static/css/article_list.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>分类列表</h4>
    <hr>
    <form action="/">
        <div class="form-group">
            <div id="toolbar" class="btn-group">
                <button id="add_btn" type="button" data-toggle="modal" data-target="#type_modal"
                        class="btn btn-light">
                    <i class="fa fa-plane" aria-hidden="true"></i> 新增分类
                </button>
                <button id="batch_delete" type="button" class="btn btn-light">
                    <i class="fa fa-minus" aria-hidden="true"></i> 批量删除
                </button>
            </div>
            <table id="type_table"></table>
        </div>
    </form>
</div>
<!-- Modal -->
<div class="modal fade" data-backdrop="static" id="type_modal" tabindex="-1" role="dialog"
     aria-labelledby="type_modalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="type_modalLabel">新增分类</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="mx-4 my-1" id="type_form">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">名称</label>
                        <div class="col-sm-10">
                            <input type="hidden" name="id">
                            <input type="text" name="name" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="父级" class="col-sm-2 col-form-label">父级</label>
                        <div class="col-sm-10">
                            <select id="pid_select" name="pid" class="custom-select">
                                <option value="0">一级分类</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">描述</label>
                        <div class="col-sm-10">
                            <input type="text" name="description" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">排序</label>
                        <div class="col-sm-10">
                            <input type="text" name="order" class="form-control" placeholder="">
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
        'click .type-edit ': function (e, value, row, index) {
            e.preventDefault();
            var $typeModal = $('#type_modal');
            $typeModal.find('input[name="id"]').val(row.id);
            $typeModal.find('input[name="name"]').val(row.name);
             // $typeModal.find('input[name="pid"]')
            $typeModal.find('input[name="description"]').val(row.description);
            $typeModal.find('input[name="order"]').val(row.order);
            $typeModal.modal('show');
        },
        'click .type-delete': function (e, value, row, index) {
            console.log(JSON.stringify(row));
            deleteType(row.id);
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
        // formatter: title_for
    }, {
        field: 'name',
        title: '名称',
        // formatter: title_for
    }, {
        field: 'description',
        title: '描述'
    }, {
        field: 'pid',
        title: '父级分类',
        formatter: showParentName
    }, {
        field: 'order',
        title: '排序'
    }, {
        field: 'createTime',
        title: '创建时间'
    }, {
        field: 'operate',
        title: '操作',
        align: 'center',
        events: 'operateEvents',
        formatter: addButton
    }];
    $('#type_table').bootstrapTable({
        url: "/type/all",                           //请求后台的URL（*）
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

    function addButton(value, row, index) {
        return [
            '<button  class="btn type-edit btn-primary btn-sm mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></button>',
            '<button class="btn type-delete btn-danger btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i></button>'
        ].join('')
    }

    function showParentName(value, row, index) {
        console.log(JSON.stringify(row.parent));
        if (row.parent != null) {
            return row.parent.name;
        } else {
            return '空';
        }
    }

    $.get({
        url: '/type/parent',
        success: function (res) {
            var data = res.data;
            // var typeId = $('#type_hide').val();
            $.each(data, function (i, value) {
                $('#pid_select').append('<option value="' + value.id + '">' + value.name + '</option>');
            })

        }
    });
    $('#save_btn').click(function () {
        $.post({
            url:'/type/add',
            data:$('#type_form').serialize(),
            dataType:'json',
            success:function (res) {
                $('#type_modal').modal('hide');
                alert(res.msg);
                $('button[name="refresh"]').click();
            },
            error:function (res) {
                alert(res.responseJSON.msg);
            }
        });
    });
    function deleteType(ids) {
        $.post({
            url:'/type/delete',
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
        var rows = $('#type_table').bootstrapTable('getSelections');
        var ids =[];
        $.each(rows,function (i, value) {
            ids[i] =value.id;
        });
        deleteType(ids);
    });


</script>
</@footer>