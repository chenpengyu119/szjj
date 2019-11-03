<%--
  Created by IntelliJ IDEA.
  User: smallming
  Date: 2019/8/30
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<!--只能加载body内容 -->
<body>
<script type="text/javascript">
    $(function(){
        $('#dept-div-datagrid').datagrid({
            url:'/dept/list',
            columns:[[
                {field:'id',title:'部门编号',width:100},
                {field:'name',title:'部门名称',width:100},
                {field:'shortName',title:'部门简称',width:100},
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
                    $('#dept-div-dialog').dialog({
                        title: '新增',
                        width: 500,
                        height: 550,
                        closed: false,
                        cache: false,
                        href: '/page/sys/dept-add',
                        modal: true
                    });
                }
            },'-',{
                iconCls: 'icon-remove',
                text:'删除',
                handler: function(){
                    var $selectResult =$("#dept-div-datagrid").datagrid("getSelections");
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

                        $.post("/dept/delete",{"ids":ids},function (data) {
                            if(data.status==200){
                                $.messager.show({
                                    title:'系统消息',
                                    msg:'删除成功',
                                    timeout:3000,
                                    showType:'slide'
                                });
                                //刷新表格
                                $("#dept-div-datagrid").datagrid("reload")
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
                    var $selectResult =$("#dept-div-datagrid").datagrid("getSelections");
                    if($selectResult.length!=1){
                        $.messager.alert("系统消息","修改只能选择一行");
                    }else{
                        $('#dept-div-dialog').dialog({
                            title: '修改',
                            width: 500,
                            height: 550,
                            closed: false,
                            cache: false,
                            href: '/page/sys/dept-update',
                            modal: true,
                            onLoad:function(){
                                $("#deptupdate-input-id").textbox("setValue",$selectResult[0].id);
                                $("#deptupdate-input-name").textbox("setValue",$selectResult[0].name);
                                $("#deptupdate-input-shortName").textbox("setValue",$selectResult[0].shortName);
                                $("#deptupdate-input-remark").textbox("setValue",$selectResult[0].remark);
                            }
                        });
                        $('#dept-div-dialog').dialog('refresh',"/page/sys/dept-update");
                    }

                }
            }]
        });

        $("#dept-input-search").searchbox({
            searcher:function(value){
                $('#dept-div-datagrid').datagrid({
                    url:'/dept/listByChoice',
                    queryParams: {
                       choice:value
                    },
                    pageNumber:1
                });
            }
        });
    })
</script>
    请输入搜索内容：<input id="dept-input-search" class="easyui-searchbox" data-options="prompt:'名称或编号'" style="width:300px;">
    <table id="dept-div-datagrid"></table>
    <div id="dept-div-dialog"></div>
</body>
</html>
