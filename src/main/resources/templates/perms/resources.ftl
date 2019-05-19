<#include "/include/macros.ftl"/>
<@header>
    <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="/static/css/article_list.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>资源管理</h4>
    <hr>
    <form action="/">
        <div class="form-group">
            <div id="toolbar" class="btn-group">
                <button id="add_btn" type="button" data-toggle="modal" data-target="#resources_modal"
                        class="btn btn-light">
                    <i class="fa fa-plane" aria-hidden="true"></i> 新增资源
                </button>
                <button id="batch_delete" type="button" class="btn btn-light">
                    <i class="fa fa-minus" aria-hidden="true"></i> 批量删除
                </button>
            </div>
            <table id="resources_table"></table>
        </div>
    </form>
</div>
<!-- Modal -->
<div class="modal fade bd-example-modal-lg" data-backdrop="static" id="resources_modal" tabindex="-1" role="dialog"
     aria-labelledby="resources_modalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resources_modalLabel">新增资源</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="mx-4 my-1" id="resources_form">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">资源名称</label>
                        <div class="flex-fill">
                            <input type="hidden" name="id">
                            <input type="text" name="name" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">资源类型</label>
                        <div class="flex-fill">
                            <input type="text" name="type" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">资源地址</label>
                        <div class="flex-fill">
                            <input type="text" name="url" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">资源权限</label>
                        <div class="flex-fill">
                            <input type="text" name="permission" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">父级资源</label>
                        <div class="flex-fill">
                            <select id="pid_select" name="pid" class="custom-select">
                                <option value="0">空</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">图标</label>
                        <div class="flex-fill">
                            <input type="text" name="icon" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">排序</label>
                        <div class="flex-fill">
                            <input type="text" name="sort" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">别名</label>
                        <div class="flex-fill">
                            <input type="text" name="alias" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">状态</label>
                        <div class="flex-fill mt-2">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customRadioInline1" value="1" name="available"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="customRadioInline1">可用</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customRadioInline2" value="0" name="available"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="customRadioInline2">不可用</label>
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
        'click .resources-edit ': function (e, value, row, index) {
            e.preventDefault();
            var $resourcesModal = $('#resources_modal');
            $('#resources_modalLabel').text('编辑资源');
            $resourcesModal.find('input[name="id"]').val(row.id);
            $resourcesModal.find('input[name="name"]').val(row.name);
            $resourcesModal.find('input[name="type"]').val(row.type);
            $resourcesModal.find('input[name="url"]').val(row.url);
            $resourcesModal.find('input[name="permission"]').val(row.permission);
            $resourcesModal.find('input[name="pid"]').val(row.pid);
            $resourcesModal.find('input[name="icon"]').val(row.icon);
            $resourcesModal.find('input[name="sort"]').val(row.sort);
            $resourcesModal.find('input[name="alias"]').val(row.alias);
            $resourcesModal.find('input[name="description"]').val(row.description);
            if (row.available) {
                $resourcesModal.find('input[name="available"][value="true"]').click();
            } else {
                $resourcesModal.find('input[name="available"][value="false"]').click();
            }
            $resourcesModal.modal('show');
        },
        'click .resources-delete': function (e, value, row, index) {
            console.log(JSON.stringify(row));
            deleteLink(row.id);
            e.preventDefault();
        }
    };
    var columns = [{
        field: 'state',
        // halign:'center',
        checkbox: true
    }, {
        field: 'name',
        title: '资源名称',
        // formatter: title_for
    }, {
        field: 'url',
        title: '资源地址',
    }, {
        field: 'type',
        title: '资源类型',
        formatter: type_formatter
    }, {
        field: 'permission',
        title: '资源权限'
    }, {
        field: 'available',
        title: '状态',
        formatter: status_formatter
    }, {
        field: 'icon',
        title: '图标'
    }, {
        field: 'pid',
        title: '父级资源',
        formatter: parent_formatter
    }, {
        field: 'sort',
        title: '排序'
    }, {
        field: 'operate',
        title: '操作',
        align: 'center',
        events: 'operateEvents',
        formatter: addButton
    }];
    $('#resources_table').bootstrapTable({
        url: "/resources/page",                           //请求后台的URL（*）
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

    function type_formatter(value, row, index) {
        if (row.type == 'menu') {
            return '菜单';
        }else if (row.type == 'button') {
            return '按钮';
        }else {
            return '其他';
        }
    }

    function parent_formatter(value, row, index) {
        if (row.parent == null) {
            return '-';
        } else {
            return row.parent.name;
        }
    }

    function status_formatter(value, row, index) {
        if (row.available) {
            return '可用';
        } else {
            return '不可用';
        }
    }

    function addButton(value, row, index) {
        return [
            '<button  class="btn resources-edit btn-primary btn-sm mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></button>',
            '<button class="btn resources-delete btn-danger btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i></button>'
        ].join('')
    }

    $('#save_btn').click(function () {
        $.post({
            url: '/resources',
            data: $('#resources_form').serialize(),
            dataType: 'json',
            success: function (res) {
                $('#resources_modal').modal('hide');
                alert(res.msg);
                $('button[name="refresh"]').click();
            },
            error: function (res) {
                alert(res.responseJSON.msg);
            }
        });
    });

    function deleteLink(ids) {
        $.ajax({
            url: '/resources',
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
        var rows = $('#resources_table').bootstrapTable('getSelections');
        var ids = [];
        $.each(rows, function (i, value) {
            ids[i] = value.id;
        });
        deleteLink(ids);
    });
    $('#resources_modal').on('hidden.bs.modal', function (e) {
        $.each($(this).find('input[type="text"]'), function (i, v) {
            $(v).val('');
        });
        $(this).find('input[type="hidden"]').val('');
        $('#resources_modalLabel').text('新增资源');
    });
    $.get({
        url: '/resources/parent',
        success: function (res) {
            var data = res.data;
            // var typeId = $('#type_hide').val();
            $.each(data, function (i, value) {
                $('#pid_select').append('<option value="' + value.id + '">' + value.name + '</option>');
            })

        }
    });


</script>
</@footer>