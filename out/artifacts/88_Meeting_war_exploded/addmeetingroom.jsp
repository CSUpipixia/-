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
            <h2>Add MeetingRoom<span style="font-weight:100; font-size: 36px;">添加会议室</span></h2>
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
                    <li><a href="#">会议预定</a></li>
                    <li><a href="#">添加会议室</a></li>
                </ol>
                <form action="/meeting/addmr" method="post">
                    <h3>会议室信息</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>门牌号</label>
                                <input id="roomnumber" name="roomnum" type="text" class="form-control"
                                       placeholder="例如：201"
                                       maxlength="10"/>
                            </div>
                            <div class="form-group">
                                <label>门牌号</label>
                                <input id="capacity" name="roomname" type="text" class="form-control"
                                       placeholder="例如：第一会议室"
                                       maxlength="20"/>
                            </div>
                            <div class="form-group">
                                <label>最多容纳人数</label>
                                <input id="roomcapacity" name="capacity" type="text" class="form-control"
                                       placeholder="填写一个正整数"
                                       maxlength="20"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>当前状态</label>
                                <input type="radio" id="status" name="status" checked="checked" value="0"/>启用
                                <input type="radio" id="status" name="status" value="1"/>停用
                            </div>
                            <div class="form-group">
                                <label>备注</label>
                                <textarea id="description" name="description" maxlength="200" rows="5" cols="60"
                                          placeholder="200字以内的文字描述" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <input type="submit" value="添加" class="btn btn-success"/>
                    <input type="reset" value="重置" class="btn btn-danger"/>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
