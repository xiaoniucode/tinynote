<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <@c.styles/>
</head>
<body>
<@c.navigation user={}/>
<!-- 给容器追加 class="layui-form-pane"，即可显示为方框风格 -->
<button type="button" class="layui-btn" id="ID-upload-demo-btn">
    <i class="layui-icon layui-icon-upload"></i> 单图片上传
</button>
<div style="width: 132px;">
    <div class="layui-upload-list">
        <img class="layui-upload-img" id="ID-upload-demo-img" style="width: 100%; height: 92px;">
        <div id="ID-upload-demo-text"></div>
    </div>
    <div class="layui-progress layui-progress-big" lay-showPercent="yes" lay-filter="filter-demo">
        <div class="layui-progress-bar" lay-percent=""></div>
    </div>
</div>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">长输入框</label>
        <div class="layui-input-block">
            <input type="text" name="title" autocomplete="off" placeholder="请输入" lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">日期选择</label>
            <div class="layui-input-block">
                <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">行内表单</label>
            <div class="layui-input-inline">
                <input type="text" name="number" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-inline">
            <input type="password" name="password" placeholder="请输入" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-text-em">请务必填写用户名</div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">范围</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择框</label>
        <div class="layui-input-inline">
            <select name="interest" lay-filter="aihao">
                <option value=""></option>
                <option value="0">写作</option>
                <option value="1" selected>阅读</option>
                <option value="2">游戏</option>
                <option value="3">音乐</option>
                <option value="4">旅行</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" pane>
        <label class="layui-form-label">开关-默认开</label>
        <div class="layui-input-block">
            <input type="checkbox" checked name="open" lay-skin="switch" lay-filter="switchTest" title="开关">
        </div>
    </div>
    <div class="layui-form-item" pane>
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked>
            <input type="radio" name="sex" value="女" title="女">
            <input type="radio" name="sex" value="禁" title="禁用" disabled>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">文本域</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
</div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit lay-filter="demo2">确认</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>


<@c.footer/>
<@c.scripts/>
<script>
    layui.use(function(){
        var upload = layui.upload;
        var layer = layui.layer;
        var element = layui.element;
        var $ = layui.$;
        // 单图片上传
        var uploadInst = upload.render({
            elem: '#ID-upload-demo-btn',
            url: '/admin/file/upload', // 实际使用时改成您自己的上传接口即可。
            before: function(obj){
                // 预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#ID-upload-demo-img').attr('src', result); // 图片链接（base64）
                });

                element.progress('filter-demo', '0%'); // 进度条复位
                layer.msg('上传中', {icon: 16, time: 0});
            },
            done: function(res){
                // 若上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                // 上传成功的一些操作
                // …
                $('#ID-upload-demo-text').html(''); // 置空上传失败的状态
            },
            error: function(){
                // 演示失败状态，并实现重传
                var demoText = $('#ID-upload-demo-text');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            },
            // 进度条
            progress: function(n, elem, e){
                element.progress('filter-demo', n + '%'); // 可配合 layui 进度条元素使用
                if(n == 100){
                    layer.msg('上传完毕', {icon: 1});
                }
            }
        });
    });
</script>


</body>
</html>

