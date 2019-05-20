<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
<head id="Head1">
    <%@ include file="/web/common/common.jsp" %>
<script type="text/javascript">
$(function () {
    $('#grid1').datagrid({
        title: '订单列表',
        nowrap: false,
        striped: true,
        fit: true,
        url: "<%=__APP__%>/Bill!getList",
        idField: 'id',
        pagination: true,
        rownumbers: true,
        pageSize: 10,
        pageNumber: 1,
        singleSelect: true,
        fitColumns: true,
        pageList: [10, 20, 50, 100, 200, 300, 500, 1000],
        sortName: 'id',
        sortOrder: 'desc',
        onLoadSuccess:function(){
        	var rows = $('#grid1').datagrid('getRows');//获取当前的数据行
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += rows[i]['total']*1;
            }
            $("#shouyi").text("总收益:"+total+"元");
        },
        columns: [
            [
                //{field: 'ck', checkbox: true},
                {title: '订单编号', width: 50, field: 'id', sortable: true},
                {title: '名称', width: 300, field: 'gnames', sortable: true},
                {title: '桌号', width: 300, field: 'address', sortable: true},
                //{title: '订单方式', width: 100, field: 'way', sortable: true},
                {title: '总价', width: 100, field: 'total', sortable: true},
                {title: '用户', width: 50, field: 'user',sortable: true},
                {title: '电话', width: 50, field: 'tel',sortable: true},
                {title: '备注', width: 200, field: 'note',sortable: true},
                {title: '时间', width: 100, field: 'ndate',sortable: true},
                //{title: '催单状态', width: 100, field: 'cuidan',sortable: true},
                {title: '状态', width: 200, field: 'statecn',sortable: true}
            ]
        ]
         , toolbar: [
            {
                text: '开台',
                id: "tooladd",
                disabled: false,
                iconCls: 'icon-add',
                handler: function () {
                    $("#action").val("add");
                    $("#managerDialog").dialog('open');
                    managForm.reset();
                }
            },
            {
                text: '退单',
                id: "tooladd",
                disabled: false,
                iconCls: 'icon-edit',
                handler: function () {
                	var selected = $('#grid1').datagrid('getSelected');
                    if (selected) {
                        $.post("<%=__APP__%>/Bill!jiaohao",{bid:selected.id,statecn:"退单"},function(){
                        	closeFlush();
                        });
                    } else {
                        $.messager.alert("提示", "请选择一条记录进行操作");
                    }
                }
            },
            '-',
            {
                text: '配餐中',
                id: 'tooledit',
                disabled: false,
                iconCls: 'icon-edit',
                handler: function () {
                    $("#action").val("edit");
                    var selected = $('#grid1').datagrid('getSelected');
                    if (selected) {
                        $.post("<%=__APP__%>/Bill!jiaohao",{bid:selected.id,statecn:"配餐中"},function(){
                        	closeFlush();
                        });
                    } else {
                        $.messager.alert("提示", "请选择一条记录进行操作");
                    }
                }
            },
            '-',{
                text: '送餐中',
                id: 'tooledit',
                disabled: false,
                iconCls: 'icon-edit',
                handler: function () {
                    $("#action").val("edit");
                    var selected = $('#grid1').datagrid('getSelected');
                    if (selected) {
                        $.post("<%=__APP__%>/Bill!jiaohao",{bid:selected.id,statecn:"送餐中"},function(){
                        	closeFlush();
                        });
                    } else {
                        $.messager.alert("提示", "请选择一条记录进行操作");
                    }
                }
            },
            '-',{
                text: '完成',
                id: 'tooledit',
                disabled: false,
                iconCls: 'icon-edit',
                handler: function () {
                    $("#action").val("edit");
                    var selected = $('#grid1').datagrid('getSelected');
                    if (selected) {
                        $.post("<%=__APP__%>/Bill!jiaohao",{bid:selected.id,statecn:"完成"},function(){
                        	closeFlush();
                        });
                    } else {
                        $.messager.alert("提示", "请选择一条记录进行操作");
                    }
                }
            } ,
            '-',
            {
                text: '删除',
                id: 'tooldel',
                disabled: false,
                iconCls: 'icon-remove',
                handler: function () {
                    var rows = $('#grid1').datagrid('getSelections');
                    if (rows.length) {
                        var ids = "";
                        for (var i = 0; i < rows.length; i++) {
                            ids += rows[i].id + ",";
                        }
                        ids = ids.substr(0, (ids.length - 1));
                        $.messager.confirm('提示', '确定要删除吗？', function (r) {
                            if (r) {
                                deleteItem(ids);
                            }
                        });
                    } else {
                        $.messager.alert("提示", "请选择一条记录进行操作");
                    }
                }
            }
        ] 
    });

    document.onkeydown=function (e){
        e = e ? e : event;
        if(e.keyCode == 13){
            query();
        }
    }

    $("#gids").combobox({
        method:"get",
        url:'<%=__APP__%>/Good!goodList',
        valueField: 'id',
        textField: 'gname',
        multiple:true
    });
});

function save() {
	var gnames = $("#gids").combobox("getText");
	$("#gnames").val(gnames);
    $('#managForm').form('submit', {
        url: "<%=__APP__%>/Bill!add",
        onSubmit: function () {
            return inputCheck();
        },
        success: function (data) {
            closeBackGround();
            $.messager.alert("提示", data, "info", function () {
                closeFlush();
            });
        }
    });
}

function edit(obj) {
	var id = obj.id;
    $("#id").val(id);
    $("#gname").val(obj.gname);
    $("#type").combobox("setValue", obj.type);
    $("#price").numberbox('setValue', obj.price);
    $("#count").numberbox('setValue', obj.count);
    $("#jifen").numberbox('setValue', obj.jifen);
    $("#note").val(obj.note);
    $("#managerDialog").dialog('open');
}

function deleteItem(uuid) {
    openBackGround();
    $.post("<%=__APP__%>/Bill!deleteItem", {id: uuid}, function (data) {
        closeBackGround();
        closeFlush();
    });
}

function cancel() {
    $.messager.confirm('提示', '是否要关闭？', function (r) {
        if (r) {
            closeFlush();
        }
    });
}

function query() {
    $('#grid1').datagrid('load', serializeObject($('#searchForm')));
}


function closeFlush() {
    //managForm.reset();
    $("#managerDialog").dialog('close');
    $("#grid1").datagrid("reload");
}

function inputCheck() {
    if (!($("#managForm").form("validate"))) {
        return false;
    }
    openBackGround();
    return true;
}

function show(index) {

    var rows = $("#grid1").datagrid('getRows');
    var obj = rows[index];
    var id = obj.id;
    $("#id2").text(obj.id);
    $("#gname2").text(obj.gname);
    $("#gbrand2").text(obj.gbrand);
    $("#intime2").text(obj.intime);
    $("#gmodel2").text(obj.gmodel);
    $("#gcolor2").text(obj.gcolor);
    $("#gprice2").text(obj.gprice);
    $("#note2").text(obj.note);
    $("#gnumber2").text(obj.gnumber);

    $("#viewDialog").dialog('open');
    //});
}


function setNull(){
    searchForm.reset();
    $("#sgname").datebox("setValue","");
}



</script>
</head>
<body class="easyui-layout">
<div region="north" border="false" style="height:3px;overflow: hidden"></div>
<div region="west" border="false" style="width:3px;"></div>
<div region="east" border="false" style="width:3px;"></div>
<div region="south" border="false" style="height:3px;overflow: hidden"></div>
<div region="center" border="false">
    <div id="main" class="easyui-layout" fit="true" style="width:100%;height:100%;">
        <div region="north" id="" style="height:100%;" class="" title="查询条件">
            <form action="" id="searchForm" name="searchForm" method="post">
                <table cellpadding="5" cellspacing="0" class="tb_search">
                    <tr>
                        <td width="10%">
                            <label for="sgname">订单时间：</label>
                            <input type="text" id="sgname" name="sgname" class="easyui-datebox" width="100%" maxlength="32"/>
                        </td>
                        <td width="10%">
                            <label id="shouyi" style="font-size: 20px;color:red;"></label>
                        </td>
                        <td width="10%">
                            <a href="#" onclick="query();" id="querylink" class="easyui-linkbutton"
                               iconCls="icon-search">查询</a>
                            <a href="#" onclick="setNull();" class="easyui-linkbutton" iconCls="icon-redo">重置</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div region="center" border="false" style="padding:3px 0px 0px 0px;overflow:hidden">

            <table id="grid1"></table>

        </div>
    </div>
</div>




<div id="managerDialog" class="easyui-dialog" title="开台管理" style="width:650px;height:350px;" toolbar="#dlg-toolbar"
     buttons="#dlg-buttons2" resizable="true" modal="true" closed='true'>
    <form id="managForm" name="managForm" method="post">
        <input type="hidden" id="action" name="action"/>
        <input type="hidden" id="id" name="id"/>
         <input type="hidden" id="gnames" name="bill.gnames"/>
        <table cellpadding="1" cellspacing="1" class="tb_custom1">
            <tr>
                <th width="30%" align="right"><label>客户：</label></th>
                <td width="30%">
                    <input id="user" name="bill.user" class="easyui-validatebox"
                           style="width:200px;word-wrap: break-word;word-break:break-all;" type="text" required="true"
                           validType="length[0,100]"/>
                </td>
                <th width="30%" align="right"><label>菜品：</label></th>
                <td width="30%">
                    <input id="gids" name="bill.gids" style="width:200px;word-wrap: break-word;word-break:break-all;" />
                </td>
            </tr>
            
			<tr>
                <th width="30%" align="right"><label>桌号：</label></th>
                <td width="30%" colspan="3">
                    <input id="address" name="bill.address" style="width:200px;word-wrap: break-word;word-break:break-all;" />
              
                </td>
            </tr>

            <tr>
                <th width="30%" align="right"><label>电话：</label></th>
                <td colspan="" width="30%">
                    <input type="text" name="bill.tel" id="tel" style="width:200px;word-wrap: break-word;word-break:break-all;"/>
                </td>
                <th width="30%" align="right"><label>总价：</label></th>
                <td width="30%">
                    <input id="total" name="bill.total" class="easyui-numberbox"
                           style="width:200px;word-wrap: break-word;word-break:break-all;" type="text" required="true"
                           validType="length[0,9]"/>
                </td>
            </tr>
		
            <tr>
                <th width="30%" align="right"><label>备注：</label></th>
                <td colspan="3" width="30%">
                    <textarea rows="" cols="" style="width:100%" id="note" name="bill.note"></textarea>
                </td>
            </tr>
        </table>


    </form>
    <div id="dlg-buttons2">
        <a href="#" class="easyui-linkbutton" onclick="save();">保存</a>
        <a href="#" class="easyui-linkbutton" onclick="cancel();">取消</a>
    </div>
</div> 


</body>
</html>