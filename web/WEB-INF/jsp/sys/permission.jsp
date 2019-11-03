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
        $('#user-div-datagrid').datagrid({
            url:'/user/list',
            columns:[[
                {field:'id',title:'编号',width:100,hidden:true},
                {field:'username',title:'名称',width:100},
                {field:'roles',title:'角色名称',width:100,
                    formatter: function(value,row,index){
                        /*
                        value : 当前field的值(列)
                        row: 当前行对象
                        index：脚标
                         */
                        var result = "";
                        for(var i = 0 ;i<value.length;i++){
                            result += value[i].name;
                            if(i<value.length-1){
                                result+=",";
                            }
                        }
                        //返回值就是当前列的显示数据。
                        return result;
                    }
                }
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
                    $('#user-div-dialog').dialog({
                        title: '新增',
                        width: 500,
                        height: 550,
                        closed: false,
                        cache: false,
                        href: '/page/sys/user-add',
                        modal: true
                    });
                }
            },'-',{
                iconCls: 'icon-remove',
                text:'删除',
                handler: function(){
                    var $selectResult =$("#user-div-datagrid").datagrid("getSelections");
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

                        $.post("/user/delete",{"ids":ids},function (data) {
                            if(data.status==200){
                                $.messager.show({
                                    title:'系统消息',
                                    msg:'删除成功',
                                    timeout:3000,
                                    showType:'slide'
                                });
                                //刷新表格
                                $("#user-div-datagrid").datagrid("reload")
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
                    var $selectResult =$("#user-div-datagrid").datagrid("getSelections");
                    if($selectResult.length!=1){
                        $.messager.alert("系统消息","修改只能选择一行");
                    }else{
                        $('#user-div-dialog').dialog({
                            title: '修改',
                            width: 500,
                            height: 550,
                            closed: false,
                            cache: false,
                            href: '/page/sys/user-update',
                            modal: true,
                            onLoad:function(){
                                $("#userupdate-input-id").textbox("setValue",$selectResult[0].id);
                                $("#userupdate-input-name").textbox("setValue",$selectResult[0].name);
                                $("#userupdate-input-shortName").textbox("setValue",$selectResult[0].shortName);
                                $("#userupdate-input-remark").textbox("setValue",$selectResult[0].remark);
                            }
                        });
                        $('#user-div-dialog').dialog('refresh',"/page/sys/user-update");
                    }

                }
            },'-',{
                iconCls: 'icon-man',
                text:'员工角色分配',
                handler: function(){
                    var $selectResult =$("#user-div-datagrid").datagrid("getSelections");
                    if($selectResult.length!=1){
                        $.messager.alert("系统消息","只能选择一行");
                    }else{
                        $('#user-div-dialog').dialog({
                            title: '员工角色分配',
                            width: 500,
                            height: 550,
                            closed: false,
                            cache: false,
                            href: '/page/sys/permission-role?uid='+$selectResult[0].id,
                            modal: true
                        });
                    }

                }
            }]
        });

        $("#user-input-search").searchbox({
            searcher:function(value){
                $('#user-div-datagrid').datagrid({
                    url:'/user/listByChoice',
                    queryParams: {
                       choice:value
                    },
                    pageNumber:1
                });
            }
        });
    })
</script>
    请输入搜索内容：<input id="user-input-search" class="easyui-searchbox" data-options="prompt:'名称或编号'" style="width:300px;">
    <table id="user-div-datagrid"></table>
    <div id="user-div-dialog"></div>
</body>
</html>
