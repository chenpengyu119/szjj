
<%--
  Created by IntelliJ IDEA.
  User: smallming
  Date: 2019/9/3
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
        $(function(){
            var $selectResult =$("#user-div-datagrid").datagrid("getSelections");
            $("#permissionrole-input-uid").val($selectResult[0].id);
            $("#permissionrole-a-submit").click(function(){
                $('#permissionrole-form').form('submit', {
                    url:'/user/role/update',
                    onSubmit: function(){
                        // do some check
                        // return false to prevent submit;
                    },
                    success:function(data){
                        data = eval("("+data+")");
                        if(data.status==200){
                            $.messager.show({
                                title:'系统消息',
                                msg:'操作成功',
                                timeout:3000,
                                showType:'slide'
                            });
                            //刷新表格
                            $("#user-div-datagrid").datagrid("reload")
                            //关闭对话框
                            $('#user-div-dialog').dialog("close");
                        }else{
                            $.messager.alert("系统信息",data.msg,"error");
                        }
                    }
                });
            })
        })
</script>
<div id="permissionrole-div-roles" style="padding: 20px;">
    <form method="post" id="permissionrole-form">
        <input type="hidden" name="uid" id="permissionrole-input-uid"/>
    <c:forEach items="${roles}" var="role" varStatus="status">
    <input class='easyui-checkbox' name='rid' value='${role.id}' label='${role.name}'<c:if test="${role.checked}">checked</c:if>    >
        <c:if test="${status.count%3==0}">
            <br/>
        </c:if>
        <c:if test="${status.count%3!=0}">
            &nbsp;&nbsp;&nbsp;&nbsp;
        </c:if>
    </c:forEach>
        <a id="permissionrole-a-submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认提交</a>
    </form>
</div>
</body>
</html>
