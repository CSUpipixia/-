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
            <h2>Department <span style="font-weight:100; font-size: 36px;">部门管理</span></h2>
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
                    <li><a href="departments">部门管理</a></li>
                </ol>
                <form method="post" action="/meeting/adddep">
                        <h3>添加部门</h3>
                        ${error}
                        部门名称:
                        <input type="text" id="departmentname" name="departmentname" maxlength="20" class="form-control" style="width:100px;display:initial;"/>
                        <input type="submit" class="btn btn-success" value="添加"/>
                </form>
                <table class="table">
                    <h3>所有部门</h3>
                    <tr>
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    <c:if test="${error!=null}">
                        <tr>
                            <td colspan="3">${error}</td>
                        </tr>
                    </c:if>
                    <c:forEach items="${list}" var="dep">
                        <tr>
                            <td>${dep.departmentid}</td>
                            <td id="depname${dep.departmentid}">${dep.departmentname}</td>
                            <td>
                                <%--<a class="btn btn-success" href="#" id="edit${dep.departmentid}"--%>
                                    <a class="btn btn-success" href="javascript:void(0)" id="edit${dep.departmentid}"
                                   onclick="editDep(${dep.departmentid})">编辑</a>

                                <%--<a class="btn btn-warning" href="#" style="display: none" id="cancel${dep.departmentid}"--%>
                                    <a class="btn btn-warning" href="javascript:void(0)" style="display: none" id="cancel${dep.departmentid}"
                                   onclick="cancelEdit(${dep.departmentid},'${dep.departmentname}')">取消</a>
                                <a class="btn btn-danger" href="/meeting/deletedep?depid=${dep.departmentid}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script>
    function cancelEdit(depid, depName) {
        var cancelBtn = $("#cancel" + depid);
        var editBtn = $("#edit" + depid);
        var ele = $("#depname" + depid);
        cancelBtn.css("display", "none");
        editBtn.html("编辑");
        ele.html(depName);
    }
    function editDep(depid) {
        var cancelBtn = $("#cancel" + depid);
        var editBtn = $("#edit" + depid);
        var ele = $("#depname" + depid);//<td id="13">技术部</td>
        if (cancelBtn.css("display") == 'none') {
            cancelBtn.css("display", "inline")
            editBtn.html("确定");
            var depName = ele.text();
            ele.html("<input type='text' value='" + depName + "'/>");
        } else {
            //提交修改
            var children = ele.children("input");
            var val = children.val();
            // $.post("/meeting/updateDep", {id: depid, depName: val}, function (msg) {
            //     alert(msg);
            //     cancelBtn.css("display", "none")
            //     editBtn.html("编辑");
            //     ele.html(val);
            $.ajax({
                url: '/meeting/updateDep',
                type: 'post',
                data: {id: depid, depName: val},
                success: function(msg) {
                    alert(msg);
                    cancelBtn.css("display", "none")
                    editBtn.html("编辑");
                    ele.html(val);
                },
                error: function() {
                    alert("系统错误，请稍后重试！");
                    return false;
                },
            });
        }
    }
</script>
</body>
</html>
