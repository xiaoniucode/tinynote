<#macro navigation user>
    <div class="mb-3" style="background-color: #8baceb; ">
        <nav class="d-flex justify-content-between mx-3" >
            <div>
                <a href="/admin/dashboard">控制台</a>
                <a href="/admin/write-post">撰写文章</a>
                <a href="/admin/posts">文章管理</a>
                <a href="/admin/config-base">系统配置</a>
            </div>
            <div>
                <#if user??>
                    <a href="/profile">欢迎, ${user}</a>
                    <a href="/logout">退出</a>
                <#else>
                    <a href="/login">登录</a>
                </#if>
                <a href="/">站点</a>
            </div>
        </nav>
    </div>
</#macro>

<#macro footer>
    <div style="flex-shrink:0" class="d-flex justify-content-center">
        <p>&copy; 2025 我的网站. 版权所有.</p>
    </div>
</#macro>

<#macro styles meta={}>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/grid.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/global.css">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/app.css">
</#macro>

<#macro scripts>
    <script src="${springMacroRequestContext.contextPath}/jquery.js"></script>
</#macro>

