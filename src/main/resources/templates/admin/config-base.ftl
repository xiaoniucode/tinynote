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
<@c.navigation user='admin'/>
<div class="tn-container">
    <div class="d-flex justify-content-center">
        <div>
            <div>
                <div>站点名称</div>
                <input>
            </div>
            <div>
                <div>站点地址</div>
                <input>
            </div>
            <div>
                <div>站点描述</div>
                <input>
            </div>
            <div>
                <div>SEO关键词</div>
                <input>
            </div>
            <div>
                <div>SEO描述</div>
                <input>
            </div>
            <div>
                <div>公安备案</div>
                <input>
            </div>
            <div>
                <button id="saveConfig">保存配置</button>
            </div>
        </div>
    </div>
</div>
<@c.scripts/>
<@c.footer/>
<script>
    $(document).ready(function () {
        $('#saveConfig').click(function () {
            alert("save")
        })
    })

</script>
</body>
</html>
