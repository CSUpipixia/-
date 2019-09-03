package org.sang.servlet;

import org.sang.bean.Employee;
import org.sang.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DoRegServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String employeename = req.getParameter("employeename");
        String accountname = req.getParameter("accountname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String deptid = req.getParameter("deptid");
        if (accountname.length() == 0 || accountname.equals("")) {
            req.setAttribute("error", "学工号不能为空");
            req.getRequestDispatcher("/reg").forward(req, resp);
        } else if (employeename.length() == 0 || employeename.equals("")) {
            req.setAttribute("error", "姓名不能为空");
            req.getRequestDispatcher("/reg").forward(req, resp);
        } else {
            Employee employee = new Employee(employeename, accountname, phone, email, Integer.parseInt(deptid));
            // 检查用户是否为管理员
            if ((req.getSession().getAttribute("loginUser")) == null)
                employee.setStatus(0);
            else
                employee.setStatus(1);
            int reg = employeeService.reg(employee);
            if (reg == 1) {
                //注册成功
                req.setAttribute("error", "添加成功");
                req.getRequestDispatcher("/reg").forward(req, resp);
            } else if (reg == -1) {
                //用户名重复，注册失败
                req.setAttribute("error", "学工号重复，注册失败");
                req.getRequestDispatcher("/reg").forward(req, resp);
                String status = req.getParameter("status");
            } else {
                req.setAttribute("error", "不明原因，注册失败");
                req.getRequestDispatcher("/reg").forward(req, resp);
            }
        }
    }
}
