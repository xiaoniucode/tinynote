<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>系统配置-基本配置</title>
    <@c.styles/>
    <style>
        input {
            min-width: 500px;
        }
    </style>
</head>
<body>
<@c.navigation/>
<div class="flex-fluid">
    <div class="mx-5p">
        <div class="d-flex justify-content-center mt-4">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">网站名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="site_title" value="${(baseConfig.site_title)!}" lay-verify="required"
                               placeholder="请输入网站名称" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">个人简介</label>
                    <div class="layui-input-block">
                       <textarea  id="bio" type="text" name="bio"
                                 placeholder="个人简介，用于网站自我介绍信息"
                                 autocomplete="off"
                                 class="layui-textarea">${(baseConfig.bio)!}</textarea >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">网站域名</label>
                    <div class="layui-input-block">
                        <input type="text" name="site_url" value="${baseConfig.site_url!}" placeholder="站点访问地址"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">网站描述</label>
                    <div class="layui-input-block">
                    <textarea type="text" name="description" placeholder="用于seo，显示在页面meta中" autocomplete="off"
                              class="layui-textarea">${(baseConfig.description)!}</textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">关键词</label>
                    <div class="layui-input-block">
                     <textarea type="text" name="keywords" placeholder="展示HTML在meta中，用于seo" autocomplete="off"
                               class="layui-textarea">${(baseConfig.keywords)!}</textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">爬虫协议</label>
                    <div class="layui-input-block">
                        <input type="text" name="robots" value="${(baseConfig.robots)!}" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">公安备案</label>
                    <div class="layui-input-block">
                        <input type="text" name="public_security" value="${(baseConfig.public_security)!}"
                               placeholder="公安备案号" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">ICP备案</label>
                    <div class="layui-input-block">
                        <input type="text" name="icp_number" value="${(baseConfig.icp_number)!}" placeholder="icp备案号"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">版权信息</label>
                    <div class="layui-input-block">
                        <input type="text" name="copyright" value="${(baseConfig.copyright)!}"
                               placeholder="例如：TinyNote © 2004-2025"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit lay-filter="baseConfigForm">更新配置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<@c.scripts/>
<@c.footer/>
<script>
    layui.use(['form'], function () {
        const form = layui.form;
        const layer = layui.layer;
        // 自定义验证规则
        form.verify({
            pass: function (value) {
                if (!/(.+){6,12}$/.test(value)) {
                    return '密码必须 6 到 12 位';
                }
            }
        });
        // 保存表单基本配置信息
        form.on('submit(baseConfigForm)', function (data) {
            const field = data.field;
            $.ajax({
                url: '/admin/config/update-base-config',
                type: 'put',
                contentType: 'application/json',
                data: JSON.stringify(field),
                success: function (res) {
                    if (res.code === 0) {
                        layer.msg("更新成功");
                    } else {
                        layer.alert(res.msg);
                    }
                },
            });
            return false;
        })
    });
</script>
</body>
</html>
