<#macro navigation user={}>
    <ul class="layui-nav">
        <div class="d-flex justify-content-between">
            <div>
                <li class="layui-nav-item layui-this"><a href="/admin/dashboard">控制面板</a></li>
                <li class="layui-nav-item">
                    <a href="/admin/write-post">撰写文章</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/posts">文章管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">系统配置</a>
                    <dl class="layui-nav-child">
                        <a href="/admin/config-base">基本配置</a>
                    </dl>
                </li>
            </div>
            <div>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="https://unpkg.com/outeres@0.0.10/demo/avatar/1.jpg" class="layui-nav-img">
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">个人信息</a></dd>
                        <dd><a href="javascript:;">修改密码</a></dd>
                        <hr>
                        <dd style="text-align: center;"><a href="/admin/exit">退出登陆</a></dd>
                    </dl>
                </li>
                <li style="text-align: right" class="layui-nav-item"><a href="/">访问站点</a></li>
            </div>
        </div>
    </ul>
</#macro>

<#macro footer>
    <div style="flex-shrink:0" class="d-flex justify-content-center">
        <p>&copy; 2025 xilio.cn. 版权所有.</p>
    </div>
</#macro>

<#macro styles meta={}>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/admin/vendor/layui/css/layui.css">
    <link rel="stylesheet" href="/static/grid.css">
    <link rel="stylesheet" href="/static/global.css">
    <link rel="stylesheet" href="/static/app.css">

</#macro>

<#macro scripts>
    <script src="/static/jquery.js"></script>
    <script src="/static/admin/vendor/layui/layui.js"></script>
</#macro>

