<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="js/jquery-3.2.1.js"></script>
    <script src="./My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        #divfrom {
            float: left;
            width: 150px;
        }

        #divto {
            float: left;
            width: 150px;
        }

        #divoperator {
             float: left;
             width: 50px;
             padding: 60px 14px;
             margin: 10px;
         }

        #divoperator input[type="button"] {
            margin: 10px 0;
        }

        #selDepartments {
            display: block;
            width: 100%;
        }

        #selEmployees {
            display: block;
            width: 100%;
            height: 200px;
        }

        #selSelectedEmployees {
            display: block;
            width: 100%;
            height: 225px;
        }
    </style>
    <script type="application/javascript">
        function employee(employeeid, employeename) {
            this.employeeid = employeeid;
            this.employeename = employeename;
        }

        function department(departmentid, departmentname, employees) {
            this.departmentid = departmentid;
            this.departmentname = departmentname;
            this.employees = employees;
        }

        var data = new Array(
            new department(1, "技术部222222", new Array(
                new employee(1001, "a00"), new employee(1002, "a01"), new employee(1003, "a02"), new employee(1004, "a03"))),
            new department(2, "销售部", new Array(
                new employee(2001, "b00"), new employee(2002, "b01"), new employee(2003, "b02"), new employee(2004, "b03"))),
            new department(3, "市场部", new Array(
                new employee(3001, "c00"), new employee(3002, "c01"), new employee(3003, "c02"), new employee(3004, "c03"))),
            new department(4, "行政部", new Array(
                new employee(4001, "d00"), new employee(4002, "d01"), new employee(4003, "d02"), new employee(4004, "d03"))));

        var selDepartments;
        var selEmployees;
        var selSelectedEmployees;

        function body_load() {
            selDepartments = document.getElementById("selDepartments");
            selEmployees = document.getElementById("selEmployees");
            selSelectedEmployees = document.getElementById("selSelectedEmployees");

            //分析：这里的方法是用来给部门下拉框设置值用的
            /*for (var i = 0; i < data.length; i++) {
             var dep = document.createElement("option");
             dep.value = data[i].departmentid;
             dep.text = data[i].departmentname;
             selDepartments.appendChild(dep);
             }*/
            $.post("/meeting/getalldepjson", function (msg) {
                for (var i = 0; i < msg.length; i++) {
                    var item = msg[i];
                    var dep = document.createElement("option");
                    dep.value = item.departmentid;
                    dep.text = item.departmentname;
                    selDepartments.appendChild(dep);
                }
                fillEmployees();
            });
        }

        function fillEmployees() {
            //清空左边多选下拉框中的所有元素
            clearList(selEmployees);
            //获取当前选中部门的id
            var departmentid = selDepartments.options[selDepartments.selectedIndex].value;
            //根据id去data数组中遍历找到对应的部门中的员工
//            for (var i = 0; i < data.length; i++) {
//                if (departmentid == data[i].departmentid) {
//                    employees = data[i].employees;
//                    break;
//                }
//            }

            $.post("/meeting/getempbydepid", {depid: departmentid}, function (msg) {
                for (var i = 0; i < msg.length; i++) {
                    var item = msg[i];
                    var emp = document.createElement("option");
                    emp.value = item.employeeid;
                    emp.text = item.employeename;
                    selEmployees.appendChild(emp);
                }
            });
        }

        function clearList(list) {
            while (list.childElementCount > 0) {
                list.removeChild(list.lastChild);
            }
        }

        function selectEmployees() {
            for (var i = 0; i < selEmployees.options.length; i++) {
                if (selEmployees.options[i].selected) {
                    addEmployee(selEmployees.options[i]);
                    selEmployees.options[i].selected = false;
                }
            }
        }

        function deSelectEmployees() {
            var elementsToRemoved = new Array();
            var options = selSelectedEmployees.options;
            for (var i = 0; i < options.length; i++) {
                if (options[i].selected) {
                    elementsToRemoved.push(options[i]);
                }
            }
            for (i = 0; i < elementsToRemoved.length; i++) {
                selSelectedEmployees.removeChild(elementsToRemoved[i]);
            }
        }

        function addEmployee(optEmployee) {
            var options = selSelectedEmployees.options;
            var i = 0;
            var insertIndex = -1;
            while (i < options.length) {
                if (optEmployee.value == options[i].value) {
                    return;
                } else if (optEmployee.value < options[i].value) {
                    insertIndex = i;
                    break;
                }
                i++;
            }
            var opt = document.createElement("option");
            opt.value = optEmployee.value;
            opt.text = optEmployee.text;
            opt.selected = true;

            if (insertIndex == -1) {
                selSelectedEmployees.appendChild(opt);
            } else {
                selSelectedEmployees.insertBefore(opt, options[insertIndex]);
            }
        }
    </script>
</head>
<body onload="body_load()">
<jsp:include page="top.jsp"/>
<!-- banner -->
<div class="banner about-banner">
    <div class="header about-header">
        <div th:replace="/common/Common::Header"></div>
    </div>
    <div class="about-heading">
        <div class="container">
            <h2>Book Meetings <span style="font-weight:100; font-size: 36px;">预定会议</span></h2>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="blog">
    <!-- container -->
    <div class="container">
        <div class="blog-top-grids">
            <div class="col-md-3 blog-top-right-grid">
                <jsp:include page="leftMenu.jsp"/>
            </div>
            <div class="col-md-9 blog-top-left-grid">
                <ol class="breadcrumb">
                    <li><a href="#">会议预定</a></li>
                    <li><a href="#">预订会议</a></li>
                </ol>
                <form action="/meeting/dobookmeeting" method="post">
                    <h3>会议信息</h3>
                    <c:if test="${loginUser.credits <= 0}">
                    <div class="col-md-6">
                        您的信誉积分不足，无法预订
                    </div>
                    </c:if>
                    <c:if test="${loginUser.credits > 0}">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>会议名称</label>
                                <input id="meetingname" name="meetingname" maxlength="20" type="text" type="text"
                                       class="form-control"
                                       placeholder="请输入会议名称"/>
                            </div>
                            <div class="form-group">
                                <label>预计参加人数</label>
                                <input id="numofattendents" name="numberofparticipants" type="text" type="text"
                                       class="form-control"
                                       placeholder="请输入参与人数"/>
                            </div>
                            <div class="form-group">
                                <label>预计开始时间</label>
                                <input id="starttime" name="starttime" type="text" type="text" class="Wdate form-control"
                                       placeholder="请选择会议的预计开始时间" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/>
                            </div>
                            <div class="form-group">
                                <label>预计结束时间</label>
                                <input id="endtime" name="endtime" type="text" type="text" class="Wdate form-control"
                                       placeholder="请选择会议的预计结束时间" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/>
                            </div>
                            <div class="form-group">
                                <label>会议室名称</label>
                                <select name="roomid" class="form-control">
                                    <c:forEach items="${mrs}" var="mr">
                                        <option value="${mr.roomid}">${mr.roomname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>会议说明</label>
                                <textarea class="form-control" id="description" placeholder="如：需要使用投影仪" rows="5" name="description"></textarea>
                            </div>
                            <div class="form-group">
                                <label>选择参会人员</label>
                                <div>
                                    <div id="divfrom">
                                        <select class="form-control" id="selDepartments" onchange="fillEmployees()">
                                        </select>
                                        <select class="form-control" id="selEmployees" multiple="true">
                                        </select>
                                    </div>
                                    <div id="divoperator">
                                        <input type="button" value="&gt;"
                                               onclick="selectEmployees()" class="btn btn-info"/>
                                        <input type="button" value="&lt;"
                                               onclick="deSelectEmployees()" class="btn btn-info"/>
                                    </div>
                                    <div id="divto">
                                        <select id="selSelectedEmployees" name="selSelectedEmployees"
                                                multiple="true" class="form-control">
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-success" value="预定会议"/>
                        <input type="reset" class="btn btn-danger" value="重置"/>
                    </form>
                </c:if>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //container -->
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
