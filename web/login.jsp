<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>会议管理系统</title>
</head>
<body>
<jsp:include page="top.jsp"/>
<!-- banner -->
<div class="banner about-banner">
    <div class="header about-header">
        <div th:replace="/common/Common::Header"></div>
    </div>
    <div class="about-heading">
        <div class="container">
            <h2>Login <span style="font-weight:100; font-size: 36px;">登录</span></h2>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="blog">
    <!-- container -->
    <div class="container">
        <div class="blog-top-grids">
            <div class="col-md-4 blog-top-right-grid">
                <jsp:include page="leftMenu.jsp"/>
            </div>
            <div class="col-md-4">
                <form method="post" action="/meeting/login">
                    <h3>登录信息</h3>
                    <c:if test="${error!=null}">
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </c:if>
                    <div class="form-group">
                        <label>账号名 ID</label>
                        <input id="accountname" name="accountname" type="text" type="text" class="form-control"
                               placeholder="请输入您的教职工账号"/>
                        * 账号为您的教职工账号
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input id="new" name="password" type="password" type="text" class="form-control"
                               placeholder="请输入您的密码"/>
                        * 原始密码为123456，请及时修改
                    </div>
                    <input type="submit" class="btn btn-success" value="登录 Login"/>
                    <input type="button" class="btn btn-success" value="返回 Back"
                           onclick="window.history.back();"/>
                </form>
            </div>
            <div class="col-md-4 blog-top-left-grid"></div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //container -->
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
