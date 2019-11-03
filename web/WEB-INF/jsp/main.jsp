<%--
  Created by IntelliJ IDEA.
  User: smallming
  Date: 2019/8/30
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>世尊家具综合管理系统-主页面</title>
    <link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css">
    <script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#main-ul-tree').tree({
                url:'/showMenu',
                onClick:function(node){
                    //getTab : 获取选项卡面板对象，没有时返回null
                    if($("#main-div-tabs").tabs("getTab",node.text)==null){
                        // add 添加一个选项卡
                        $('#main-div-tabs').tabs('add',{
                            title: node.text, // 选项卡标题
                            selected: true,//是否被选中
                            closable:true,//是否有关闭
                            href:node.attributes //页面的url
                        });
                    }else{
                        //选中指定选项卡
                        $('#main-div-tabs').tabs("select",node.text);
                    }
                }
            });
        });
    </script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',title:'顶部信息'" style="height:100px;">
        <div style="width: 300px; height: 60px;line-height: 60px; float: left;font-size: 20px; color:gray;">世尊家具综合管理系统</div>
        <div style="width: 200px; float: right;height: 60px;line-height: 60px;">您好，${user.username}，欢迎登录！<a href="/logout">退出</a></div>
    </div>
    <div data-options="region:'south',title:'底部信息'" style="height:100px;">
        <div style="height: 60px; text-align: center; line-height: 60px; color: gray;">
            Copyright &copy; 北京尚学堂403所有
        </div>
    </div>
    <div data-options="region:'west',title:'菜单',split:true" style="width:200px;">
        <ul id="main-ul-tree"></ul>
    </div>
    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
        <div id="main-div-tabs" class="easyui-tabs" style="width:500px;height:250px;" data-options="fit:true">
            <div title="首页" style="padding:20px;">
                欢迎使用世尊家具综合管理系统
            </div>
        </div>
    </div>
</body>
</html>
