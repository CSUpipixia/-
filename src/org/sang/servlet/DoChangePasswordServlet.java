package org.sang.servlet;

import org.sang.bean.Employee;
import org.sang.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DoChangePasswordServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int loginEmpId = ((Employee) req.getSession().getAttribute("loginUser")).getEmployeeid();
        String loginEmpUsername = ((Employee) req.getSession().getAttribute("loginUser")).getUsername();
        String loginEmpPassword = ((Employee) req.getSession().getAttribute("loginUser")).getPassword();

        String originpassword = req.getParameter("origin");
        String newpassword = req.getParameter("new");
        String confirmpassword = req.getParameter("confirm");

        if (!loginEmpPassword.equals(originpassword))
        {
            req.setAttribute("error", "原密码输入错误，请重新输入");
            req.getRequestDispatcher("/changepassword.jsp").forward(req, resp);
        } else if (newpassword.length() == 0) {
            req.setAttribute("error", "新密码不能为空");
            req.getRequestDispatcher("/changepassword.jsp").forward(req, resp);
        } else if (!newpassword.equals(confirmpassword)) {
            req.setAttribute("error", "两次密码输入不一致，请重新输入");
            req.getRequestDispatcher("/changepassword.jsp").forward(req, resp);
        } else {
            int change = employeeService.changePasswordById(loginEmpId, newpassword);
            if (change == -1) {
                req.setAttribute("error", "密码更新失败");
                req.getRequestDispatcher("/changepassword.jsp").forward(req, resp);
            } else if (change == 1) {
                req.setAttribute("error", "密码更新成功");
                if (employeeService.login(loginEmpUsername, newpassword) == 1)
                    req.getSession().setAttribute("loginUser", employeeService.getLoginUser());
                req.getRequestDispatcher("/changepassword.jsp").forward(req, resp);
            }
        }
    }
}
