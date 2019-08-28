<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8" %>
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
            <h2>Search Meeting <span style="font-weight:100; font-size: 36px;">会议预订</span></h2>
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
                    <li><a href="bookmeeting">会议预定</a></li>
                    <li><a href="searchmeeting">搜索会议</a></li>
                </ol>
                <form action="/meeting/searchmeeting" method="post">
                    <h3>搜索会议</h3>
                    <table class="table">
                        <tr>
                            <td>会议名称：</td>
                            <td>
                                <input type="text" id="meetingname" name="meetingname" value="${meetingname}"
                                       maxlength="20" class="form-control"/>
                            </td>
                            <td>会议室名称：</td>
                            <td>
                                <input type="text" id="roomname" value="${roomname}" name="roomname" maxlength="20"
                                       class="form-control"/>
                            </td>
                            <td>预定者姓名：</td>
                            <td>
                                <input type="text" id="reservername" value="${reservername}" name="reservername"
                                       maxlength="20" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td>预定日期：</td>
                            <td colspan="5">
                                从&nbsp;
                                <input class="Wdate" type="text" id="starttime" name="reservefromdate"
                                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control">
                                到&nbsp;
                                <input class="Wdate" type="text" id="endtime" name="reservetodate"
                                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td>会议日期：</td>
                            <td colspan="5">
                                从&nbsp;
                                <input class="Wdate" type="text" name="meetingfromdate"
                                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control">
                                到&nbsp;
                                <input class="Wdate" type="text" name="meetingtodate"
                                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="command">
                                <input type="submit" class="btn btn-info" value="查询"/>
                                <input type="reset" class="btn btn-info" value="重置"/>
                            </td>
                        </tr>
                    </table>
                    </fieldset>
                </form>
                <div>
                    <h3 style="text-align:center;color:black">查询结果</h3>
                    <table class="table">
                        <tr>
                            <th>会议名称</th>
                            <th>会议室名称</th>
                            <th>会议开始时间</th>
                            <th>会议结束时间</th>
                            <th>会议预定时间</th>
                            <th>预定者</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${list}" var="m">
                            <tr>
                                <td>${m.meetingname}</td>
                                <td>${m.roomname}</td>
                                <td>${m.starttime}</td>
                                <td>${m.endtime}</td>
                                <td>${m.reservationtime}</td>
                                <td>${m.empname}</td>
                                <td>
                                    <a class="btn btn-info" href="/meeting/meetingdetail?mid=${m.meetingid}">查看详情</a>
                                    <c:if test="${m.deductcredits == 0}">
                                        <a class="btn btn-danger" href="/meeting/deductcredits?mid=${m.meetingid}">扣除积分</a>
                                    </c:if>
                                    <c:if test="${m.deductcredits > 0}">
                                        <a class="btn btn-danger" disabled="disabled" href="/meeting/searchmeeting">已扣分</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div style="text-align: center">共<span class="info-number">${totalCount}</span>条结果，
                        分成<span class="info-number">${totalPage}</span>页显示，
                        当前第<span class="info-number">${page}</span>页
                        <a type="button" class="btn btn-info btn-xs"
                           href="/meeting/searchmeeting?page=1&meetingname=${meetingname}&roomname=${roomname}&reservername=${reservername}&reservefromdate=${reservefromdate}&reservetodate=${reservetodate}&meetingfromdate=${meetingfromdate}&meetingtodate=${meetingtodate}">首页</a>
                        <c:choose>
                            <c:when test="${page>1}">
                                <a type="button" class="btn btn-info btn-xs"
                                   href="/meeting/searchmeeting?page=${page-1}&meetingname=${meetingname}&roomname=${roomname}&reservername=${reservername}&reservefromdate=${reservefromdate}&reservetodate=${reservetodate}&meetingfromdate=${meetingfromdate}&meetingtodate=${meetingtodate}">上页</a>
                            </c:when>
                            <c:otherwise>
                                <a type="button" class="btn btn-info btn-xs">上页</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${page<totalPage}">
                                <a type="button" class="btn btn-info btn-xs"
                                   href="/meeting/searchmeeting?page=${page+1}&meetingname=${meetingname}&roomname=${roomname}&reservername=${reservername}&reservefromdate=${reservefromdate}&reservetodate=${reservetodate}&meetingfromdate=${meetingfromdate}&meetingtodate=${meetingtodate}">下页</a>
                            </c:when>
                            <c:otherwise>
                                <a type="button" class="btn btn-info btn-xs">下页</a>
                            </c:otherwise>
                        </c:choose>
                        <a type="button" class="btn btn-info btn-xs"
                           href="/meeting/searchmeeting?page=${totalPage}&meetingname=${meetingname}&roomname=${roomname}&reservername=${reservername}&reservefromdate=${reservefromdate}&reservetodate=${reservetodate}&meetingfromdate=${meetingfromdate}&meetingtodate=${meetingtodate}">末页</a>
                        <form action="/meeting/searchmeeting" method="post" style="display: inline">
                            <input type="hidden" value="${meetingname}" name="meetingname" maxlength="20"/>
                            <input type="hidden" value="${roomname}" name="roomname" maxlength="20"/>
                            <input type="hidden" value="${reservername}" name="reservername" maxlength="20"/>
                            <input type="hidden" value="${reservefromdate}" name="reservefromdate" maxlength="20"/>
                            <input type="hidden" value="${reservetodate}" name="reservetodate" maxlength="20"/>
                            <input type="hidden" value="${meetingfromdate}" name="meetingfromdate" maxlength="20"/>
                            <input type="hidden" value="${meetingtodate}" name="meetingtodate" maxlength="20"/>
                            跳到第
                            <input class="form-control" style="width:20px;height:25px;display:initial;" type="text"
                                   id="pagenum" name="page" class="nav-number"/>
                            页
                            <input type="submit" class="btn btn-info btn-xs" value="跳转"/>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //container -->
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
