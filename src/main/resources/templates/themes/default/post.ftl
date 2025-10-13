<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <@c.styles title=post.title description=post.summary keywords=post.title robots=meta.robots/>
    <link rel="stylesheet" href="/static/cherry/editor.css">
    <link rel="stylesheet" href="/static/site/cus_cherry_editor.css">
</head>
<body>
<div class="tn-site-home" style="width: 65%;margin: 0 auto">
    <@c.nav meta=meta/>
    <div>
        <div class="d-flex  mb-2 mt-2 justify-content-between ">
            <div style="font-size: 24px;font-weight: bold">${post.title}</div>
            <#if (isLogin!false)>
                <div style="min-width: 80px;text-align: right">
                    <a href="/admin/content/write-post/${(post.id)!}" style="cursor: pointer;color: #1e9fff;">编辑</a>
                </div>
            </#if>
        </div>

        <div class="d-flex mb-2 align-items-center justify-content-between">
            <div>${(post.publishAt)!}</div>
            <div class="d-flex align-items-center">
                <#if post.tags??>
                    <#list post.tags as tag>
                        <label class="${(tag?has_next)?then('me-2','')}">${(tag.name)!}</label>
                    </#list>
                </#if>
            </div>
        </div>
        <div style="border-top: 1px dashed #999; margin: 10px 0;"></div>
        <div class="mb-5" id="editor-preview"></div>
    </div>
    <@c.scripts/>
    <@c.navSearchEvent/>
    <@c.footer/>
</div>

<script src="/static/cherry/editor.js"></script>
<script>
    $(document).ready(function () {
        const content = "${(post.content!'')?js_string}"
        const cherry = new Cherry({
            id: 'editor-preview',
            value: content,
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
            editor: {
                defaultModel: 'previewOnly',
                keepDocumentScrollAfterInit: true,
            },
            nameSpace: "preview",
            themeSettings: {
                themeList: [
                    {className: 'default', label: '默认'},
                    {className: 'dark', label: '暗黑'},
                    {className: 'light', label: '明亮'},
                    {className: 'green', label: '清新'},
                    {className: 'red', label: '热情'},
                    {className: 'violet', label: '淡雅'},
                    {className: 'blue', label: '清幽'},
                ],
                mainTheme: "light",
                codeBlockTheme: "tomorrow-night"
            },
        });
    })
</script>
</body>
</html>
