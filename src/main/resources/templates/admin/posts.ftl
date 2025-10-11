<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>文章管理</title>
    <@c.styles/>
</head>
<body>
<@c.navigation user={}/>
<div class="tn-container">

    <div class="d-flex justify-content-center">
        <div style="min-width: 1000px">
            <div class="d-flex flex-column mb-2">
                <div>
                    <label>管理文章</label>
                    <a href="/admin/write-post">
                        新增
                    </a>
                </div>
                <div class="d-flex justify-content-between">
                    <div class="d-flex align-items-center">
                        <a href="/admin/post/search">全部</a>
                        <a href="/admin/post/search?status=1">公开</a>
                        <a href="/admin/post/search?status=2">私密</a>

                    </div>
                    <div>
                        <a href="/admin/post/search?draft=1">草稿</a>
                    </div>
                </div>

                <div class="d-flex justify-content-between">
                    <div class="d-flex align-items-center">
                        <span>操作:</span>
                        <select id="operation">
                            <option value="" disabled selected>操作选项</option>
                            <option value="removeBatch">批量删除</option>
                            <option value="setPrivate">标记为私密</option>
                            <option value="setPublic">标记为公开</option>
                        </select>
                    </div>
                    <div>
                        <input id="searchKey" placeholder="搜索">
                    </div>
                </div>

                <div style="background-color: white;min-height: 200px">

                    <table class="ui-table ui-widget ui-widget-content">
                        <thead>
                        <tr>
                            <th class="checkbox"><input type="checkbox" id="selectAll"></th>
                            <th>文章标题</th>
                            <th>日期</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if posts??>
                            <#list posts.records as post>
                                <tr data-id="${post.id}">
                                    <td class="checkbox"><input type="checkbox" class="itemCheckbox"></td>

                                    <td class="title">
                                        <a href="/admin/write-post/${post.id}">${post.title}</a>
                                        <a href="/post/${post.id}">浏览</a>
                                    </td>
                                    <td>${post.createdAt}</td>
                                    <td>${post.status}</td>
                                </tr>
                            </#list>
                        </#if>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-end">
                    <div>
                        <span class="me-3">第 ${(posts.current)!} 页 / 共 ${(posts.pages)!} 页</span>
                    </div>
                    <div class="d-flex align-items-center">
                        <#if posts.current gt 1>
                            <a href="/admin/post/search/?current=${posts.current - 1}&size=${posts.size}"
                               class="me-3">上一页</a>
                        <#else>
                            <span class="me-3 text-muted" style="cursor: not-allowed;">上一页</span>
                        </#if>
                        <#-- 下一页：如果当前页小于总页数才有下一页 -->
                        <#if posts.current lt posts.pages>
                            <a href="/admin/post/search/?current=${posts.current + 1}&size=${posts.size}">下一页</a>
                        <#else>
                            <span class="text-muted" style="cursor: not-allowed;">下一页</span>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<@c.scripts/>
<@c.footer/>
<script>
    $(document).ready(function() {   // 获取全选复选框和所有条目复选框
        const $selectAll = $('#selectAll');
        const $itemCheckboxes = $('.itemCheckbox');

        // 1.点击全选复选框
        $selectAll.on('change', function() {
            $itemCheckboxes.prop('checked', this.checked);
        });

        // 2. 当点击任意一个条目复选框时
        $itemCheckboxes.on('change', function() {
            // 检查是否所有的条目复选框都被选中了
            const allChecked = $itemCheckboxes.length === $itemCheckboxes.filter(':checked').length;
            // 根据检查结果，更新全选复选框的状态
            $selectAll.prop('checked', allChecked);
        });
        // 获取选中ID
        function getSelectedArticleIds() {
            return $('.itemCheckbox:checked').map(function() {
                return $(this).closest('tr').data('id');
            }).get().filter(id => id);

        }
        //功能操作
        $('#operation').change(function() {
            $('#operation').val('');//重置操作选项
            const selectedValue = $(this).val();
            const selectedIds = getSelectedArticleIds();
            if (selectedIds.length === 0) {
                alert('请先选择要操作的文章！');
                return;
            }
            let url;
            if (selectedValue === 'removeBatch') {
                url = '/admin/post/batch-delete';
            } else if (selectedValue === 'setPrivate') {
                url = '/admin/post/set-private';
            } else if (selectedValue === 'setPublic') {
                url = '/admin/post/set-public';
            }

            $.ajax({
                url: url,
                type: 'POST',
                data: { ids: selectedIds },
                success: function(response) {
                    alert('操作成功！');
                    // 刷新页面或更新表格
                    location.reload();
                },
                error: function() {
                    alert('操作失败，请重试！');
                }
            });
        });



    })
</script>

</body>
