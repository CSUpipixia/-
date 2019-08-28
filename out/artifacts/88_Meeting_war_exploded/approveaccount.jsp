<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>\
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
            <h2>Employees Register<span style="font-weight:100; font-size: 36px;">注册审批</span></h2>
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
                    <li><a href="">会议预定</a></li>
                    <li><a href="approveaccount">注册审批</a></li>
                </ol>
                <table class="table">
                    <h3>所有待审批注册信息</h3>
                    <tr>
                        <th>姓名</th>
                        <th>账号名</th>
                        <th>联系电话</th>
                        <th>电子邮件</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${list}" var="emp">
                        <tr>
                            <td>${emp.employeename}</td>
                            <td>${emp.username}</td>
                            <td>${emp.phone}</td>
                            <td>${emp.email}</td>
                            <td>
                                <a class="btn btn-success" href="/meeting/updateEmpStatus?status=1&empid=${emp.employeeid}">通过</a>
                                <a class="btn btn-danger" href="/meeting/updateEmpStatus?status=2&empid=${emp.employeeid}">不通过</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>