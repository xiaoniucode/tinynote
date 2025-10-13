<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>文章管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <@c.styles/>
</head>
<body>
<@c.navigation user={}/>
<div class="tn-container mt-3">
    <div class="d-flex justify-content-center">
        <div style="min-width: 1100px">
            <div class="d-flex flex-column mb-2">
                <div class="mb-3 d-flex align-items-center">
                    <h2 class="me-2">管理文章</h2>
                    <button class="layui-btn layui-btn-xs" onclick="window.location.href='/admin/content/write-post'">
                        <i class="layui-icon layui-icon-add-1"></i>
                        创作
                    </button>
                </div>
                <div id="tabs" class="layui-tabs layui-tabs-card" lay-options="{index: 0}">
                    <ul class="layui-tabs-header">
                        <li lay-id="all" class="layui-this">全部</li>
                        <li lay-id="public">公开</li>
                        <li lay-id="privacy">私密</li>
                        <li lay-id="draft">草稿</li>
                    </ul>
                </div>
                <div style="padding: 16px;">
                    <table class="layui-hide" id="test" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" id="dropdownButton">
            操作选项
            <i class="layui-icon layui-icon-down layui-font-12"></i>
        </button>
    </div>
</script>
<script type="text/html" id="post_table_tool">
    <div class="layui-clear-space">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" lay-event="view">浏览</a>
    </div>
</script>
<@c.scripts/>
<@c.footer/>
<script>
    layui.use(['table', 'dropdown'], function () {
        const table = layui.table;
        var dropdown = layui.dropdown;

        // 创建渲染实例
        table.render({
            elem: '#test',
            text: "空空如也",
            skin: "line",
            url: '/admin/content/search',
            toolbar: '#toolbarDemo',
            cellMinWidth: 80,
            page: true,
            limits: [10, 20, 30, 50, 100],
            limit: 20,
            cols: [[
                {type: 'checkbox', fixed: 'left'},
                {field: 'id', fixed: 'left', width: 80, title: 'ID', sort: true},
                {field: 'title', title: '标题'},
                {
                    field: 'status', width: 80, title: '状态', sort: true, templet: function (d) {
                        if (d.status === 1) {
                            return ' <span class="layui-badge layui-bg-green">公开</span>';
                        } else if (d.status === 2) {
                            return '<span class="layui-badge">私密</span>';
                        }

                    }
                },
                {field: 'createdAt', sort: true, title: '发布时间', width: 200},
                {fixed: 'right', title: '操作', width: 134, minWidth: 125, templet: '#post_table_tool'}
            ]],
            done: function () {
                var id = this.id;
                // 下拉按钮测试
                dropdown.render({
                    elem: '#dropdownButton',
                    data: [{
                        id: 'mark_public',
                        title: '标记为公开'
                    }, {
                        id: 'mark_privacy',
                        title: '标记为私密'
                    }, {
                        id: 'batch_delete',
                        title: '批量删除'
                    }],
                    // 菜单被点击的事件
                    click: function (obj) {
                        var checkStatus = table.checkStatus(id)
                        var data = checkStatus.data;
                        var ids = checkStatus.data.map(function (item) {
                            return item.id;
                        });
                        const selectTip = "请至少选择一条记录"
                        switch (obj.id) {

                            case 'mark_public':
                                if (data.length === 0) return layer.msg(selectTip);
                                batchMarkStatus(ids, 1)
                                break;
                            case 'mark_privacy':
                                if (data.length === 0) return layer.msg(selectTip);
                                batchMarkStatus(ids, 2)
                                break;
                            case 'batch_delete':
                                if (data.length === 0) {
                                    return layer.msg(selectTip);
                                }
                                layer.confirm('您确认要删除选中的文章吗？', function (index) {
                                    $.ajax({
                                        url: '/admin/content/batch-delete-post',
                                        type: 'delete',
                                        contentType: 'application/json',
                                        data: JSON.stringify(ids),
                                        success: function () {
                                            table.reloadData('test', {
                                                where: {
                                                    status: undefined,
                                                },
                                                scrollPos: 'fixed',
                                                page: {curr: 1, limit: 20}
                                            });
                                        }
                                    });
                                    layer.close(index);
                                })
                                break;
                        }
                    }
                });
            },
            error: function (res, msg) {
                console.log(res, msg)
            }
        });

        //批量标记内容的状态
        function batchMarkStatus(ids, status) {
            $.ajax({
                url: '/admin/content/mark-post-status',
                type: 'put',
                contentType: 'application/json',
                data: JSON.stringify({ids: ids, status: status}),
                success: function () {
                    table.reloadData('test', {
                        where: {
                            status: undefined,
                        },
                        scrollPos: 'fixed',
                        page: {curr: 1, limit: 20}
                    });

                }
            });
        }

        //Tab 选项卡
        const tabs = layui.tabs;
        // tabs 切换后的事件
        tabs.on('afterChange(tabs)', function (data) {
            const operation = $(this).attr('lay-id');
            switch (operation) {
                case 'all':
                    table.reloadData('test', {
                        where: {
                            status: undefined,
                        },
                        scrollPos: 'fixed',
                        page: {curr: 1, limit: 20}
                    });
                    break;
                case 'public':
                    table.reloadData('test', {
                        where: {
                            status: 1,
                        },
                        scrollPos: 'fixed',
                        page: {curr: 1, limit: 20}
                    });
                    break;
                case 'privacy':
                    table.reloadData('test', {
                        where: {
                            status: 2,
                        },
                        scrollPos: 'fixed',
                        page: {curr: 1, limit: 20}
                    });
                    break;
                case 'draft':
                    table.reloadData('test', {
                        where: {
                            draft: 1,
                        },
                        scrollPos: 'fixed',
                        page: {curr: 1, limit: 20}
                    });
                    break;
            }
        });

        // 触发单元格工具事件
        table.on('tool(test)', function (obj) {
            const data = obj.data;
            if (obj.event === 'edit') {
                window.location.href = "/admin/content/write-post/" + data.id
            } else if (obj.event === 'view') {
                window.location.href = "/post/" + data.id
            }
        });
    });
</script>
</body>
