<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>个人信息</title>
    <@c.styles/>
</head>
<body>
<@c.navigation user={}/>
    <div class="layui-card m-3">
        <div class="layui-card-header">个人信息</div>
        <div class="layui-card-body">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" value="${user.username!}" autocomplete="off" placeholder="请输入登陆用户名" lay-verify="required"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="nickname" value="${user.nickname!}" autocomplete="off" placeholder="请输入展示昵称"
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
    layui.use(function () {
        var upload = layui.upload;
        var layer = layui.layer;
        var element = layui.element;
        var $ = layui.$;
        // 单图片上传
        var uploadInst = upload.render({
            elem: '#ID-upload-demo-btn',
            url: '/admin/file/upload', // 实际使用时改成您自己的上传接口即可。
            before: function (obj) {
                // 预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#ID-upload-demo-img').attr('src', result); // 图片链接（base64）
                });

                element.progress('filter-demo', '0%'); // 进度条复位
                layer.msg('上传中', {icon: 16, time: 0});
            },
            done: function (res) {
                // 若上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                // 上传成功的一些操作
                // …
                $('#ID-upload-demo-text').html(''); // 置空上传失败的状态
            },
            error: function () {
                // 演示失败状态，并实现重传
                var demoText = $('#ID-upload-demo-text');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            },
            // 进度条
            progress: function (n, elem, e) {
                element.progress('filter-demo', n + '%'); // 可配合 layui 进度条元素使用
                if (n == 100) {
                    layer.msg('上传完毕', {icon: 1});
                }
            }
        });
    });
</script>


</body>
</html>

