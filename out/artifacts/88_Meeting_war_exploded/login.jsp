<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>会议管理系统</title>
</head>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="http://apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- //banner -->
<div class="login-wrapper">
    <!-- container -->
    <div class="login">
        <div class="projectName">
            <span>会议室管理系统</span>
        </div>
            <ul class="login-list">
                <c:if test="${error!=null}">
                    <li>
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </li>
                </c:if>
                <li>
                    <input id="accountname" name="accountname" type="text" placeholder="请输入您的账号"/>
                </li>
                <li>
                    <input id="password" name="password" type="password" placeholder="请输入您的密码"/>
                </li>
                <li>
                    <input type="submit" class="btn" onclick="login()" value="登录 Login"/>
                </li>
                <li>
                    没有账号, <a href="javascript:void(0)" onclick="window.location.pathname='/meeting/reg'" class="tar">立即注册！</a>
                </li>
            </ul>
    </div>
</div>
</body>
</html>

<script>
    function login() {
        var accountname = $("#accountname").val();
        var password = $("#password").val();
        $.ajax({
            url: '/meeting/login',
            type: 'post',
            data: {accountname: accountname, password: password},
            success: function(res) {
                window.location.pathname='/meeting/notifications';
            },
            error: function(err) {
                alert(err);
                return false;
            },
        })
    }
</script>

<style>
    .login-wrapper {
        position: fixed;
        top: 0;
        left: 0;
        background: url('images/bj.jpg') no-repeat center fixed;
        background-size: cover;
        overflow: hidden;
        width: 100%;
        height: 100%;
    }

    .login {
        width: 400px;
        height: 345px;
        background: rgba(0, 0, 0, 0.3);
        border-radius: 5px;
        position: absolute;
        left: 50%;
        top: 50%;
        margin: -172px 0 0 -200px;
    }
    .projectName {
        width: 50%;
        margin: 30px auto 30px;
        font-size: 18px;
        color: #fff;
        text-align: center;
    }
    .login-list {
        width: 90%;
        margin: 0 auto;
    }
    ul {
        list-style: none;
    }
    li {

        list-style: none;
        margin-bottom: 15px;
    }
    input {
        padding: 13px 10px;
        border: 1px solid #e6e6e6;
        border-radius: 3px;
        font-size: 14px;
        width: 100%;
    }
    .btn {
        width: 100%;
        height: 45px;
        line-height: 45px;
        text-align: center;
        background: #17b5a6;
        font-size: 16px;
        color: #fff;
        display: block;
        border-radius: 3px;
    }
    .tar:hover {
        color: #fff;
    }
</style>

