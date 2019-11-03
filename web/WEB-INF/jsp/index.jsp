<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>世尊家具综合管理系统-登录页面</title>
    <link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css"/>
    <script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //登录按钮点击事件
            $("#index-a-submit").click(function(){
                $('#index-form-login').form('submit', {
                    url:"/login",
                    onSubmit: function(){
                        if(!$(this).form('validate')){
                            return false;
                        }
                    },
                    success:function(data){
                        //easyui中form返回结果需要解析
                        data = eval("("+data+")");
                        if(data.status==200){
                            location.href="/main";
                        }else{
                            $.messager.alert("系统信息","用户名/密码不正确","warning");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<div style="width: 400px;height: 300px; margin:50px auto;">
    <div class="easyui-panel" style="width:400px;padding:50px 60px">
        <div style="margin-bottom:20px;font-size:25px; text-align: center;color:gray;">
            世尊家具综合管理系统
        </div>
        <form id="index-form-login" method="post">
            <div style="margin-bottom:20px">
                <!-- 此处不要忘记包含name属性-->
                <input class="easyui-textbox" prompt="用户名" iconWidth="28" data-options="required:true,missingMessage:'用户名不能为空'" name="username" style="width:100%;height:34px;padding:10px;">
            </div>
            <div style="margin-bottom:20px">
                <!-- 此处不要忘记包含name属性-->
                <input class="easyui-passwordbox" prompt="密码" iconWidth="28" data-options="required:true,missingMessage:'密码不能为空'" name="password" style="width:100%;height:34px;padding:10px">
            </div>
            <div style="margin-bottom:20px">
                <a id="index-a-submit" href="#" class="easyui-linkbutton" style="width: 120px;" data-options="iconCls:'icon-ok'">登录</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a id="index-a-reset" href="#" class="easyui-linkbutton" style="width: 120px;" data-options="iconCls:'icon-clear'">清空</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
