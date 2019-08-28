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
            <h2>Meeting Detail <span style="font-weight:100; font-size: 36px;">修改会议预定</span></h2>
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
                    <li><a href="meetingdetail">修改会议预定</a></li>
                </ol>
                <form>
                    <h3>会议信息</h3>
                    <table class="table">
                        <tr>
                            <td>会议名称：</td>
                            <td>${mt.meetingname}</td>
                        </tr>
                        <tr>
                            <td>预计参加人数：</td>
                            <td>${mt.numberofparticipants}</td>
                        </tr>
                        <tr>
                            <td>预计开始时间：</td>
                            <td>${mt.starttime}</td>
                        </tr>
                        <tr>
                            <td>预计结束时间：</td>
                            <td>${mt.endtime}</td>
                        </tr>
                        <tr>
                            <td>会议说明：</td>
                            <td>
                            <textarea id="description" rows="5" readonly
                                      class="form-control">${mt.description}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>参会人员：</td>
                            <td>
                                <table class="listtable">
                                    <tr class="listheader">
                                        <th>姓名</th>
                                        <th>联系电话</th>
                                        <td>电子邮件</td>
                                    </tr>
                                    <c:forEach items="${emps}" var="emp">
                                        <tr>
                                            <td>${emp.employeename}</td>
                                            <td>${emp.phone}</td>
                                            <td>${emp.email}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="command" colspan="2">
                                <c:if test="${type=='cancel'}">
                                    <input type="button" class="btn btn-danger" value="撤销会议"
                                           onclick="window.location.href='/meeting/cancelmeeting?mid=${mt.meetingid}';"/>
                                </c:if>
                                <input type="button" class="btn btn-info" value="返回" onclick="window.history.back();"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>