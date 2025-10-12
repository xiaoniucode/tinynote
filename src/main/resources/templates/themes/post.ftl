<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>${post.title}</title>
    <@c.styles meta=meta/>
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/cherry/editor.css">
    <style>
        .cherry-previewer {
            padding: 0 !important;
            border-left: 0 !important;
            width: 50%;
            box-sizing: border-box;
            background-color: #fff;
            min-height: auto;
            overflow-y: auto;
            -webkit-print-color-adjust: exact;
            print-color-adjust: exact;
        }
        .cherry {
            font-family: "Helvetica Neue", Arial, "Hiragino Sans GB", "STHeiti", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
            font-size: 16px;
            line-height: 1.625;
            color: #343a40;
            background: #fff;
            box-shadow: none;
        }
    </style>
</head>
<body>
<div class="tn-site-home" style="width: 65%;margin: 0 auto">
    <@c.nav meta=meta/>
    <div>
        <h2>${post.title}</h2>
        <div style="border-top: 1px dashed #999; margin: 10px 0;"></div>
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
