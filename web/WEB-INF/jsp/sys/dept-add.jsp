<%--
  Created by IntelliJ IDEA.
  User: smallming
  Date: 2019/8/30
  Time: 14:03
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
        $("#deptadd-a-submit").click(function(){
            $('#dept-form-add').form('submit', {
                url:"/dept/add",
                onSubmit: function(){
                    if(!$(this).form('validate')){
                        return false;
                    }
                },
                success:function(data){
                    data = eval("("+data+")");
                    if(data.status==200){
                        $.messager.show({
                            title:'系统消息',
                            msg:'新增成功',
                            timeout:3000,
                            showType:'slide'
                        });
                        //刷新表格
                        $("#dept-div-datagrid").datagrid("reload")
                        //关闭对话框
                        $('#dept-div-dialog').dialog("close");
                    }else{
                        $.messager.alert("系统信息","新增失败","error");
                    }
                }
            });
        });

        //关闭按钮
        $("#deptadd-a-reset").click(function(){
            $('#dept-div-dialog').dialog("close");
        })
    })
</script>
<div style="padding:20px;">
<form id="dept-form-add" method="post">
    <div style="margin-bottom:20px">
        <!-- 此处不要忘记包含name属性-->
        <input class="easyui-textbox" label="部门编号" labelPosition="top"  data-options="required:true,missingMessage:'编号不能为空'" name="id" style="width:440px;padding:10px;">
    </div>
    <div style="margin-bottom:20px">
        <!-- 此处不要忘记包含name属性-->
        <input class="easyui-textbox" label="部门名称" labelPosition="top" data-options="required:true,missingMessage:'名称不能为空'" name="name" style="width:440px;padding:10px;">
    </div>
    <div style="margin-bottom:20px">
        <!-- 此处不要忘记包含name属性-->
        <input class="easyui-textbox" label="部门简称" labelPosition="top"  name="shortName" style="width:440px;padding:10px;">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" label="备注" labelPosition="top" multiline="true" name="remark"  style="width:440px;height:120px">
    </div>
    <div style="margin-bottom:20px">
        <a id="deptadd-a-submit" href="#" class="easyui-linkbutton" style="width: 120px;" data-options="iconCls:'icon-ok'">新增</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a id="deptadd-a-reset" href="#" class="easyui-linkbutton" style="width: 120px;" data-options="iconCls:'icon-clear'">关闭</a>
    </div>
</form>
</div>
</body>
</html>
