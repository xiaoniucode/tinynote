<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>首页</title>
    <@c.styles meta=meta />
</head>
<body>
<div class="tn-site-home" style="width: 65%;margin: 0 auto">
    <@c.nav/>
    <div class="d-flex justify-content-between">
        <div class="flex-grow-1 me-3">
            <#--文章列表-->
            <#if postRes??>
                <#list postRes.records as post>
                    <div>
                        <div style="border-bottom: 1px solid rgba(211,214,220,0.5);">
                            <a href="/post/${post.id}"
                               style="font-weight: 600;font-size: 16px;line-height: 24px;color: #252933;width: 100%">
                                ${post.title}
                            </a>
                            <div style="color: #8a919f;font-size: 13px;line-height: 22px">
                                在数据分析与报表自动化场景中，将 Excel 表格直接转换为图片，已成为提升报告可读性与共享效率
                            </div>
                            <div class="d-flex align-content-center justify-content-between">
                                <div class="d-flex align-content-center ">
                                    <div style="color: #8a919f;font-size: 13px;max-width: 132px;line-height: 22px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;word-break: break-all">
                                        晓牛
                                    </div>
                                    <div style="color: #8a919f;font-size: 13px;line-height: 22px">
                                        2028-12-12 21:32
                                    </div>
                                </div>

                                <div style="font-size:13px;color: #8a919f;background-color: #f2f3f5">
                                    <#list  1..4 as i>
                                        <label class="me-1">大数据</label>
                                    </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>
        <div class="flex-shrink-0" style="width: 200px">
            <#list 1..20 as i>
                <a href="/tag/${i}" class="d-flex align-content-center justify-content-between mb-1">
                    <div class="me-3">大数据</div>
                    <div>32</div>
                </a>
            </#list>
        </div>
    </div>
    <hr/>
    <@c.footer/>
</div>

<@c.scripts/>
<@c.navSearchEvent/>

<script>

</script>
</body>
</html>
