<#include "/include/macros.ftl"/>
<@header>
    <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
</@header>
<div class="shadow-sm bg-white rounded item px-4 pt-3 pb-2">
    <h4>文章列表</h4>
    <hr>
    <form action="/">
        <div class="form-group">
            <table id="article_list"></table>
        </div>
    </form>
</div>
<@footer>
<script src="/static/js/bootstrap-table.min.js"></script>
<script>
    $('#article_list').bootstrapTable({
        columns: [{
            field: 'id',
            title: 'Item ID'
        }, {
            field: 'name',
            title: 'Item Name'
        }, {
            field: 'price',
            title: 'Item Price'
        }],
        data: [{
            id: 1,
            name: 'Item 1',
            price: '$1'
        }, {
            id: 2,
            name: 'Item 2',
            price: '$2'
        }]
    })
</script>
</@footer>