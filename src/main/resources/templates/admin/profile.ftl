<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>个人信息</title>
    <@c.styles/>
</head>
<body>
<@c.navigation user={}/>
<div class="layui-card m-4">
    <div class="layui-card-header">个人信息</div>
    <div class="layui-card-body">

        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <div style="width: 132px;" id="upload-avatar">
                    <div class="layui-upload-list">
                        <img src="${user.avatar!}" class="layui-upload-img" id="ID-upload-demo-img"
                             style="width: 100%; height: 92px;">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" value="${user.username!}" autocomplete="off"
                           placeholder="请输入登陆用户名" lay-verify="required"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-inline">
                    <input type="text" name="nickname" value="${user.nickname!}" autocomplete="off"
                           placeholder="请输入展示昵称"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn" lay-submit lay-filter="saveProfile">确认保存</button>
            </div>
        </form>
    </div>
</div>


<@c.footer/>
<@c.scripts/>
<script>
    layui.use(['form'], function () {
        const form = layui.form;
        const upload = layui.upload;
        const layer = layui.layer;
        const element = layui.element;
        const $ = layui.$;
        //更新用户信息按钮事件
        form.on('submit(saveProfile)', function (data) {
            const field = data.field;
            $.ajax({
                url: '/admin/user/update-user',
                type: 'put',
                contentType: 'application/json',
                data: JSON.stringify(field),
                success: function (res) {
                    if (res.code === 0) {
                        layer.msg("更新成功")
                    } else {
                        layer.msg(res.msg)
                    }
                }
            });
            return false;
        });
        // 更新头像
        const uploadInst = upload.render({
            elem: '#upload-avatar',
            url: '/admin/user/update-avatar',
            before: function (obj) {
                // 显示上传中的提示，并记录其key以便后续关闭
                const loadIndex = layer.msg('上传中...', {icon: 16, time: 0});
                $(this.elem).data('loadIndex', loadIndex);
            },
            done: function (res) {
                const loadIndex = $(this.elem).data('loadIndex');
                if (loadIndex) {
                    layer.close(loadIndex);
                }
                if (res.code > 0) {
                    layer.msg('上传失败: ' + (res.msg || '未知错误'));
                    return;
                }
                layer.msg('上传成功！', {icon: 1});
                $('#ID-upload-demo-img').attr('src', res.data);
            },
            error: function (index, upload) {
                // 关闭上传中的提示
                const loadIndex = $(this.elem).data('loadIndex');
                if (loadIndex) {
                    layer.close(loadIndex);
                }
                layer.msg('上传请求发送失败，可能是网络问题或服务器异常。');
                console.error('Upload error:', index, upload);
            }
        });
    });
</script>


</body>
</html>

