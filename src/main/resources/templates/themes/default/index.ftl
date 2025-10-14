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
</head>
<body>
<div class="container">
    <@c.nav meta=meta/>
</div>
<div class="container" style="flex: 1 0 auto">
    <div class="row" style="background-color: white">


    <div class="d-flex justify-content-between">
        <div class="me-3"  style="background-color: white">
            <div class="p-1">
                <#if postRes??>
                    <#list postRes.records as post>
                        <div>
                            <div style="border-bottom: 1px solid rgba(211,214,220,0.5);">
                                <a href="/post/${post.id}"
                                   style="font-weight: 600;font-size: 16px;line-height: 24px;color: #252933;width: 100%">
                                    ${post.title}
                                </a>
                                <div style="color: #8a919f;font-size: 13px;line-height: 22px">
                                 <#--   ${(post.summary)!}-->
                                </div>
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center ">
                                        <div style="color: #8a919f;font-size: 13px;max-width: 132px;line-height: 22px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;word-break: break-all">
                                            ${(meta.author)}
                                        </div>
                                        <div style="color: #8a919f;font-size: 13px;line-height: 22px">
                                            2028-12-12 21:32
                                        </div>
                                    </div>

                                    <div style="font-size:13px;color: #8a919f;background-color: #f2f3f5">
                                        <#list  post.tags as tag>
                                            <a href="/?tag=${(tag.name)!}" class="me-1">${(tag.name)!}</a>
                                        </#list>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
        </div>
        <div class="col-3">
            <div class="d-flex flex-column">
                <#list tagRes as t>
                    <a href="/?tag=${(t.name)!}">
                        ${(t.name)!} (${(t.count)!})
                    </a>
                </#list>
            </div>
        </div>
    </div>
    </div>

</div>
<div class="container" style="flex-shrink: 0;">
    <@c.footer/>
</div>

<@c.scripts/>
<@c.navSearchEvent/>
<script>

</script>
</body>
</html>
