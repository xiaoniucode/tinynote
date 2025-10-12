<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>撰写文章</title>
    <@c.styles/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/cherry/editor.css">
</head>
<body>
<@c.navigation />

<div class="tn-container mt-3">
    <h2>撰写新文章</h2>
    <div>
        <input id="title" class="layui-input mb-2 mt-3" value="${(post.title)!}"  placeholder="标题"
               type="text">
        <div id="editor" style="height: 65vh;"></div>
    </div>

    <form class="layui-form mt-2">
        <input id="cid" hidden="hidden" value="${(post.id)!}">
        <div class="layui-row ">
            <div class="layui-col-md8">
                <div class="layui-row">
                    <div class="layui-col-md4">
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">发布日期</label>
                            <div class="layui-input-block">
                                <input type="text" value="${(post.publishAt)!}" class="layui-input" id="publishDate"
                                       placeholder="yyyy-MM-dd HH:mm:ss">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">发布状态</label>
                            <div class="layui-input-block">
                                <select id="status">
                                    <option value="1"
                                            <#if (post.status)?? && post.status == 1>selected="selected"</#if>>公开
                                    </option>
                                    <option value="2"
                                            <#if (post.status)?? && post.status == 2>selected="selected"</#if>>私密
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">文章标签</label>
                            <div class="layui-input-block">
                                <input placeholder="英文逗号分隔" class="layui-input" id="tags" name='tags' autofocus
                                       value="${(post.tags?join(','))!}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4" style="text-align: right">
                <button class="layui-btn layui-btn-primary" id="previewPost" >预览文章</button>
                <button class="layui-btn" id="saveDraft">保存草稿</button>
                <button class="layui-btn layui-btn-normal" id="publishPost">发布文章</button>
            </div>
        </div>

    </form>
</div>

</form>
</div>
<@c.footer/>
<@c.scripts/>
<script src="${springMacroRequestContext.contextPath}/cherry/editor.js"></script>
<script>
    layui.use(['jquery', 'form'],function () {
        const $ = layui.$;
        const laydate = layui.laydate;
        laydate.render({
            elem: '#publishDate',
            type: 'datetime',
            fullPanel: true
        });
        const content = "${(post.content?js_string)!''}";
        // 初始化编辑器
        const cherry = new Cherry({
            id: 'editor',
            value: content,
        });
        //预览文章
        var view = false
        // 预览文章按钮
        $('#previewPost').on('click', function(e){
            e.preventDefault()
            view = !view
            if (view) {
                cherry.switchModel('previewOnly');
                $(this).text('关闭预览')
            } else {
                cherry.switchModel('edit&preview')
                $(this).text('预览文章')
            }
            return false;
        });
        //发布文章
        $("#publishPost").on('click', function(){
            const tags = $('#tags').val()
            const tagList = tags.split(",")
                .map(item => item.trim())
                .filter(item => item.length > 0);
            const body = {
                id: $('#cid').val(),
                title: $("#title").val(),
                content: cherry.getMarkdown(),
                publishAt: $('#publishDate').val(),
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
            return false;
        });

        //保存草稿
        $('#saveDraft').on('click', function(){
            const tags = $('#tags').val()
            const tagList = tags.split(",")
                .map(item => item.trim())
                .filter(item => item.length > 0);
            const body = {
                id: $('#cid').val(),
                title: $("#title").val(),
                content: cherry.getMarkdown(),
                publishAt: $('#publishDate').val(),
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
                    window.location.href = '/admin/posts'
                },
                error: function (xhr, status, error) {
                    console.log(status);
                }
            });
            return false;
        })
    })
</script>
</body>
</html>
