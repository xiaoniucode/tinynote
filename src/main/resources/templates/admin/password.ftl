<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>修改密码</title>
    <@c.styles/>
</head>
<body>
<@c.navigation user={}/>
<div class="layui-card m-4">
    <div class="layui-card-header">修改密码</div>
    <div class="layui-card">
        <form class="layui-form layui-form-pane p-3" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">当前密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="oldPassword" placeholder="请输入当前密码" lay-verify="required"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="newPassword" placeholder="请输入新密码" lay-verify="required"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="confirmPassword" placeholder="确认新密码" lay-verify="required"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn" lay-submit lay-filter="passwordForm">确认修改</button>
            </div>
        </form>
    </div>
</div>
<@c.footer/>
<@c.scripts/>
<script>
    layui.use(['form'], function () {
        const form = layui.form;
        const layer = layui.layer;
        //执行修改密码
        form.on('submit(passwordForm)', function (data) {
            const field = data.field;
            if (field.oldPassword === field.newPassword) {
                layer.msg('新密码不能和原密码相同');
                return false;
            }
            if (field.confirmPassword !== field.newPassword) {
                layer.msg('新密码和确认密码不一致');
                return false;
            }
            $.ajax({
                url: '/admin/user/change-password',
                type: 'put',
                contentType: 'application/json',
                data: JSON.stringify(field),
                success: function (res) {
                    if (res.code === 0) {
                        window.location.href = "/admin/exit"
                    } else {
                        layer.msg(res.msg)
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>

