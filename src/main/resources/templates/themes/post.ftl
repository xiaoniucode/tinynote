<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>${post.title}</title>
    <@c.styles meta=meta/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/cherry/editor.css" media="print" onload="this.media='all'">
</head>
<body>
<div class="tn-site-home" style="width: 65%;margin: 0 auto">
    <@c.nav/>
    <div>
        ${post.id}
        <div>${post.title}</div>
        <div id="markdown-container"></div>
    </div>


    <@c.scripts/>
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
            }
        });
    })

</script>
</body>
</html>
