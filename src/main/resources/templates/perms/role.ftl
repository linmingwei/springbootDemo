<#include "/include/macros.ftl"/>
<@header>
    <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="/static/css/article_list.css">
    <link rel="stylesheet" href="/static/css/metroStyle.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>角色列表</h4>
    <hr>
    <form action="/">
        <div class="form-group">
            <div id="toolbar" class="btn-group">
                <button id="add_btn" type="button" data-toggle="modal" data-target="#roleModal"
                        class="btn btn-light">
                    <i class="fa fa-plane" aria-hidden="true"></i> 新增角色
                </button>
                <button id="batch_delete" type="button" class="btn btn-light">
                    <i class="fa fa-minus" aria-hidden="true"></i> 批量删除
                </button>
            </div>
            <table id="role_table"></table>
        </div>
    </form>
</div>
<!-- Modal -->
<div class="modal fade" data-backdrop="static" id="roleModal" tabindex="-1" role="dialog"
     aria-labelledby="roleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="roleModalLabel">新增角色</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="mx-4 my-1" id="role_form">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">角色名称</label>
                        <div class="flex-fill">
                            <input type="hidden" name="id">
                            <input type="text" name="name" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">角色描述</label>
                        <div class="flex-fill">
                            <input type="text" name="description" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">状态</label>
                        <div class="flex-fill">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customRadioInline1" value="1" name="available"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="customRadioInline1">启用</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customRadioInline2" value="0" name="available"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="customRadioInline2">禁用</label>
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
<div class="modal fade" data-backdrop="static" id="assignModal" tabindex="-1" role="dialog"
     aria-labelledby="assignModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="assignModalLabel">分配角色资源</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="ztree" id="resources_tree"></ul>
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
        'click .role-edit ': function (e, value, row, index) {
            e.preventDefault();
            $('#roleModalLabel').text('编辑角色');
            var $roleModal = $('#roleModal');
            $roleModal.find('input[name="id"]').val(row.id);
            $roleModal.find('input[name="name"]').val(row.name);
            $roleModal.find('input[name="description"]').val(row.description);
            if (row.available) {
                $roleModal.find('input[name="available"][value="1"]').click();
            } else {
                $roleModal.find('input[name="available"][value="0"]').click();
            }
            $roleModal.modal('show');
        },
        'click .role-delete': function (e, value, row, index) {
            console.log(JSON.stringify(row));
            deleteRole(row.id);
            e.preventDefault();
        },
        'click .role-assign': function (e, value, row, index) {
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
        field: 'name',
        title: '角色名称'
        // formatter: title_for
    }, {
        field: 'description',
        title: '角色描述'
    }, {
        field: 'available',
        title: '状态',
        formatter: status_formatter
    }, {
        field: 'operate',
        title: '操作',
        align: 'center',
        events: 'operateEvents',
        formatter: addButton
    }];
    $('#role_table').bootstrapTable({
        url: "/role/page",                           //请求后台的URL（*）
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

    function status_formatter(value, row, index) {
        if (row.available) {
            return '可用';
        } else {
            return '不可用';
        }
    }


    function addButton(value, row, index) {
        if (row.name == 'role:root') {
            return '<button  class="btn role-edit btn-primary btn-sm "><i class="fa fa-pencil" aria-hidden="true"></i></button>';
        } else {
            return [
                '<div class="d-inline-flex">',
                '<button  class="btn role-edit btn-primary btn-sm mr-2"><i class="fa fa-pencil" aria-hidden="true"></i></button>',
                '<button class="btn role-delete btn-danger btn-sm mr-2"><i class="fa fa-trash-o" aria-hidden="true"></i></button>',
                '<button class="btn role-assign btn-info btn-sm"><i class="fa fa-circle" aria-hidden="true"></i></button>',
                '</div>'
            ].join('');
        }
    }

    $('#save_btn').click(function () {
        $.post({
            url: '/role',
            data: $('#role_form').serialize(),
            dataType: 'json',
            success: function (res) {
                $('#roleModal').modal('hide');
                alert(res.msg);
                $('button[name="refresh"]').click();
            },
            error: function (res) {
                alert(res.responseJSON.msg);
            }
        });
    });

    function deleteRole(ids) {
        $.ajax({
            url: '/role',
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
        var rows = $('#role_table').bootstrapTable('getSelections');
        var ids = [];
        $.each(rows, function (i, value) {
            ids[i] = value.id;
        });
        deleteRole(ids);
    });
    $('#roleModal').on('hidden.bs.modal', function (e) {
        $.each($(this).find('input[type="text"]'), function (i, v) {
            $(v).val('');
        });
        $(this).find('input[type="hidden"]').val('');
        $('#roleModalLabel').text('新增角色');
    });

    //    创建资源树
    function createResourcesTree(roleId) {
        var setting = {
            check: {
                enable: true
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
                url: "/resources/tree/" + roleId, //设置异步获取节点的 URL 地址
                type: 'get',
                dataFilter: treeDataFilter
            <#--otherParam: ["roleId", '${updateRole.id}']-->
            },

            //这个data里面的pIdKey,idKey,name等等之类的都是对应后台查出的字段名字，
            //在sql中写好或者在拼接json的时候先拼接好，前太接收的时候只要对应一直就可以了
            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "pid",
                    idKey: "id",
                    // isParent:"parent",
                    checked: 'checked'
                    // children:'children',
                    // url:'url'
                },
                key: {
                    checked: "CHECKED",
                    name: "name"
                }
            },
            callback: {
                onCheck: function (event, treeId, treeNode) {
                    console.log(JSON.stringify(treeNode));
                    if (treeNode.children != null) {
                        var resourcesIds = [];
                        $.each(treeNode.children,function (i, node) {
                            resourcesIds[i] = node.id;
                        });
                        if (treeNode.children[0].CHECKED) {
                            addRoleResource(roleId,resourcesIds,tree,treeNode);
                        }else {
                            deleteRoleResource(roleId,resourcesIds,tree,treeNode);
                        }
                    }else{
                        console.log(treeNode.CHECKED);
                        if (treeNode.CHECKED) {
                            addRoleResource(roleId,treeNode.id,tree,treeNode);
                        } else {
                            deleteRoleResource(roleId,treeNode.id,tree,treeNode);
                        }
                    }
                },
                onAsyncSuccess: function (event, treeId, treeNode, msg) {
                    var nodes;
                    if (treeNode == null) {
                        nodes = tree.getNodes();
                    } else {
                        nodes = treeNode.children;
                    }
                    for (var i = 0; i < nodes.length; i++) {
                        var node = nodes[i];
                        tree.expandNode(node);
                        if (node.checked) {
                            tree.checkNode(node, true);
                        }
                        if (node.children != null) {
                            var children = node.children;
                            for (var j = 0; j < children.length; j++) {
                                var child = children[j];
                                tree.expandNode(child);
                                if (child.checked) {
                                    tree.checkNode(child, true);
                                }
                                if (child.children != null) {
                                    var subChildren = child.children;
                                    for (var k = 0; k < subChildren.length; k++) {
                                        var subChild = subChildren[k];
                                        if (subChild.checked) {
                                            tree.checkNode(subChild, true);
                                        }
                                    }
                                }

                            }
                        }
                    }
                }
            }
        };
        var tree = $.fn.zTree.init($('#resources_tree'), setting, null);
        tree.expandAll(true);
    }

    function addRoleResource(roleId, resourcesIds,tree,treeNode) {
        $.post({
            url: '/resources/' + roleId,
            data: {resourcesIds: resourcesIds},
            traditional: true,
            success: function (res) {
                tree.checkNode(treeNode,true);
                console.log(res.msg);
            }
        });

    }
    function deleteRoleResource(roleId, resourcesIds,tree,treeNode) {
        $.ajax({
            url: '/resources/' + roleId,
            method:'delete',
            data: {resourcesIds: resourcesIds},
            traditional: true,
            success: function (res) {
                tree.checkNode(treeNode,false);
                console.log(res.msg);
            }
        })

    }

    function treeDataFilter(treeId, parentNode, responseData) {
        return responseData.data;
    }

</script>
</@footer>