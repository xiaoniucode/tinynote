<#macro nav meta={}>
    <div>
        <div class="d-flex justify-content-between align-content-center">
            <div style="font-size: 50px;font-weight: bold">${(meta.site_title)!}</div>
            <div>
                <input id="searchInput" placeholder="输入关键字搜索">
            </div>
        </div>
        <div>${(meta.site_description)!}</div>
        <hr/>
        <div>
            <a href="/">首页</a>
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
    <div class="d-flex justify-content-center align-items-center">
        <div style="text-align: center">
            <div>TinyNote © 2004-2025</div>
            <div>
                浙公网安备 33010602451771号 浙ICP备2021012463号-3
            </div>

        </div>
    </div>
</#macro>

<#macro styles meta={}>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="${meta.description!''}">
    <meta name="keywords" content="${meta.keywords!''}">
    <meta name="robots" content="${meta.robots!''}">
<#--    <meta http-equiv="Content-Security-Policy" content="default-src 'self'">-->
    <meta http-equiv="Cache-Control" content="no-transform">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/grid.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/global.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/app.css">
</#macro>

<#macro scripts>
    <script src="${springMacroRequestContext.contextPath}/jquery.js"></script>
</#macro>
