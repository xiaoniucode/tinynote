<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>登录</title>
    <@c.styles/>
</head>
<body>
<div class="container">
    <h2>登录</h2>
    <#if error??>
        <div class="alert alert-danger"></div>
    </#if>
    <div>
        <div class="form-group">
            <label for="username">用户名:</label>
            <input type="text" id="username" value="admin" required>
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" id="password" value="123456" required>
        </div>
        <button id="onLogin">登录</button>
    </div>
</div>
<@c.scripts/>
<@c.footer/>
<script>
    $(document).ready(function () {
        $('#onLogin').click(function () {
            const body = {
                username: $('#username').val(),
                password: $('#password').val()
            }
            $.ajax({
                url: '/admin/doLogin',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(body),
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
                },
                success: function (res) {
                    window.location.href = '/admin/dashboard'
                },
            });
        })
    })
</script>
</body>
</html>
