package org.sang.servlet;

import org.sang.bean.Department;
import org.sang.bean.Employee;
import org.sang.service.DepartmentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DepartmentsServlet extends HttpServlet {
    private DepartmentService departmentService = new DepartmentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int loginEmpRole = ((Employee) req.getSession().getAttribute("loginUser")).getRole();
        if (loginEmpRole != 1)
            req.getRequestDispatcher("/notifications.jsp").forward(req, resp);

        List<Department> list = departmentService.getAllDepartment();
        req.setAttribute("list", list);
        req.getRequestDispatcher("/departments.jsp").forward(req, resp);
    }
}
