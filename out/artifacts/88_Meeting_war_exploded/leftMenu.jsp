<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="Categories">
    <h3>个人中心</h3>
    <ul>
        <li class="sidebar-menuitem"><a href="/meeting/notifications">最新通知</a></li>
        <li class="sidebar-menuitem active"><a href="/meeting/mybooking">我的预定</a></li>
        <li class="sidebar-menuitem"><a href="/meeting/mymeeting">我的会议</a></li>
    </ul>
</div>
<c:if test="${loginUser.role==1}">
    <div class="Categories">
        <h3>用户管理</h3>
        <ul>
            <li class="sidebar-menuitem"><a href="departments">部门管理</a></li>
            <li class="sidebar-menuitem"><a href="reg">添加用户</a></li>
            <li class="sidebar-menuitem"><a href="serachemp">搜索用户</a></li>
        </ul>
    </div>
</c:if>
<div class="Categories">
    <h3>会议预定</h3>
    <ul>
        <c:if test="${loginUser.role==1}">
            <li class="sidebar-menuitem"><a href="addmeetingroom.jsp">添加会议室</a></li>
        </c:if>
        <li class="sidebar-menuitem"><a href="getallmr">查看会议室</a></li>
        <li class="sidebar-menuitem"><a href="/meeting/bookmeeting">预定会议</a></li>
        <c:if test="${loginUser.role==1}">
            <li class="sidebar-menuitem"><a href="/meeting/searchmeeting">搜索会议</a></li>
        </c:if>
    </ul>
</div>
