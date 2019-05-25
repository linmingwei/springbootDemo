<#include "/include/macros.ftl"/>
<@header>
    <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="/static/css/article_list.css">
    <link rel="stylesheet" href="/static/css/metroStyle.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>用户管理</h4>
    <hr>
    <form action="/">
        <div class="form-group">
            <div id="toolbar" class="btn-group">
                <button id="add_btn" type="button" data-toggle="modal" data-target="#userModal"
                        class="btn btn-light">
                    <i class="fa fa-plane" aria-hidden="true"></i> 新增用户
                </button>
                <button id="batch_delete" type="button" class="btn btn-light">
                    <i class="fa fa-minus" aria-hidden="true"></i> 批量删除
                </button>
            </div>
            <table id="userTable"></table>
        </div>
    </form>
</div>
<!-- Modal -->
<div class="modal fade" data-backdrop="static" id="userModal" tabindex="-1" role="dialog"
     aria-labelledby="userModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userModalLabel">新增用户</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="mx-4 my-1" id="user_form">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">用户名</label>
                        <div class="flex-fill">
                            <input type="hidden" name="id">
                            <input type="text" name="username" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">昵称</label>
                        <div class="flex-fill">
                            <input type="text" name="nickname" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">昵称</label>
                        <div class="flex-fill">
                            <select class="custom-select" name="userType">
                                <option value="ROOT">超级管理员</option>
                                <option value="ADMIN">管理员</option>
                                <option value="USER" selected>普通用户</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">密码</label>
                        <div class="flex-fill">
                            <input type="password" name="password" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">手机号码</label>
                        <div class="flex-fill">
                            <input type="number" name="mobile" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">邮箱</label>
                        <div class="flex-fill">
                            <input type="email" name="email" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">QQ</label>
                        <div class="flex-fill">
                            <input type="email" name="qq" class="form-control" placeholder="">
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
<div class="modal fade" data-backdrop="static" id="assignModal" tabindex="-1" role="dialog"
     aria-labelledby="assignModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="assignModalLabel">分配用户角色</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="ztree" id="role_tree"></ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<@footer>
<script src="/static/js/bootstrap-table.min.js"></script>
<script src="/static/js/jquery.ztree.core.min.js"></script>
<script src="/static/js/jquery.ztree.excheck.min.js"></script>
<script>
    window.operateEvents = {
        'click .user-edit ': function (e, value, row, index) {
            e.preventDefault();
            $('#userModalLabel').text('编辑用户');
            var $userModal = $('#userModal');
            $userModal.find('input[name="id"]').val(row.id);
            $userModal.find('input[name="username"]').val(row.username);
            $userModal.find('input[name="password"]').val(row.password);
            $userModal.find('input[name="email"]').val(row.email);
            $userModal.find('input[name="qq"]').val(row.qq);
            $userModal.find('input[name="nickname"]').val(row.nickname);
            $userModal.find('input[name="mobile"]').val(row.mobile);
            $userModal.modal('show');
        },
        'click .user-delete': function (e, value, row, index) {
            console.log(JSON.stringify(row));
            deleteUser(row.id);
            e.preventDefault();
        },
        'click .user-assign': function (e, value, row, index) {
            e.preventDefault();
            var $assignModal = $('#assignModal');
            createResourcesTree(row.id);
            $assignModal.modal('show');

        }
    };
    var columns = [{
        field: 'state',
        // halign:'center',
        checkbox: true
    }, {
        field: 'username',
        title: '用户名'
        // formatter: user_formatter
    }, {
        field: 'nickname',
        title: '昵称'
        // formatter: title_for
    }, {
        field: 'mobile',
        title: '手机号码'
    }, {
        field: 'email',
        title: '邮箱'
    }, {
        field: 'qq',
        title: 'QQ'
    }, {
        field: 'createTime',
        title: '创建时间'
    }, {
        field: 'loginCount',
        title: '登录次数'
    }, {
        field: 'operate',
        title: '操作',
        align: 'center',
        events: 'operateEvents',
        formatter: addButton
    }];
    $('#userTable').bootstrapTable({
        url: "/user/page",                           //请求后台的URL（*）
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
        if (row.userType == 'ROOT') {
            return '<button  class="btn user-edit btn-primary btn-sm "><i class="fa fa-pencil" aria-hidden="true"></i></button>';
        } else {
            return [
                '<div class="d-inline-flex">',
                '<button  class="btn user-edit btn-primary btn-sm mr-2"><i class="fa fa-pencil" aria-hidden="true"></i></button>',
                '<button class="btn user-delete btn-danger btn-sm mr-2"><i class="fa fa-trash-o" aria-hidden="true"></i></button>',
                '<button class="btn user-assign btn-info btn-sm"><i class="fa fa-circle" aria-hidden="true"></i></button>',
                '</div>'
            ].join('');
        }
    }

    $('#save_btn').click(function () {
        $.post({
            url: '/user',
            data: $('#user_form').serialize(),
            dataType: 'json',
            success: function (res) {
                $('#userModal').modal('hide');
                alert(res.msg);
                $('button[name="refresh"]').click();
            },
            error: function (res) {
                alert(res.responseJSON.msg);
            }
        });
    });

    function deleteUser(ids) {
        $.ajax({
            url: '/user',
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
        var rows = $('#userTable').bootstrapTable('getSelections');
        var ids = [];
        $.each(rows, function (i, value) {
            ids[i] = value.id;
        });
        deleteUser(ids);
    });
    $('#userModal').on('hidden.bs.modal', function (e) {
        $.each($(this).find('input[type="text"]'), function (i, v) {
            $(v).val('');
        });
        $(this).find('input[type="hidden"]').val('');
        $('#userModalLabel').text('新增用户');
    });

    //    创建角色树
    function createResourcesTree(userId) {
        var setting = {
            check: {
                enable: true,
                chkDisabledInherit: true,
                chkStyle: 'radio'
            },
            view: {
                showIcon: true,
                ShowLine: true,
                dblClickExpand: true,
                expandSpeed: ""
            },
            //异步加载
            async: {
                enable: true,//设置是否异步加载
                url: "/user/tree/" + userId, //设置异步获取节点的 URL 地址
                type: 'get'
                // dataFilter: treeDataFilter
            <#--otherParam: ["roleId", '${updateRole.id}']-->
            },

            //这个data里面的pIdKey,idKey,name等等之类的都是对应后台查出的字段名字，
            //在sql中写好或者在拼接json的时候先拼接好，前太接收的时候只要对应一直就可以了
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: function (event, treeId, treeNode) {
                    console.log(treeNode);
                    $.post({
                        url:'/user/'+userId,
                        data:{roleId:treeNode.id},
                        success:function (res) {
                            console.log(res.msg);
                        },
                        error:function (res) {
                            alert('出现内部错误');
                        }
                    })

                },
                onAsyncSuccess: function (event, treeId, treeNode) {
                    var nodes;
                    if (treeNode == null) {
                        nodes = tree.getNodes();
                    } else {
                        nodes = treeNode.children;
                    }
                    // console.log(nodes);
                    $.each(nodes, function (i, node) {
                        if (node.checked) {
                            tree.checkNode(treeNode, true,);
                        }
                    });
                }
            }
        };
        var tree = $.fn.zTree.init($('#role_tree'), setting, null);
        // tree.expandAll(true);
    }


</script>
</@footer>