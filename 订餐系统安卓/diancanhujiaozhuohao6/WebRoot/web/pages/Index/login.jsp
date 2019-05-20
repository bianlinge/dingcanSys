<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head id="Head1">
<%@ include file="/web/common/common.jsp"%>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>餐厅点餐</title>
<style type="text/css">

        body{
            //background: url('__PUBLIC__/images/login/backgroud.png');
            background: #f2f2f2;
            padding: 0;
            margin: 0;
        }
        .logindialog{
            width:362px;
            height: 450px;
            box-shadow: 0px 0px 50px #333333;
            background-color: #FEFEFE;

            position: fixed;
            margin: auto;
            bottom: 0;
            left: 0;
            right: 0;
            top: 0;
        }
        .topimg{
            position: relative;
            left: 110px;
            top: 30px;
            display: block;
        }
        .logintext{
            position: relative;
            left: 115px;
            top: 50px;
            font-size: 22pt;
            color: #5E7782;
        }
        .inputline{
            background-color: #f2f2f2;
            font-size: 18pt;
            display: inline;
        }

        .inputline:focus{
            outline: none;
            background-color:#fefefe;
        }

        .loginimg{
            width: 26px;
            height: 26px;
            display: inline;
            position: relative;
            top:5px;
        }

        .passline{
            width: 270px;
            display: inline-block;
        }

        .inputare{
            position: absolute;
            top: 200px;
            left: 20px;
            width: 300px;
            height: 80px;
        }
        .inputcontent{
            padding: 2px;
            overflow: hidden;
            width: 315px;
            height: 55px;
            margin-bottom: 15px;
        }

        .inputcontent input{
            width: 94%;
            margin-left: 3%;
            height: 40px;
            background-color: #f2f2f2;
            border: 1px #fff solid;
            border-radius: 5px;
            outline: none;
        }

        .btnred{
            display: block;
            text-align: center;
            line-height: 50px;
            color: #fff;
            width: 94%;
            height: 50px;
            background-color: #EF3B3A;
            border-radius: 5px;
            margin: 0 auto;
            text-decoration: none;
        }

        .register{
            position: absolute;
            top: 310px;
            left: 280px;
            color: #5E7782;
            cursor: pointer;
        }





        @-webkit-keyframes shake {
        0%, 100% {-webkit-transform: translateX(0);}
        10%, 30%, 50%, 70%, 90% {-webkit-transform: translateX(-10px);}
        20%, 40%, 60%, 80% {-webkit-transform: translateX(10px);}
        }

        @-moz-keyframes shake {
        0%, 100% {-moz-transform: translateX(0);}
        10%, 30%, 50%, 70%, 90% {-moz-transform: translateX(-10px);}
        20%, 40%, 60%, 80% {-moz-transform: translateX(10px);}
        }

        @-o-keyframes shake {
        0%, 100% {-o-transform: translateX(0);}
        10%, 30%, 50%, 70%, 90% {-o-transform: translateX(-10px);}
        20%, 40%, 60%, 80% {-o-transform: translateX(10px);}
        }

        @keyframes shake {
            0%, 100% {transform: translateX(0);}
            10%, 30%, 50%, 70%, 90% {transform: translateX(-10px);}
            20%, 40%, 60%, 80% {transform: translateX(10px);}
        }

        .redround{
            width: 150px;
            height: 150px;
            border-radius: 75px;
            background-color: #EF3B3A;
            margin: 40px auto;
            text-align: center;
            line-height: 150px;
        }

        .shake {
            -webkit-animation-name: shake;
            -moz-animation-name: shake;
            -o-animation-name: shake;
            -webkit-animation-duration: .5s;
            -moz-animation-duration: .5s;
            -o-animation-duration: .5s;
            animation-name: shake;
            animation-duration: .5s;
        }


        .zoom {
            -webkit-animation-name: zoom;
            -webkit-animation-duration: 20000ms;
            -webkit-animation-timing-function: linner;
            -webkit-animation-iteration-count:infinite;

            -o-animation-name: zoom;
            -o-animation-duration: 20000ms;
            -o-animation-timing-function: linner;
            -o-animation-iteration-count:infinite;

            -moz-animation-name: zoom;
            -moz-animation-duration: 20000ms;
            -moz-animation-timing-function: linner;
            -moz-animation-iteration-count:infinite;

            animation-name: zoom;
            animation-duration: 20000ms;
            animation-timing-function: linner;
            animation-iteration-count:infinite;
        }
        @-webkit-keyframes zoom {
            0% {
                -webkit-transform: scale3d(1,1,1);
            }
            5% {
                -webkit-transform: scale3d(1.5,1.5,1);
            }
            100% {
                -webkit-transform: scale3d(1.8,1.8,1);
            }
        }
        @-moz-keyframes zoom {
            0% {
                -moz-transform: scale3d(1,1,1);
            }
            5% {
                -moz-transform: scale3d(1.5,1.5,1);
            }
            100% {
                -moz-transform: scale3d(1.8,1.8,1);
            }
        }
        @-o-keyframes zoom {
            0% {
                -o-transform: scale3d(1,1,1);
            }
            5% {
                -o-transform: scale3d(1.5,1.5,1);
            }
            100% {
                -o-transform: scale3d(1.8,1.8,1);
            }
        }

        @keyframes zoom {
            0% {
                transform: scale3d(1,1,1);
            }
            5% {
                transform: scale3d(1.5,1.5,1);
            }
            100% {
                transform: scale3d(1.8,1.8,1);
            }
        }
    </style>
<script type="text/javascript">

if(top.location!=self.location) top.location=self.location;

var loginuserinfo =  localStorage["loginuserinfo"];
var isremember = localStorage['isremember'];

if(loginuserinfo){
    var info = JSON.parse(loginuserinfo);
    $("#passwd").val(info.passwd);
    $("#username").val(info.username);
}

if(isremember=="1"){
    $("#remember").attr("checked","checked");
}

document.onkeydown=function (e){
    e = e ? e : event;
    if(e.keyCode == 13){
        login();
    }
};
    function login() {
        var username = $("#username").val();
        var passwd = $("#passwd").val();
        if(trim(username) == "" || trim(passwd) == ""){
            //$.messager.alert("提示", '请输入user name和密码！');
            $("#logindialog").addClass("shake");
            setTimeout(function(){
                $("#logindialog").removeClass("shake");
            },500);
            return;
        }
        $("#logindialog").addClass("zoom");
        $("#loginimg").hide();
        $.post(__APP__+"/Index!login",{username:username,passwd:passwd},function(data){
            closeBackGround();
            //data = JSON.parse(data);
            if (data != "success") {
                $("#logindialog").removeClass("zoom");
                $("#logindialog").addClass("shake");
                setTimeout(function(){
                    $("#logindialog").removeClass("shake");
                },500);
                //$.messager.alert("提示", 'user name或密码错误！');
                $("#loginimg").show();
            } else {
                //$.messager.alert("提示", '登录成功！');
                var flag = $("#remember").is(":checked");
                if(flag){
                    var loginobj = {};
                    loginobj.username = username;
                    loginobj.passwd = passwd;
                    localStorage["loginuserinfo"] = JSON.stringify(loginobj);
                    localStorage["isremember"] = "1";
                }else{
                    localStorage.removeItem("loginuserinfo");
                    localStorage.removeItem("isremember");
                }
                window.location.href = __APP__+"/Index!index";
            }
        });
    }


        </script>
</head>
<body>
    <h2 style="text-align: center;margin: 50px auto;width: 250px;font-weight: normal;font-size: 32px;color: #666;">餐厅点餐</h2>
    <div class="logindialog" id="logindialog">
        <!--<img class="topimg" src="__PUBLIC__/images/login/cloude.png" width="130px" height="84px">-->
        <div class="redround" style="background-image: url('<%=__APP__%>/web/public/images/login/logo2.jpeg');background-size: 100% 100%;">
            <!--<img src="__PUBLIC__/images/login/kk.png" width="100px" style="margin-top: 45px">-->
        </div>
        <!--<span class="logintext">KK Malaysian Restaurant</span>-->
            <div class="inputare" id="inputare">
                <div class="inputcontent">
                    <input id="username" placeholder="用户名" type="text">
                </div>
                <div class="inputcontent">
                    <input id="passwd" placeholder="密码" type="password">
                </div>
                <div class="inputcontent">
                    <a href="#" onclick="login();" class="btnred">登陆</a>
                </div>
            </div>
        <!--<span id="regist" class="register">注册</span>-->
    </div>
</body>
</html>