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
        $("#customadd-a-submit").click(function(){
            $('#custom-form-add').form('submit', {
                url:"/custom/insert",
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
                        $("#custom-div-datagrid").datagrid("reload")
                        //关闭对话框
                        $('#custom-div-dialog').dialog("close");
                    }else{
                        $.messager.alert("系统信息",data.msg,"error");
                    }
                }
            });
        });

        //关闭按钮
        $("#customadd-a-reset").click(function(){
            $('#custom-div-dialog').dialog("close");
        })
    })
</script>
<div style="padding:20px;">
<form id="custom-form-add" method="post" enctype="multipart/form-data">
    <div style="margin-bottom:20px">
        <!-- 此处不要忘记包含name属性-->
        <input class="easyui-textbox" label="标题" labelPosition="top"  data-options="required:true,missingMessage:'标题不能为空'" name="title" style="width:440px;padding:10px;">
    </div>
    <div style="margin-bottom:20px">
        <!-- 此处不要忘记包含name属性-->
        <input class="easyui-textbox" label="url" labelPosition="top" data-options="required:true,missingMessage:'url不能为空'" name="url" style="width:440px;padding:10px;">
    </div>
    <div style="margin-bottom:20px">
        <!-- 此处不要忘记包含name属性-->
        <input class="easyui-filebox" label="图标" labelPosition="top" name="file"  style="width:440px;padding:10px;">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" label="备注" labelPosition="top" multiline="true" name="remark"  style="width:440px;height:120px">
    </div>
    <div style="margin-bottom:20px">
        <a id="customadd-a-submit" href="#" class="easyui-linkbutton" style="width: 120px;" data-options="iconCls:'icon-ok'">新增</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a id="customadd-a-reset" href="#" class="easyui-linkbutton" style="width: 120px;" data-options="iconCls:'icon-clear'">关闭</a>
    </div>
</form>
</div>
</body>
</html>
