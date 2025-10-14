<#import "common.ftl" as c>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
    <@c.styles />
</head>
<body>
<div class="main-container">
    <@c.nav meta=meta/>
    <div class="d-flex justify-content-between">
        <div class="flex-grow-1 me-3">
            <div>
                空空如也
            </div>

        </div>
        <div class="flex-shrink-0" style="width: 200px">
            <#list 1..20 as i>
                <a href="/tag/${i}" class="d-flex align-items-center justify-content-between mb-1">
                    <div class="me-3">大数据</div>
                    <div>32</div>
                </a>
            </#list>
        </div>
    </div>
</div>

<@c.footer/>
<@c.scripts/>
<script>
    $(document).ready(function () {

    })
</script>


</body>
</html>
