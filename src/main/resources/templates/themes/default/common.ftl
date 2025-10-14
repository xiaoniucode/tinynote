<#macro nav meta={}>
    <div class="row" style="background-color: white">
        <div class="d-flex justify-content-between align-items-center">
            <div style="font-size: 50px;font-weight: bold">${(meta.site_title)!}</div>
            <div>
                <input id="searchInput" placeholder="输入关键字搜索">
            </div>
        </div>
        <div>${(meta.site_description)!}</div>

        <div class="mt-3">
            <a style="font-size: 21px" href="/">首页</a>
        </div>
        <hr/>
    </div>
</#macro>
<#macro navSearchEvent>
    <script>
        $(document).ready(function () {
            $('#searchInput').on('keypress', function (event) {
                if (event.key === 'Enter') {
                    const query = $(this).val().trim();
                    if (query) {
                        window.location.href = '/?title=' + encodeURIComponent(query);
                    } else {
                        alert('请输入搜索内容');
                    }
                }
            });
        });
    </script>
</#macro>

<#macro footer>
    <div class="row" style="background-color: white">
        <div style="border-top: 1px dashed #999; margin: 10px 0;"></div>
        <footer class="flex-footer">
            <div class="d-flex justify-content-center align-items-centet mb-3">
                <div style="text-align: center">
                    <#if meta.copyright??>
                        <div>${meta.copyright!''}</div>
                    </#if>
                    <#if meta?? && (meta.public_security??|| meta.icp_number??)>
                        <div class="mt-2">
                            <div class="d-flex align-items-center">
                                <img class="me-2" src="/static/site/images/reords.png">
                                <#if meta.public_security??>
                                    <a class="me-3" style="text-decoration: none;color: inherit" target="_blank"
                                       href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=">
                                        ${meta.public_security!''}</a>
                                </#if>
                                <#if meta.icp_number??>
                                    <a style="text-decoration: none;color: inherit" href="https://beian.miit.gov.cn"
                                       target="_blank">${meta.icp_number!''}</a>
                                </#if>
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </footer>
    </div>

</#macro>

<#macro styles title="" description="" keywords="" robots="">
    <meta charset="UTF-8">
    <title>${title!''}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="${description!''}">
    <meta name="keywords" content="${keywords!''}">
    <meta name="robots" content="${robots!''}">
<#--    <meta http-equiv="Content-Security-Policy" content="default-src 'self'">-->
    <meta http-equiv="Cache-Control" content="no-transform">
    <link rel="stylesheet" href="/static/grid.css">
    <link rel="stylesheet" href="/static/site/css/common.css">
  <#--  <link rel="stylesheet" href="/static/global.css">-->
</#macro>

<#macro scripts>
    <script src="/static/jquery.js"></script>
</#macro>
