<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>系统配置</title>
    <@c.styles/>
    <style>
        input {
            min-width: 500px;
        }
    </style>
</head>
<body>
<@c.navigation/>
<div class="tn-container">
    <div class="d-flex justify-content-center mt-5">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">站点名称</label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="required" placeholder="请输入网站名称" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">站点地址</label>
                <div class="layui-input-block">
                    <input type="text" name="username"  placeholder="站点访问地址" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">站点描述</label>
                <div class="layui-input-block">
                    <textarea type="text" name="username" lay-verify="required" placeholder="用于seo和个人简介" autocomplete="off"
                              class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">关键词</label>
                <div class="layui-input-block">
                    <input type="text" name="username"  placeholder="用于seo" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">爬虫协议</label>
                <div class="layui-input-block">
                    <input type="text" name="username"  placeholder="用于在页面meta指定爬虫范围协议" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">公安备案</label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" lay-submit lay-filter="demo1">保存配置</button>
                </div>
            </div>
        </form>

    </div>
</div>

<@c.scripts/>
<@c.footer/>
<script>
    layui.use(['form', 'laydate', 'util'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        var util = layui.util;

        // 自定义验证规则
        form.verify({
            pass: function (value) {
                if (!/(.+){6,12}$/.test(value)) {
                    return '密码必须 6 到 12 位';
                }
            }
        });

        // 提交事件
        form.on('submit(demo1)', function (data) {
            var field = data.field; // 获取表单字段值
            // 显示填写结果，仅作演示用
            layer.alert(JSON.stringify(field), {
                title: '当前填写的字段值'
            });
            // 此处可执行 Ajax 等操作
            // …
            return false; // 阻止默认 form 跳转
        });
        // 普通事件
        util.on('lay-on', {
            // 获取验证码
            "get-vercode": function (othis) {
                var isvalid = form.validate('.demo-phone'); // 主动触发验证，v2.7.0 新增
                // 验证通过
                if (isvalid) {
                    layer.msg('手机号规则验证通过');
                    // 此处可继续书写「发送验证码」等后续逻辑
                    // …
                }
            }
        });
    });

</script>
</body>
</html>
