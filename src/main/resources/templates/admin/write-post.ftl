<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>撰写文章</title>
    <@c.styles/>
    <link rel="stylesheet" href="/static/cherry/editor.css">
</head>
<body>
<@c.navigation />

<div class="tn-container mt-3 mb-5">
    <h2>
        <#if post??>编辑文章<#else >撰写新文章</#if>
    </h2>
    <div>
        <input id="title" class="layui-input mb-2 mt-3" value="${(post.title)!}" placeholder="请输入文章标题"
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
                                <input type="text" value="${(post.publishAt)!}" class="layui-input" id="publishDate">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">可见范围</label>
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
                    <div class="layui-col-md5">
                        <div class="layui-form-item" style="margin-bottom: 0;">
                            <label class="layui-form-label">文章标签</label>
                            <div class="layui-input-block">
                                <input placeholder="逗号或顿号或空格分隔" class="layui-input" id="tags" name='tags'
                                       autofocus
                                       value="${(post.tags?join(','))!}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4" style="text-align: right">
                <button class="layui-btn layui-btn-primary" id="previewPost">预览文章</button>
                <button class="layui-btn" id="saveDraft">保存草稿</button>
                <button class="layui-btn layui-btn-normal" id="publishPost">发布文章</button>
            </div>
        </div>
        <#-- <div class="layui-collapse mt-2">
             <div class="layui-colla-item">
                 <div class="layui-colla-title">更多配置</div>
                 <div class="layui-colla-content">
                     ...
                 </div>
             </div>
         </div>-->
    </form>
</div>
<@c.footer/>
<@c.scripts/>
<script src="/static/cherry/editor.js"></script>
<script>
    function myFileUpload(file, callback) {
        if (/image/i.test(file.type)) {
            var formData = new FormData();
            formData.append("file", file);
            $.ajax({
                url: '/admin/file/upload',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response) {
                        if (response.code === 0 && response.data) {
                            callback(response.data, {
                                name: file.name.replace(/\.[^.]+$/, ""),
                                width: '60%', // 图片的宽度，默认100%，可配置百分比，也可配置像素值
                            });
                        } else {
                            layer.msg(response.msg);
                        }
                    }
                },
                error: function () {
                    callback("/error.png");
                }
            });
        }
    }

    layui.use(['jquery', 'form'], function () {
        const $ = layui.$;
        const laydate = layui.laydate;
        const layer = layui.layer;
        laydate.render({
            elem: '#publishDate',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm:ss',
            isInitValue: true,
            fullPanel: true
        });
        const content = "${(post.content?js_string)!''}";
        // 初始化编辑器
        var cherry = new Cherry({
            id: 'editor',
            value: content,
            fileUpload: myFileUpload,
            engine: {
                syntax: {
                    toc: {
                        allowMultiToc: true,
                    },
                    header: {
                        anchorStyle: 'none',
                    },
                },
            },
            nameSpace: "editor",
            themeSettings: {
                themeList: [
                    {className: 'default', label: '默认'},
                    {className: 'light', label: '明亮'},
                    {className: 'dark', label: '暗黑'},
                    {className: 'green', label: '清新'},
                    {className: 'red', label: '热情'},
                    {className: 'violet', label: '淡雅'},
                    {className: 'blue', label: '清幽'},
                ],
                mainTheme: "light",
                codeBlockTheme: "tomorrow-night"
            },
        });
        //预览文章
        var view = false
        // 预览文章按钮
        $('#previewPost').on('click', function (e) {
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
        $("#publishPost").on('click', function () {
            if ($("#title").val() === '') {
                layer.msg("标题不能为空");
                return false
            }
            const tags = $('#tags').val()
            const tagList = tags.split(/[,，、\s]+/)
                .map(item => item.trim())
                .filter(item => item.length > 0);
            const body = {
                id: $('#cid').val(),
                title: $("#title").val(),
                content: cherry.getMarkdown(),
                publishAt: $('#publishDate').val(),
                tags: tagList,
                status: $('#status').val(),
                draft: 0
            }
            $.ajax({
                url: '/admin/content/save-post',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(body),
                success: function (res) {
                    if (res.code === 0) {
                        $('#cid').val(res.data)
                        window.location.href = '/admin/content/posts'
                    } else {
                        layer.msg(res.msg)
                    }
                },
            });
            return false;
        });
        //保存草稿
        $('#saveDraft').on('click', function () {
            if ($("#title").val() === '') {
                layer.msg("标题不能为空");
                return false
            }
            const tags = $('#tags').val()
            const tagList = tags.split(/[,，、\s]+/)
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
                    window.location.href = '/admin/content/posts'
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
