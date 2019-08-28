<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h2>My Bookings <span style="font-weight:100; font-size: 36px;">我的预订</span></h2>
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
            <div class="col-md-8 blog-top-left-grid">
                <ol class="breadcrumb">
                    <li><a href="#">个人中心</a></li>
                    <li><a href="#">我的预定</a></li>
                </ol>
                <table class="table">
                    <caption>我预定的会议：</caption>
                    <tr>
                        <th>会议名称</th>
                        <th>会议室名称</th>
                        <th>会议开始时间</th>
                        <th>会议结束时间</th>
                        <th>会议预定时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${mrs}" var="mr">
                        <tr>
                            <td>${mr.meetingname}</td>
                            <td>${mr.roomname}</td>
                            <td><fmt:formatDate value="${mr.starttime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                            <td><fmt:formatDate value="${mr.endtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                            <td><fmt:formatDate value="${mr.reservationtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                            <td>
                                <a class="btn btn-warning" href="/meeting/meetingdetail?mid=${mr.meetingid}&type=cancel">查看/撤销</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //container -->
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
