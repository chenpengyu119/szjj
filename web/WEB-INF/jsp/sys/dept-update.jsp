<%--
  Created by IntelliJ IDEA.
  User: smallming
  Date: 2019/8/30
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    //$(function(){
        $("#deptupdate-a-submit").click(function(){
            $('#deptupdate-form-add').form('submit', {
                url:"/dept/update",
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
                            msg:'修改成功',
                            timeout:3000,
                            showType:'slide'
                        });
                        //刷新表格
                        $("#dept-div-datagrid").datagrid("reload")
                        //关闭对话框
                        $('#dept-div-dialog').dialog("close");
                    }else{
                        $.messager.alert("系统信息",data.msg,"error");
                    }
                }
            });
        });

        //关闭按钮
        $("#deptupdate-a-reset").click(function(){
            $('#dept-div-dialog').dialog("destroy");
        })
    //})
</script>
<div style="padding:20px;">
    <form id="deptupdate-form-add" method="post">
        <div style="margin-bottom:20px">
            <!-- 此处不要忘记包含name属性-->
            <input class="easyui-textbox" id="deptupdate-input-id" label="部门编号" labelPosition="top"  data-options="required:true,missingMessage:'编号不能为空'" name="id" style="width:440px;padding:10px;" readonly="readonly">
        </div>
        <div style="margin-bottom:20px">
            <!-- 此处不要忘记包含name属性-->
            <input class="easyui-textbox" id="deptupdate-input-name" label="部门名称" labelPosition="top" data-options="required:true,missingMessage:'名称不能为空'" name="name" style="width:440px;padding:10px;">
        </div>
        <div style="margin-bottom:20px">
            <!-- 此处不要忘记包含name属性-->
            <input class="easyui-textbox" id="deptupdate-input-shortName" label="部门简称" labelPosition="top"  name="shortName" style="width:440px;padding:10px;">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="deptupdate-input-remark" label="备注" labelPosition="top" multiline="true" name="remark"  style="width:440px;height:120px">
        </div>
        <div style="margin-bottom:20px">
            <a id="deptupdate-a-submit" href="#" class="easyui-linkbutton" style="width: 120px;" data-options="iconCls:'icon-ok'">提交</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a id="deptupdate-a-reset" href="#" class="easyui-linkbutton" style="width: 120px;" data-options="iconCls:'icon-clear'">关闭</a>
        </div>
    </form>
</div>
</body>
</html>
