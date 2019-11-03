<%--
  Created by IntelliJ IDEA.
  User: smallming
  Date: 2019/9/2
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style type="text/css">
    .my-icon-grant{
        background:url('/images/grant.jpg') no-repeat center center;
    }
</style>
<script type="text/javascript">
    $(function(){
        $('#role-div-datagrid').datagrid({
            url:'/role/list',
            columns:[[
                {field:'id',title:'部门编号',width:100,hidden:true},
                {field:'name',title:'角色名称',width:100},
                {field:'sort',title:'排序ID',width:100},
                {field:'remark',title:'备注',width:100}
            ]],
            pagination:true,
            striped:true,
            fitColumns:true,
            pageList:[3,1,5,4],
            pageSize:3,
            pageNumber:1,
            toolbar: [{
                iconCls: 'icon-add',
                text:'新增',
                handler: function(){
                    $('#role-div-dialog').dialog({
                        title: '新增',
                        width: 500,
                        height: 550,
                        closed: false,
                        cache: false,
                        href: '/page/sys/role-add',
                        modal: true
                    });
                }
            },'-',{
                iconCls: 'icon-remove',
                text:'删除',
                handler: function(){
                    var $selectResult =$("#role-div-datagrid").datagrid("getSelections");
                    if($selectResult.length==0){
                        $.messager.alert("系统消息","请至少选择一行要删除数据");
                    }else{
                        var ids = "";
                        //i 脚标   n 迭代变量
                        $.each($selectResult,function(i,n){
                            ids+=n.id;
                            if(i<$selectResult.length-1){
                                ids+=",";
                            }
                        });

                        $.post("/role/delete",{"ids":ids},function (data) {
                            if(data.status==200){
                                $.messager.show({
                                    title:'系统消息',
                                    msg:'删除成功',
                                    timeout:3000,
                                    showType:'slide'
                                });
                                //刷新表格
                                $("#role-div-datagrid").datagrid("reload")
                            }else{
                                $.messager.alert("系统消息",data.msg,"error");
                            }
                        })
                    }

                }
            },'-',{
                iconCls: 'icon-edit',
                text:'修改',
                handler: function(){
                    var $selectResult =$("#role-div-datagrid").datagrid("getSelections");
                    if($selectResult.length!=1){
                        $.messager.alert("系统消息","修改只能选择一行");
                    }else{
                        $('#role-div-dialog').dialog({
                            title: '修改',
                            width: 500,
                            height: 550,
                            closed: false,
                            cache: false,
                            href: '/page/sys/role-update',
                            modal: true,
                            onLoad:function(){
                                $("#roleupdate-input-id").textbox("setValue",$selectResult[0].id);
                                $("#roleupdate-input-name").textbox("setValue",$selectResult[0].name);
                                $("#roleupdate-input-shortName").textbox("setValue",$selectResult[0].shortName);
                                $("#roleupdate-input-remark").textbox("setValue",$selectResult[0].remark);
                            }
                        });
                    }

                }
            },'-',{
                iconCls: 'my-icon-grant',
                text:'授权',
                handler: function(){
                    var $selectResult =$("#role-div-datagrid").datagrid("getSelections");
                    if($selectResult.length!=1){
                        $.messager.alert("系统消息","只能选择一行");
                    }else {
                        $('#role-div-dialog').dialog({
                            title: '授权',
                            width: 500,
                            height: 550,
                            closed: false,
                            cache: false,
                            href: '/page/sys/role-grant',
                            modal: true
                        });
                    }
                }
            }]
        });

        $("#role-input-search").searchbox({
            searcher:function(value){
                $('#role-div-datagrid').datagrid({
                    url:'/role/list',
                    queryParams: {
                        choice:value
                    },
                    pageNumber:1
                });

            }
        });
    })
</script>
请输入搜索内容：<input id="role-input-search" class="easyui-searchbox" data-options="prompt:'名称或编号'" style="width:300px;">
<table id="role-div-datagrid"></table>
<div id="role-div-dialog"></div>
</body>
</html>
