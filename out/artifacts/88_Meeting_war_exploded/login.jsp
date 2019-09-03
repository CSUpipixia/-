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
<%--<jsp:include page="top.jsp"/>--%>
<%--<!-- banner -->--%>
<%--<div class="banner about-banner">--%>
    <%--<div class="header about-header">--%>
        <%--<div th:replace="/common/Common::Header"></div>--%>
    <%--</div>--%>
    <%--<div class="about-heading">--%>
        <%--<div class="container">--%>
            <%--<h2>Login <span style="font-weight:100; font-size: 36px;">登录</span></h2>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<!-- //banner -->
<%--<div class="blog">--%>
<div class="login-wrapper">
    <!-- container -->
    <%--<div class="container">--%>
        <%--<div class="blog-top-grids">--%>
            <%--<div class="col-md-4 blog-top-right-grid">--%>
                <%--<jsp:include page="leftMenu.jsp"/>--%>
            <%--</div>--%>
            <%--<div class="col-md-4">--%>
                <%--<form method="post" action="/meeting/login">--%>
                    <%--<h3>登录信息</h3>--%>
                    <%--<c:if test="${error!=null}">--%>
                        <%--<div class="alert alert-danger" role="alert">${error}</div>--%>
                    <%--</c:if>--%>
                    <%--<div class="form-group">--%>
                        <%--<label>账号名 ID</label>--%>
                        <%--<input id="accountname" name="accountname" type="text" type="text" class="form-control"--%>
                               <%--placeholder="请输入您的教职工账号"/>--%>
                        <%--* 账号为您的教职工账号--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label>密码</label>--%>
                        <%--<input id="new" name="password" type="password" type="text" class="form-control"--%>
                               <%--placeholder="请输入您的密码"/>--%>
                        <%--* 原始密码为123456，请及时修改--%>
                    <%--</div>--%>
                    <%--<input type="submit" class="btn btn-success" value="登录 Login"/>--%>
                    <%--<input type="button" class="btn btn-success" value="注册 Register"--%>
                           <%--onclick="window.location.pathname='/meeting/reg'"/>--%>
                <%--</form>--%>
            <%--</div>--%>
            <%--<div class="col-md-4 blog-top-left-grid"></div>--%>
            <%--<div class="clearfix"></div>--%>
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
    <!-- //container -->
</div>
<%--<jsp:include page="footer.jsp"/>--%>

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
            // error: function() {
            //     alert("系统错误，请稍后重试！");
            //     return false;
            error: function(err) {
                alert(err);
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
