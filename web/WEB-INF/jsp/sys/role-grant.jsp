<%--
  Created by IntelliJ IDEA.
  User: smallming
  Date: 2019/9/2
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function(){
        var $selectResult2 =$("#role-div-datagrid").datagrid("getSelections");
        $('#rolegrant-ul-tree').tree({
            url:'/menu/showAllWithGrant?rid='+$selectResult2[0].id,
            checkbox:true
        });

        var roles = null;
        //提出到全局为了先加载，防止点击按钮时加载和后面ajax顺序
        $.post("/user/getRoles",function(data){
            roles = data;
        });
        //按钮点击事件
        $("#rolegrant-a-submit").click(function(){
            //var rid = ${roleids};
            if(roles==null){
                $.messager.alert("系统消息","请稍等，正在获取用户登录数据");
                return;
            }

            //判断是否是当前用户
            var isCurr = false;
            for(var i = 0 ;i<roles.length;i++){
                if(roles[i].id==$selectResult2[0].id){
                    isCurr = true;
                    break;
                }
            }
            if(isCurr){
                //如果为false，下面不执行
                $.messager.confirm("系统消息","系统发现修改角色为当前用户角色，修改后需要重新登录，确认要继续吗？",function (r) {
                    if(r){
                        var nodes = $('#rolegrant-ul-tree').tree('getChecked', ['checked', 'indeterminate']);
                        var result = "";
                        for (var i = 0; i < nodes.length; i++) {
                            result += nodes[i].id;
                            if (i < nodes.length - 1) {
                                result += ",";
                            }
                        }
                        //提交给服务端
                        $.post("/role/menu/update", {"mids": result, "rid": $selectResult2[0].id}, function (data) {
                            if (data.status == 200) {
                                $.messager.show({
                                    title: '系统消息',
                                    msg: '操作成功',
                                    timeout: 3000,
                                    showType: 'slide'
                                });
                                top.location.href="/logout";
                                //关闭对话框
                                $('#role-div-dialog').dialog("close");
                            } else {
                                $.messager.alert("系统消息", data.msg);
                            }
                        });
                    }
                });
            }else{
                var nodes = $('#rolegrant-ul-tree').tree('getChecked', ['checked', 'indeterminate']);
                var result = "";
                for (var i = 0; i < nodes.length; i++) {
                    result += nodes[i].id;
                    if (i < nodes.length - 1) {
                        result += ",";
                    }
                }
                //提交给服务端
                $.post("/role/menu/update", {"mids": result, "rid": $selectResult2[0].id}, function (data) {
                    if (data.status == 200) {
                        $.messager.show({
                            title: '系统消息',
                            msg: '操作成功',
                            timeout: 3000,
                            showType: 'slide'
                        });
                        //关闭对话框
                        $('#role-div-dialog').dialog("close");
                    } else {
                        $.messager.alert("系统消息", data.msg);
                    }
                });
            }
        });
    });
</script>
<ul id="rolegrant-ul-tree"></ul>
<a id="rolegrant-a-submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">submit</a>
</body>
</html>
