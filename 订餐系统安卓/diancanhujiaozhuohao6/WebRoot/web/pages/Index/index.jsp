<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String roletype = session.getAttribute("roletype").toString();
%>


<html>
<head id="Head1">
    <%@ include file="/web/common/common.jsp" %>
    <script type="text/javascript" src="<%=__APP__ %>/web/public/js/outlook2.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=__APP__ %>/web/public/css/default.css"/>
    <script type="text/javascript">
    var roletype = <%=roletype%>;
    var _menus = "";
    if(roletype == "1"){
    	_menus = {
   	         "menus": [
   	             {"menuid": "1", "icon": "icon-magic", "menuname": "菜品管理",
   	                 "menus": [
   	                     {"menuid": "12", "menuname": "菜品列表", "icon": "icon-database", "url": "<%= __APP__%>/Good!good"}
   	                 ]},
   	                 {"menuid": "1", "icon": "icon-magic", "menuname": "桌号管理",
   	   	                 "menus": [
   	   	   	                     {"menuid": "12", "menuname": "桌号列表", "icon": "icon-database", "url": "<%= __APP__%>/Room!room"}
   	   	   	                 ]}, 
   	             {"menuid": "1", "icon": "icon-magic", "menuname": "类别管理",
   	                 "menus": [
   	                     {"menuid": "12", "menuname": "类别列表", "icon": "icon-database", "url": "<%= __APP__%>/Good!type"}
   	                 ]},
   	              /*{"menuid": "1", "icon": "icon-magic", "menuname": "采购管理",
   	                     "menus": [
                            {"menuid": "12", "menuname": "采购列表", "icon": "icon-database", "url": "<%= __APP__%>/Notice!notice"}
   	                     ]},*/
   	              /*{"menuid": "1", "icon": "icon-magic", "menuname": "呼叫管理",
   	   	                 "menus": [
   	   	                     {"menuid": "12", "menuname": "呼叫列表", "icon": "icon-database", "url": "<%= __APP__%>/Fuwu!fuwu"}
   	   	                 ]},
   	                 {"menuid": "1", "icon": "icon-magic", "menuname": "通知管理",
   	                     "menus": [
                            {"menuid": "12", "menuname": "通知列表", "icon": "icon-database", "url": "<%= __APP__%>/Notice!notice"}
   	                     ]},
   	                  {"menuid": "1", "icon": "icon-magic", "menuname": "呼叫服务",
   	   	                     "menus": [
   	                            {"menuid": "12", "menuname": "呼叫列表", "icon": "icon-database", "url": "<%= __APP__%>/Fuwu!fuwu"}
   	   	                     ]},*/
   	             {"menuid": "1", "icon": "icon-magic", "menuname": "订单管理",
   	                 "menus": [
   	                     {"menuid": "12", "menuname": "订单管理", "icon": "icon-database", "url": "<%= __APP__%>/Bill!bill"}
   	                 ]},
   	              /*{"menuid": "1", "icon": "icon-magic", "menuname": "餐厅管理",
   	   	                 "menus": [
   	   	                     {"menuid": "12", "menuname": "餐厅列表", "icon": "icon-database", "url": "<%= __APP__%>/Shop!shop"}
   	   	                 ]},
   	   	           {"menuid": "1", "icon": "icon-magic", "menuname": "留言评论管理",
   	   	   	                 "menus": [
   	   	   	                     {"menuid": "12", "menuname": "留言评论列表", "icon": "icon-database", "url": "<%= __APP__%>/Replay!replay"}
   	   	   	                 ]},*/
   	                 {"menuid": "1", "icon": "icon-magic", "menuname": "订座管理",
   		                 "menus": [
   		                     {"menuid": "12", "menuname": "订座管理", "icon": "icon-database", "url": "<%= __APP__%>/Dingzuo!dingzuo"}
   		                 ]},
   		              /*{"menuid": "1", "icon": "icon-magic", "menuname": "排队管理",
   	   		                 "menus": [
   	   		                     {"menuid": "12", "menuname": "排队管理", "icon": "icon-database", "url": "<%= __APP__%>/Dingzuo!dingzuo2"}
   	   		                 ]},*/
   	             {"menuid": "56", "icon": "icon-role", "menuname": "用户管理",
   	                 "menus": [
   	                     {"menuid": "31", "menuname": "用户会员列表", "icon": "icon-users", "url": "<%= __APP__%>/User!user"}
   	                 ]
   	
   	             }
   	         ]};
    }else if(roletype == "3"){
    	_menus = {
      	         "menus": [
      	             {"menuid": "1", "icon": "icon-magic", "menuname": "菜品管理",
      	                 "menus": [
      	                     {"menuid": "12", "menuname": "菜品列表", "icon": "icon-database", "url": "<%= __APP__%>/Good!good"}
      	                 ]},
      	                 {"menuid": "1", "icon": "icon-magic", "menuname": "桌号管理",
      	   	                 "menus": [
      	   	   	                     {"menuid": "12", "menuname": "桌号列表", "icon": "icon-database", "url": "<%= __APP__%>/Room!room"}
      	   	   	                 ]}, 
      	             {"menuid": "1", "icon": "icon-magic", "menuname": "类别管理",
      	                 "menus": [
      	                     {"menuid": "12", "menuname": "类别列表", "icon": "icon-database", "url": "<%= __APP__%>/Good!type"}
      	                 ]},
      	      
      	             {"menuid": "1", "icon": "icon-magic", "menuname": "订单管理",
      	                 "menus": [
      	                     {"menuid": "12", "menuname": "订单管理", "icon": "icon-database", "url": "<%= __APP__%>/Bill!bill3"}
      	                 ]},
      	          
      	                 {"menuid": "1", "icon": "icon-magic", "menuname": "订座管理",
      		                 "menus": [
      		                     {"menuid": "12", "menuname": "订座管理", "icon": "icon-database", "url": "<%= __APP__%>/Dingzuo!dingzuo"}
      		                 ]}
      	         ]};
    }else if(roletype == "4"){
    	_menus = {
     	         "menus": [
     	             
     	             {"menuid": "1", "icon": "icon-magic", "menuname": "订单管理",
     	                 "menus": [
     	                     {"menuid": "12", "menuname": "订单管理", "icon": "icon-database", "url": "<%= __APP__%>/Bill!bill4"}
     	                 ]},
     	            {"menuid": "1", "icon": "icon-magic", "menuname": "采购管理",
  	                     "menus": [
                           {"menuid": "12", "menuname": "采购列表", "icon": "icon-database", "url": "<%= __APP__%>/Notice!notice"}
  	                     ]}
     	         ]};
   }
	     
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
<noscript>
    <div
            style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
        <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！'/>
    </div>
</noscript>

<div region="south" split="true"
     style="height: 30px;">
    <div>
        <table width="100%">
            <tr>
                <td style="width: 50%;padding-right: 50px;" align="right">
                    <%=session.getAttribute("username").toString() %>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                        href="<%=__APP__ %>/Index!logout">退出</a>
                </td>
                <td style="width: 30%" align="right">
                    
                </td>
            </tr>
        </table>

    </div>
</div>
<div region="west" hide="true" split="true" title="导航菜单"
     style="width: 180px;" id="west">
    <div id="nav" class="easyui-accordion" fit="true" border="false">
        <!--  导航内容 -->

    </div>
</div>
<div id="mainPanle" region="center"
     style="background: #eee; overflow-y: hidden">
    <div id="tabs" class="easyui-tabs" fit="true" border="false">
        <div title="欢迎使用" style="padding: 0px; color: red; overflow: hidden;"
             closable="true">
            <iframe src="<%=__APP__ %>/User!user" id="iframepage" name="iframepage"
                    frameBorder=0 width="100%" height="100%" onLoad=""></iframe>
        </div>
    </div>
</div>
<div region="east" collapsed="true" id="datetool" title="日历"
     split="true" style="width: 180px; overflow: hidden;">
    <div class="easyui-calendar"></div>
    <embed width="160" height="70" align="middle" pluginspage="http://www.macromedia.com/go/getflashplayer"
           type="application/x-shockwave-flash" allowscriptaccess="always" name="honehoneclock" bgcolor="#ffffff"
           quality="high" src="<%=__APP__ %>/public/swf/honehone_clock_wh.swf" wmode="transparent">
    </embed>
</div>

<!--修改密码窗口-->

<div id="mm" class="easyui-menu" style="width: 150px;">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseall">全部关闭</div>
    <div id="mm-tabcloseother">除此之外全部关闭</div>
    <div class="menu-sep"></div>
    <div id="mm-tabcloseright">当前页右侧全部关闭</div>
    <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
</div>
</body>
</html>