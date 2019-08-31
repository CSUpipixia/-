<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h2>Search Employees <span style="font-weight:100; font-size: 36px;">搜索用户</span></h2>
        </div>
    </div>
</div>
<div class="blog">
    <!-- container -->
    <div class="container">
        <div class="blog-top-grids">
            <div class="col-md-4 blog-top-right-grid">
                <jsp:include page="leftMenu.jsp"/>
            </div>
            <div class="col-md-8 blog-top-left-grid">
                <ol class="breadcrumb">
                    <li><a href="bookmeeting">会议预定</a></li>
                    <li><a href="serachemp">搜索用户</a></li>
                </ol>
                <form action="/meeting/serachemp" method="post">
                    <h3>搜索用户</h3>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>姓名</label>
                                <input id="employeename" name="employeename" type="text" class="form-control"
                                       value="${employeename}"
                                       maxlength="20"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>账号名</label>
                                <input id="accountname" name="username" type="text" class="form-control"
                                       value="${username}" maxlength="20"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>状态</label>
                                <div>
                                <c:choose>
                                    <c:when test="${status==0}">
                                        <input type="radio" id="status" name="status" value="1"
                                        /><label>已批准</label>
                                        <input checked="checked" type="radio" id="status" name="status"
                                               value="0"/><label>待审批</label>
                                        <input type="radio" id="status" name="status" value="-1"/><label>已关闭</label>
                                    </c:when>
                                    <c:when test="${status==1}">
                                        <input type="radio" checked="checked" id="status" name="status" value="1"
                                        /><label>已批准</label>
                                        <input type="radio" id="status" name="status" value="0"/><label>待审批</label>
                                        <input type="radio" id="status" name="status" value="-1"/><label>已关闭</label>
                                    </c:when>
                                    <c:when test="${status==-1}">
                                        <input type="radio" id="status" name="status" value="1"
                                        /><label>已批准</label>
                                        <input type="radio" id="status" name="status" value="0"/><label>待审批</label>
                                        <input type="radio" checked="checked" id="status" name="status"
                                               value="-1"/><label>已关闭</label>
                                    </c:when>
                                </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success" value="查询"/>
                    <input type="reset" class="btn btn-danger" value="重置"/>
                </form>
                <div>
                    <h3 style="text-align:center;color:black">查询结果</h3>
                </div>
                <table class="table">
                    <tr>
                        <th>姓名</th>
                        <th>账号名</th>
                        <th>联系电话</th>
                        <th>电子邮件</th>
                        <th>信誉积分</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${list}" var="emp">
                        <tr>
                            <td>${emp.employeename}</td>
                            <td>${emp.username}</td>
                            <td>${emp.phone}</td>
                            <td>${emp.email}</td>
                            <td>${emp.credits}</td>
                            <td>
                                <c:if test="${emp.status==1}">
                                    <form method="post" action="/meeting/serachemp">
                                        <input class="form-control" type="hidden" name="employeename"
                                               value="${employeename}">
                                        <input class="form-control" type="hidden" name="username" value="${username}">
                                        <input class="form-control" type="hidden" name="status" value="${status}">
                                        <input class="form-control" type="hidden" name="updateStatus" value="-1">
                                        <input class="form-control" type="hidden" name="empid" value="${emp.employeeid}">

                                        <input class="btn btn-danger btn-sm" value="关闭账号" type="submit"></input>

                                    </form>
                                </c:if>
                                <c:if test="${emp.status==-1}">
                                    <form method="post" action="/meeting/serachemp">
                                        <input class="form-control" type="hidden" name="employeename"
                                               value="${employeename}">
                                        <input class="form-control" type="hidden" name="username" value="${username}">
                                        <input class="form-control" type="hidden" name="status" value="${status}">
                                        <input class="form-control" type="hidden" name="updateStatus" value="1">
                                        <input class="form-control" type="hidden" name="empid" value="${emp.employeeid}">

                                        <c:if test="${emp.status==-1}">
                                            <input class="btn btn-success btn-sm" value="激活账号" type="submit"></input>
                                        </c:if>
                                    </form>
                                </c:if>

                                <form method="post" action="/meeting/resetcredits">
                                    <input class="form-control" type="hidden" name="eid" value="${emp.employeeid}">
                                    <input class="btn btn-warning btn-sm" value="重置积分" type="submit"></input>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div style="text-align: center">共<span class="info-number">${totalCount}</span>条结果，
                    分成<span class="info-number">${totalPage}</span>页显示，
                    当前第<span class="info-number">${page}</span>页
                    <a type="button" class="btn btn-info btn-xs"
                       href="/meeting/serachemp?page=1&status=${status}&employeename=${employeename}&username=${username}">首页</a>
                    <c:choose>
                        <c:when test="${page>1}">
                            <a type="button" class="btn btn-info btn-xs"
                               href="/meeting/serachemp?page=${page-1}&status=${status}&employeename=${employeename}&username=${username}">上页</a>
                        </c:when>
                        <c:otherwise>
                            <a type="button" class="btn btn-info btn-xs">上页</a>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${page<totalPage}">
                            <a type="button" class="btn btn-info btn-xs"
                               href="/meeting/serachemp?page=${page+1}&status=${status}&employeename=${employeename}&username=${username}">下页</a>
                        </c:when>
                        <c:otherwise>
                            <a type="button" class="btn btn-info btn-xs">下页</a>
                        </c:otherwise>
                    </c:choose>
                    <a type="button" class="btn btn-info btn-xs"
                       href="/meeting/serachemp?page=${totalPage}&status=${status}&employeename=${employeename}&username=${username}">末页</a>
                    <form action="/meeting/serachemp" method="post" style="display: inline">
                        <input class="form-control" type="hidden" name="employeename" value="${employeename}">
                        <input class="form-control" type="hidden" name="username" value="${username}">
                        <input class="form-control" type="hidden" name="status" value="${status}">
                        跳到第
                        <input class="form-control" style="width:20px;height:25px;display:initial;" type="text"
                               id="pagenum" name="page" class="nav-number"/>
                        页
                        <input type="submit" class="btn btn-info btn-xs" value="跳转"/>
                    </form></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //container -->
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>