<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>会议管理系统</title>
</head>
<style>
    .table > tbody > tr > th {
        padding: 0px !important;
    }
</style>
<body>
<jsp:include page="top.jsp"/>
<!-- banner -->
<div class="banner about-banner">
    <div class="header about-header">
        <div th:replace="/common/Common::Header"></div>
    </div>
    <div class="about-heading">
        <div class="container">
            <h2>Employees Register<span style="font-weight:100; font-size: 36px;">添加用户</span></h2>
        </div>
    </div>
</div>
<div class="blog">
    <div class="container">
        <div class="blog-top-grids">
            <div class="col-md-4 blog-top-right-grid">
                <jsp:include page="leftMenu.jsp"/>
            </div>
            <div class="col-md-8 blog-top-left-grid">
                <ol class="breadcrumb">
                    <li><a href="#">人员管理</a></li>
                    <li><a href="#">添加用户</a></li>
                </ol>
                <form method="post" action="/meeting/doreg">
                    <h3>用户信息</h3>
                    <c:if test="${error!=null}">
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </c:if>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>姓名</label>
                                <input id="employeename" name="employeename" type="text" class="form-control"
                                       placeholder="不能为空" maxlength="20"/>
                            </div>
                            <div class="form-group">
                                <label>学工号</label>
                                <input id="accountname" name="accountname" type="text" class="form-control"
                                       placeholder="不能为空" maxlength="20"/>
                            </div>
                            <div class="form-group">
                                <label>所在部门</label>
                                <select class="form-control" name="deptid">
                                    <c:forEach items="${list}" var="dep">
                                        <option value="${dep.departmentid}">${dep.departmentname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>联系电话</label>
                                <input id="phone" name="phone" type="number" class="form-control" maxlength="20"/>
                            </div>
                            <div class="form-group">
                                <label>电子邮件</label>
                                <input id="email" name="email" type="email" class="form-control" maxlength="20"/>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success" value="注册"/>
                    <input type="reset" class="btn btn-danger" value="重置"/>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
