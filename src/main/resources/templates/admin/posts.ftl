<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>文章管理</title>
    <@c.styles/>
</head>
<body>
<@c.navigation user='admin'/>
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
                        <select>
                            <option disabled selected>操作选项</option>
                            <option id="removeBatch">批量删除</option>
                            <option id="removeBatch">标记为私密</option>
                            <option id="removeBatch">标记为公开</option>
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
                                <tr>
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
    $(document).ready(function() {
        // 获取全选复选框和所有条目复选框
        const $selectAll = $('#selectAll');
        const $itemCheckboxes = $('.itemCheckbox');

        // 1. 当点击全选复选框时
        $selectAll.on('change', function() {
            // 设置所有条目复选框的选中状态与全选复选框一致
            $itemCheckboxes.prop('checked', this.checked);
        });

        // 2. 当点击任意一个条目复选框时
        $itemCheckboxes.on('change', function() {
            // 检查是否所有的条目复选框都被选中了
            const allChecked = $itemCheckboxes.length === $itemCheckboxes.filter(':checked').length;
            // 根据检查结果，更新全选复选框的状态
            $selectAll.prop('checked', allChecked);
        });
    })
</script>

</body>
