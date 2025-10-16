<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <@c.styles title=post.title description=post.summary keywords=post.title robots=meta.robots/>
    <link rel="stylesheet" href="/static/cherry/editor.css">
    <link rel="stylesheet" href="/static/site/cus_cherry_editor.css">
    <style>
        *, *::before, *::after {
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            background-color: #f6f6f3;
        }

        header, main, footer {
            width: 100%;
        }

        header {
            padding-left: 15%;
            padding-right: 15%;
        }

        main {
            flex: 1;
            padding-left: 15%;
            padding-right: 15%;
            background-color: #f6f6f3;
            display: flex;
            flex-direction: column;
        }

        .content-container {
            background-color: white;
            flex: 1 0 auto;
            padding: 0;
            display: flex;
            flex-direction: column;
        }

        footer {
            flex-shrink: 0;
            padding-left: 15%;
            padding-right: 15%;
        }

        @media (max-width: 768px) {
            header {
                padding-left: 12px;
                padding-right: 12px;
            }

            main {
                padding-left: 12px;
                padding-right: 12px;
            }

            footer {
                padding-left: 12px;
                padding-right: 12px;
            }

            .content-container {
                height: auto;
            }
        }
    </style>
</head>
<body>
<header>
    <@c.nav meta=meta/>
</header>

<main>
    <div class="content-container">
        <div class="d-flex mb-2 mt-2 justify-content-between align-items-center"
             style="padding: 0 15px;">
            <div style="font-size: 24px; font-weight: bold; ">${post.title}</div>
            <#if (isLogin!false)>
                <div style=" text-align: right">
                    <a class="no-underline" href="/admin/content/write-post/${(post.id)!}" style="cursor: pointer; color: #1e9fff;">编辑</a>
                </div>
            </#if>
        </div>

        <div class="d-flex mb-2 align-items-center justify-content-between" style="padding: 0 15px;">
            <div>${(post.publishAt)!}</div>
            <div class="d-flex align-items-center">
                <#if post.tags??>
                    <#list post.tags as tag>
                        <label style="background-color: #eeeeee;border-radius: 4px" class="${(tag?has_next)?then('me-2','')}">${(tag.name)!}</label>
                    </#list>
                </#if>
            </div>
        </div>
        <div style="border-top: 1px dashed #999; margin: 10px 15px;"></div>
        <div id="editor-preview" style="flex: 1; padding: 0 15px;"></div>
    </div>
</main>

<footer>
    <@c.footer/>
</footer>

<@c.scripts/>
<@c.navSearchEvent/>
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
                    codeBlock: {
                        wrap: false,
                        expandCode: false,
                    }
                },
            },
            editor: {
                defaultModel: 'previewOnly',
                keepDocumentScrollAfterInit: true,
            },
            previewer: {
                enablePreviewerBubble: false,
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
