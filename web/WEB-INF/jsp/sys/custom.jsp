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
        $('#custom-div-datagrid').datagrid({
            url:'/custom/list',
            columns:[[
                {field:'id',title:'部门编号',width:100,hidden:true},
                {field:'title',title:'标题',width:100},
                {field:'url',title:'url',width:100},
                {field:'photo',title:'图标',width:100,
                    formatter: function(value,row,index){
                        return "<img src='"+value+"' width='80' />";
                    },
                    styler: function(value,row,index){
                        return "height:100px;"
                    }

                },
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
                    $('#custom-div-dialog').dialog({
                        title: '新增',
                        width: 500,
                        height: 550,
                        closed: false,
                        cache: false,
                        href: '/page/sys/custom-add',
                        modal: true
                    });
                }
            },'-',{
                iconCls: 'icon-remove',
                text:'删除',
                handler: function(){
                    var $selectResult =$("#custom-div-datagrid").datagrid("getSelections");
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

                        $.post("/custom/delete",{"ids":ids},function (data) {
                            if(data.status==200){
                                $.messager.show({
                                    title:'系统消息',
                                    msg:'删除成功',
                                    timeout:3000,
                                    showType:'slide'
                                });
                                //刷新表格
                                $("#custom-div-datagrid").datagrid("reload")
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
                    var $selectResult =$("#custom-div-datagrid").datagrid("getSelections");
                    if($selectResult.length!=1){
                        $.messager.alert("系统消息","修改只能选择一行");
                    }else{
                        $('#custom-div-dialog').dialog({
                            title: '修改',
                            width: 500,
                            height: 550,
                            closed: false,
                            cache: false,
                            href: '/page/sys/custom-update',
                            modal: true,
                            onLoad:function(){
                                $("#customupdate-input-id").textbox("setValue",$selectResult[0].id);
                                $("#customupdate-input-name").textbox("setValue",$selectResult[0].name);
                                $("#customupdate-input-shortName").textbox("setValue",$selectResult[0].shortName);
                                $("#customupdate-input-remark").textbox("setValue",$selectResult[0].remark);
                            }
                        });
                        $('#custom-div-dialog').dialog('refresh',"/page/sys/custom-update");
                    }

                }
            }]
        });

        $("#custom-input-search").searchbox({
            searcher:function(value){
                $('#custom-div-datagrid').datagrid({
                    url:'/custom/listByChoice',
                    queryParams: {
                       choice:value
                    },
                    pageNumber:1
                });
            }
        });
    })
</script>
    请输入搜索内容：<input id="custom-input-search" class="easyui-searchbox" data-options="prompt:'名称或编号'" style="width:300px;">
    <table id="custom-div-datagrid"></table>
    <div id="custom-div-dialog"></div>
</body>
</html>
