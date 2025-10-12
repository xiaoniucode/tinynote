<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>${post.title}</title>
    <@c.styles meta=meta/>
    <link rel="stylesheet" href="/static/cherry/editor.css">
    <link rel="stylesheet" href="/static/site/cus_cherry_editor.css">
</head>
<body>
<div class="tn-site-home" style="width: 65%;margin: 0 auto">
    <@c.nav meta=meta/>
    <div>
        <h2>${post.title}</h2>
        <div style="border-top: 1px dashed #999; margin: 10px 0;"></div>
        <div id="editor-preview"></div>
    </div>
    <@c.scripts/>
    <@c.navSearchEvent/>
    <@c.footer/>
</div>
<script src="/static/cherry/editor.js"></script>
<script>
    $(document).ready(function () {
        const content = "${(post.content!'')?js_string}"
        const editor = new Cherry({
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
                }
            },
            editor: {
                defaultModel: 'previewOnly',
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
