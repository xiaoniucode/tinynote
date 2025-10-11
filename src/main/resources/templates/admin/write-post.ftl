<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>撰写文章</title>
    <@c.styles/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/cherry/editor.css">
</head>
<body>
<@c.navigation user='admin'/>

<div class="tn-container">
    <h2>撰写新文章</h2>
    <div>
        <input id="title" style="width: 100%;margin-bottom: 15px" placeholder="标题" type="text">
        <div id="editor" style="height: 65vh;"></div>
    </div>
    <div style="display: flex;justify-content: space-between;margin-top:10px">
        <div>
            <input id="cid" hidden="hidden">
            <label>发布日期:</label>
            <input id="publishDate" type="datetime-local"/>
            <label>标签:</label>
            <input id="tags" name='tags' autofocus>
            <label for="status">状态:</label>
            <select id="status" name="status">
                <option selected value="1">发布</option>
                <option value="2">私密</option>
            </select>
        </div>
        <div>
            <button id="previewPost">预览文章</button>
            <button id="saveDraft">保存草稿</button>
            <button id="publishPost">发布文章</button>
        </div>
    </div>
</div>
<@c.footer/>
<@c.scripts/>
<script src="${springMacroRequestContext.contextPath}/cherry/editor.js"></script>
<script>
    $(document).ready(function () {
        // 初始化编辑器
        const cherry = new Cherry({
            id: 'editor',
            value: '',
        });
        //发布文章
        $("#publishPost").click(function () {
            const tags = $('#tags').val()
            const tagList = tags.split(",")
                .map(item => item.trim())
                .filter(item => item.length > 0);
            const body = {
                id: $('#cid').val(),
                title: $("#title").val(),
                content: cherry.getMarkdown(),
                publishDate: $('#publishDate').val(),
                tags: tagList,
                status: $('#status').val()
            }
            $.ajax({
                url: '/admin/content/save-post',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(body),
                success: function (res) {
                    $('#cid').val(res.data)
                    window.location.href = '/admin/posts'
                },
            });
        });
        //保存草稿
        $('#saveDraft').click(function () {
            const tags = $('#tags').val()
            const tagList = tags.split(",")
                .map(item => item.trim())
                .filter(item => item.length > 0);
            const body = {
                id: $('#cid').val(),
                title: $("#title").val(),
                content: cherry.getMarkdown(),
                publishDate: $('#publishDate').val(),
                tags: tagList,
                status: $('#status').val(),
                draft: 1
            }
            $.ajax({
                url: '/admin/content/save-post',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(body),
                success: function (res) {
                    $('#cid').val(res.data)
                    alert("保存成功");
                },
                error: function (xhr, status, error) {
                    console.log(status);
                }
            });

        })
        //预览文章
        var view = false
        $('#previewPost').click(function () {
            view = !view
            if (view) {
                cherry.switchModel('previewOnly');
                $(this).text('关闭预览')
            } else {
                cherry.switchModel('edit&preview')
                $(this).text('预览文章')
            }
        })
    });
</script>
</body>
</html>
