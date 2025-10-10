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
                    <button>新增</button>
                </div>
                <div class="d-flex justify-content-between">
                    <div>
                        可用 待审核 草稿
                    </div>
                    <div>

                    </div>
                </div>

                <div class="d-flex justify-content-between">
                    <div>
                        <span> □ 选中项</span>
                        <select style="margin-left: 10px;">
                            <option disabled selected>操作选项</option>
                            <option>批量删除</option>
                        </select>
                    </div>
                    <div>
                        <input placeholder="搜索">
                    </div>
                </div>

                <div style="background-color: white;min-height: 200px">

                    <table class="ui-table ui-widget ui-widget-content">
                        <thead>
                        <tr>
                            <th class="checkbox"><input type="checkbox"></th>
                            <th>标题</th>
                            <th>日期</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="checkbox"><input type="checkbox"></td>
                            <td class="title">草稿</td>
                            <td>admin</td>
                            <td>保存于昨天22:33</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div>
                    每页显示记录 分页
                </div>
            </div>
        </div>
    </div>
</div>
<@c.scripts/>
<@c.footer/>
</body>
