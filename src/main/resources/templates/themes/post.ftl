<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>${post.title}</title>
    <@c.styles meta=meta/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/cherry/editor.css"
</head>
<body>
<div class="tn-site-home" style="width: 65%;margin: 0 auto">
    <@c.nav meta=meta/>
    <div>
        <div>${post.title}</div>
        <div id="markdown-container"></div>
    </div>
    <@c.scripts/>
    <@c.navSearchEvent/>
    <@c.footer/>
</div>
<script src="${springMacroRequestContext.contextPath}/cherry/editor.js"></script>
<script>
    $(document).ready(function () {
        const content = "${(post.content!'')?js_string}"
        const editor = new Cherry({
            id: 'markdown-container',
            value: content,
            editor: {
                defaultModel: 'previewOnly',
            },
        });
    })
</script>
</body>
</html>
