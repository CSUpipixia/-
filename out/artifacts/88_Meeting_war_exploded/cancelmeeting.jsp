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
            <h2>Cancel Meeting<span style="font-weight:100; font-size: 36px;">撤销会议预定</span></h2>
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
                    <li><a href="cancelmeeting">撤销会议预定</a></li>
                </ol>
                <form action="/meeting/docanceled" method="post">
                        <h3>撤销预定</h3>
                        <table class="table">
                            <tr>
                                <input type="hidden" name="mid" value="${m.meetingid}"/>
                                <td>会议名称：</td>
                                <td>${m.meetingname}</td>
                            </tr>
                            <tr>
                                <td>撤销理由：</td>
                                <td><textarea id="description" rows="5" name="canceledreason" class="form-control"></textarea></td>
                            </tr>
                            <tr>
                                <td class="command" colspan="2">
                                    <input type="submit" class="btn btn-danger" value="确认撤销"></input>
                                    <input type="button" class="btn btn-info" value="返回"
                                           onclick="window.history.back();"/>
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
