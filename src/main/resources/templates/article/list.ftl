<#include "/include/macros.ftl"/>
<@header>
    <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="/static/css/article_list.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>文章列表</h4>
    <hr>
    <form action="/">
        <div class="form-group">
            <div id="toolbar" class="btn-group">
                <button id="btn_edit" type="button" class="btn btn-light">
                    <i class="fa fa-plane" aria-hidden="true"></i> 批量发布
                </button>
                <button id="btn_delete" type="button" class="btn btn-light">
                    <i class="fa fa-minus" aria-hidden="true"></i> 批量删除
                </button>
            </div>
            <table id="article_table"></table>
        </div>
    </form>
</div>
<@footer>
<script src="/static/js/bootstrap-table.min.js"></script>
<script>
    window.operateEvents = {
        'click .article-edit ': function (e, value, row, index) {
            console.log(JSON.stringify(value));
            e.preventDefault();
        },
        'click .article-delete': function (e, value, row, index) {
            console.log(JSON.stringify(row));
            deleteArticle(row.id);
            e.preventDefault();
        }
    };
    function deleteArticle(ids) {
        $.post({
            url:'/article/delete',
            data:{ids:ids},
            dataType:'json',
            success:function (res) {
                alert(res.msg);
                $('button[name="refresh"]').click();
            }
        });

    }
    var columns = [{
        field: 'state',
        // halign:'center',
        checkbox: true
    }, {
        field: 'title',
        title: '标题'
    }, {
        field: 'description',
        title: '描述'
    }, {
        field: 'comment',
        title: '评论',
        align: 'center',
        formatter: comment_check
    }, {
        field: 'top',
        title: '置顶',
        align: 'center',
        formatter: top_check

    }, {
        field: 'lookCount',
        title: '浏览'
    }, {
        field: 'commentCount',
        title: '评论数'
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
    $('#article_table').bootstrapTable({
        url: "/article/list",                           //请求后台的URL（*）
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
        pageSize: 10,                       //每页的记录行数（*）
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
        // var pageNum = parseInt(params.offset)/parseInt(params.limit)+1;
        return {
            pageNo: params.pageNumber,
            pageSize: params.pageSize

        }
    }

    function addButton(value, row, index) {
        return [
            '<button  class="btn article-edit btn-primary btn-sm mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></button>',
            '<button class="btn article-delete btn-danger btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i></button>'
        ].join('')
    }

    function comment_check(value, row, index) {
        return common_check(value);
    }
    function top_check(value, row, index) {
        return common_check(value);
    }
    function common_check(value) {
        var checkbox = '<input type="checkbox" class="check-switch check-switch-anim" >';
        if (value) {
            $(checkbox).attr('checked');
            return checkbox;
        } else {
            return checkbox;
        }

    }
    $('#btn_delete').click(function (e) {
        e.preventDefault();
        var rows = $('#article_table').bootstrapTable('getSelections');
        var ids =[];
        $.each(rows,function (i, value) {
            ids[i] =value.id;
        });
        console.log(ids);
        deleteArticle(ids);
    })


</script>
</@footer>