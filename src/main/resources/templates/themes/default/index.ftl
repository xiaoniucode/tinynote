<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>首页</title>
    <@c.styles
    title=meta.site_title
    description=meta.description
    keywords=meta.keywords
    robots=meta.robots/>
    <style>
        /* 布局相关 CSS */
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

        body {
            background-color: #f6f6f3;
        }

        header, main, footer {
            width: 100%;
        }

        header {


        }

        main {
            flex: 1;
            display: flex;
            padding: 0;
            margin: 0;
        }

        .footer {
            padding-left: 15%;
            padding-right: 15%;
        }

        .nav-container, .main-container {
            display: flex;
            width: calc(100% - 30%);
            gap: 0 15px;
            margin: 0 auto; /* 居中对齐 */
        }

        .navigation {
            flex: 1;
            background-color: #fff;
        }

        .main-left {
            padding: 4px 12px 15px;
            flex: 4;
            height: 100%;
            background-color: white;
        }

        .main-right {
            flex: 1;
            background-color: #fff;
            height: 100%;
            padding: 4px 12px;
        }

        @media (max-width: 768px) {
            .nav-container, .main-container {
                flex-direction: column;
                width: 100%;
                margin: 0;
                padding: 0 12px;
                gap: 15px;
            }

            .main-left, .main-right {
                height: auto;
            }

            .navigation {
                flex: auto;
            }

            .footer {
                width: 100%;
                margin: 0;
                padding: 0 12px;
            }
        }

        .text-muted {
            color: gray;
        }

        .page-active {
            color: #00bb00;
        }
    </style>
</head>
<body>
<header>
    <div class="nav-container">
        <div class="navigation">
            <@c.nav meta=meta/>
        </div>
    </div>
</header>

<main>
    <div class="main-container">
        <div class="main-left">
            <#if postRes??&& postRes.records??>
                <#list postRes.records as post>
                    <div>
                        <div style="border-bottom: 1px solid rgba(211,214,220,0.8);width: 100%">
                            <a class="no-underline" href="/post/${post.id!}"
                               style="font-weight: 600;font-size: 20px;line-height: 28px;color: #252933;width: 100%">
                                ${post.title!}
                            </a>
                            <#if post.summary??>
                                <div style="color: #8a919f;font-size: 16px;line-height: 22px">
                                    ${(post.summary)!}
                                </div>
                            </#if>

                            <div style="width: 100%" class="d-flex flex-row align-items-center justify-content-between">
                                <div class="d-flex align-items-center">
                                <#--    <div class="me-2"
                                         style="color: #8a919f;font-size: 15px;max-width: 132px;line-height: 25px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;word-break: break-all">
                                        ${(meta.author)!}
                                    </div>-->
                                    <div style="color: #8a919f;font-size: 15px;line-height: 25px;float: right">
                                        ${post.publishAt!}
                                    </div>
                                </div>

                                <div style="font-size:15px;">
                                    <#list  post.tags as tag>
                                        <a style="background-color: #eeeeee;border-radius: 4px;color: black"
                                           href="/find-by-tag?tagId=${(tag.id)!}" class="me-2 no-underline">${(tag.name)!}</a>
                                    </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </#if>
            <#if postRes??>
                <div class="d-flex justify-content-center mt-2 mb-2">
                    <div class="d-flex align-items-center">
                        <#if postRes.current gt 1>
                            <a href="/?current=${postRes.current - 1}" class="me-3 no-underline page-active">上一页</a>
                        <#else>
                            <span class="me-3 text-muted">上一页</span>
                        </#if>

                        <#if postRes.current lt postRes.pages>
                            <a href="/?current=${postRes.current + 1}" class="no-underline page-active">下一页</a>
                        <#else>
                            <span class="text-muted">下一页</span>
                        </#if>
                    </div>
                </div>
            </#if>
        </div>
        <div class="main-right">
            <div class="d-flex flex-column">
                <#list tagRes as t>
                    <a class="mb-2 no-underline" href="/find-by-tag?tagId=${(t.id)!}" style="color: black">
                        ${(t.name)!} (${(t.count)!})
                    </a>
                </#list>
            </div>
        </div>
    </div>
</main>

<div class="footer">
    <@c.footer/>
</div>
<@c.scripts/>
<@c.navSearchEvent/>
</body>
</html>
