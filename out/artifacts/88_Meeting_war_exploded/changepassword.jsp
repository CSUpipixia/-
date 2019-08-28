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
            <h2>Login <span style="font-weight:100; font-size: 36px;">修改密码</span></h2>
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
                <form method="post" action="/meeting/dochangepassword">
                    <h3>修改密码</h3>
                    <c:if test="${error!=null}">
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </c:if>
                    <div class="form-group">
                        <label>原密码</label>
                        <input id="origin" name="origin" type="text" type="text" class="form-control"
                               placeholder="请输入您的原密码"/>
                    </div>
                    <div class="form-group">
                        <label>新密码</label>
                        <input id="new" name="new" type="password" type="text" class="form-control"
                               placeholder="请输入您的新密码"/>
                    </div>
                    <div class="form-group">
                        <label>新密码</label>
                        <input id="confirm" name="confirm" type="password" type="text" class="form-control"
                               placeholder="请再次输入您的新密码"/>
                    </div>
                    <input type="submit" class="btn btn-success" value="确定 OK"/>
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

