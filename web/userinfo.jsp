<%--
  Created by IntelliJ IDEA.
  User: 16198
  Date: 2019/8/30
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
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
            <h2>Employees Information<span style="font-weight:100; font-size: 36px;">我的信息</span></h2>
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
                <form method="post" action="/meeting/changeinfo">
                    <h3>用户信息</h3>
                    <c:if test="${error!=null}">
                        <div class="alert alert-danger" role="alert">${error}</div>
                    </c:if>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>姓名</label>
                                <input id="employeename" name="employeename" type="text" class="form-control"
                                       placeholder="${loginUser.getEmployeename()}" maxlength="20"/>
                            </div>
                            <div class="form-group">
                                <label>学工号</label>
                                <input id="accountname" name="accountname" type="text" class="form-control"
                                       placeholder="${loginUser.getUsername()}" maxlength="20"/>
                            </div>
                            <div class="form-group">
                                <label>所在部门</label>
                                <input id="departmentname" name="deppppname" type="text" class="form-control"
                                       placeholder="${departmentname}" maxlength="20"/>
                                <select class="form-control" name="newdeptid">
                                    <c:forEach items="${list}" var="dep">
                                        <option value="${dep.departmentid}">${dep.departmentname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>联系电话</label>
                                <input id="phone" name="phone" type="text" class="form-control"  placeholder="${loginUser.getPhone()}" maxlength="20"/>
                            </div>
                            <div class="form-group">
                                <label>电子邮件</label>
                                <input id="email" name="email" type="email" class="form-control" placeholder="${loginUser.getEmail()}" maxlength="20"/>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success" value="修改"/>
                    <%--<input type="reset" class="btn btn-danger" value="重置"/>--%>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
