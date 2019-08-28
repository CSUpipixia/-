<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <h2>Notifications <span style="font-weight:100; font-size: 36px;">最新通知</span></h2>
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
                    <li><a href="notifications">最新通知</a></li>
                </ol>
                <div style="display: inline;text-align: right">您是第${vc}位访客!</div>
                <table class="table">
                    <caption>
                        未来7天我要参加的会议:
                    </caption>
                    <tr>
                        <th style="width:300px">会议名称</th>
                        <th>会议室</th>
                        <th>起始时间</th>
                        <th>结束时间</th>
                        <th style="width:100px">操作</th>
                    </tr>
                    <c:forEach items="${mt7}" var="mt">
                        <tr>
                            <td>${mt.meetingname}</td>
                            <td>${mt.roomname}</td>
                            <td><fmt:formatDate value="${mt.starttime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${mt.endtime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>
                                <a class="clickbutton" href="/meeting/meetingdetail?mid=${mt.meetingid}">查看详情</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <table class="table">
                    <caption>
                        已取消的会议:
                    </caption>
                    <tr>
                        <th style="width:200px">会议名称</th>
                        <th>会议室</th>
                        <th>起始时间</th>
                        <th>结束时间</th>
                        <th>取消原因</th>
                        <th style="width:100px">操作</th>
                    </tr>
                    <c:forEach items="${cm}" var="m">
                        <tr>
                            <td>${m.meetingname}</td>
                            <td>${m.roomname}</td>
                            <td><fmt:formatDate value="${m.starttime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td><fmt:formatDate value="${m.endtime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>${m.canceledreason}</td>
                            <td>
                                <a class="btn btn-info" href="/meeting/meetingdetail?mid=${m.meetingid}">查看详情</a>
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
