<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>登录</title>
    <@c.styles/>
    <style>
        .demo-login-container {
            padding-top: 5%;
            width: 350px;
            margin: 21px auto 0;
        }

        .demo-login-other .layui-icon {
            position: relative;
            display: inline-block;
            margin: 0 2px;
            top: 2px;
            font-size: 26px;
        }
    </style>
</head>
<body>
<div>
    <div>
        <form class="layui-form">
            <div class="demo-login-container">
                <div class="layui-form-item">
                    <div class="layui-input-wrap">
                        <div class="layui-input-prefix">
                            <i class="layui-icon layui-icon-username"></i>
                        </div>
                        <input type="text" name="username" value="" lay-verify="required" placeholder="用户名"
                               lay-reqtext="请填写用户名" autocomplete="off" class="layui-input" lay-affix="clear">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-wrap">
                        <div class="layui-input-prefix">
                            <i class="layui-icon layui-icon-password"></i>
                        </div>
                        <input type="password" name="password" value="" lay-verify="required" placeholder="密   码"
                               lay-reqtext="请填写密码" autocomplete="off" class="layui-input" lay-affix="eye">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-row">
                        <div class="layui-col-xs7">
                            <div class="layui-input-wrap">
                                <div class="layui-input-prefix">
                                    <i class="layui-icon layui-icon-vercode"></i>
                                </div>
                                <input type="text" name="captcha" value="" lay-verify="required" placeholder="验证码"
                                       lay-reqtext="请填写验证码" autocomplete="off" class="layui-input"
                                       lay-affix="clear">
                            </div>
                        </div>
                        <div class="layui-col-xs5">
                            <div style="margin-left: 10px;">
                                <img src="https://www.oschina.net/action/user/captcha"
                                     onclick="this.src='https://www.oschina.net/action/user/captcha?t='+ new Date().getTime();">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
                    <a href="#forget" style="float: right; margin-top: 7px;">忘记密码？</a>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-login">登录</button>
                </div>
                <div class="layui-form-item demo-login-other">
                    <label>社交账号登录</label>
                    <span style="padding: 0 21px 0 6px;">
        <a href="javascript:;"><i class="layui-icon layui-icon-login-qq" style="color: #3492ed;"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat" style="color: #4daf29;"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo" style="color: #cf1900;"></i></a>
      </span>
                    或 <a href="#reg">注册帐号</a>
                </div>
            </div>
        </form>
    </div>
</div>
<@c.scripts/>
<@c.footer/>
<script>
    layui.use(function () {
        const form = layui.form;
        // 提交事件
        form.on('submit(demo-login)', function (data) {
            const formData = data.field; // 获取表单字段值
            $.ajax({
                url: '/admin/doLogin',
                type: 'post',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
                },
                success: function (res) {
                    window.location.href = '/admin/dashboard'
                },
            });
            return false; // 阻止默认 form 跳转
        });
    });
</script>
</body>
</html>
