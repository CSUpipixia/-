<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h2>Room Details <span style="font-weight:100; font-size: 36px;">修改会议室信息</span></h2>
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
                    <li><a href="#">会议室管理</a></li>
                    <li><a href="getallmr">修改会议室信息</a></li>
                </ol>
                <form action="/meeting/addmr" method="post">
                        <h3>会议室信息</h3>
                        <table class="table">
                            <tr>
                                <td>门牌号:</td>
                                <td>
                                    <input name="roomid" value="${mr.roomid}" type="hidden" class="form-control">
                                    <input id="roomnumber" name="roomnum" type="text" value="${mr.roomnum}"
                                           maxlength="10" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>会议室名称:</td>
                                <td>
                                    <input id="capacity" type="text" name="roomname" value="${mr.roomname}"
                                           maxlength="20" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>最多容纳人数：</td>
                                <td>
                                    <input id="roomcapacity" type="text" name="capacity" value="${mr.capacity}" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td>当前状态：</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${mr.status==0}">
                                            <input type="radio" id="status" name="status" checked="checked"
                                                   value="0" /><label for="status">启用</label>
                                            <input type="radio" id="status" name="status" value="1"/><label for="status"
                                                                                                            value="0">停用</label>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="radio" id="status" name="status" value="0"/><label
                                                for="status">启用</label>
                                            <input type="radio" id="status" name="status" checked="checked"
                                                   value="1"/><label for="status"
                                                                     value="0">停用</label>
                                        </c:otherwise>
                                    </c:choose>

                                </td>
                            </tr>
                            <tr>
                                <td>备注：</td>
                                <td>
                                    <textarea id="description" maxlength="200" rows="5" name="description"
                                              cols="60" class="form-control">${mr.description}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <c:if test="${loginUser.role==1}">
                                        <input type="submit" value="确认修改" class="btn btn-success"/>
                                    </c:if>
                                    <input type="button" class="btn btn-info" value="返回"
                                           onclick="window.history.back();"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //container -->
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
