package org.sang.servlet;

import org.sang.bean.Department;
import org.sang.service.DepartmentService;

import org.sang.bean.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyInfoServlet")
public class MyInfoServlet extends HttpServlet {
    DepartmentService departmentService=new DepartmentService();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Employee emp=req.getSession().getAttribute("loginUser")
        int departmentId=((Employee)req.getSession().getAttribute("loginUser")).getDepartmentid();
        String departmentname=departmentService.getDepById(departmentId);

        req.getSession().setAttribute("departmentname",departmentname);//session添加属性

        List<Department> list = departmentService.getAllDepartment();
        req.setAttribute("list", list);
        req.getRequestDispatcher("/userinfo.jsp").forward(req, resp);
    }


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
