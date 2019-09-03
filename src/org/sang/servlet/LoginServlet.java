package org.sang.servlet;

import org.sang.service.EmployeeService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountname = req.getParameter("accountname");
        String password = req.getParameter("password");

        int login = employeeService.login(accountname, password);
        ServletContext sc = req.getServletContext();
        Object visitcount = sc.getAttribute("vc");
        if (visitcount == null) {
            visitcount = "0";
        }
        int vc = Integer.parseInt(visitcount.toString()) + 1;
        sc.setAttribute("vc", vc);
        if (login == 0) {
            req.setAttribute("error", "用户待审批，请稍候");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else if (login == 1) {
            req.getSession().setAttribute("loginUser", employeeService.getLoginUser());//存入session中，便于在jsp文件中直接引用
            resp.sendRedirect(req.getContextPath() + "/notifications");
            PrintWriter out = resp.getWriter();
//            out.println("200");
//            out.close();
        } else if (login == 2) {
            req.setAttribute("error", "用户审批未通过，请重新注册");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else if (login == 3) {
            req.setAttribute("error", "用户名或者密码输入错误，请重新登录");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else if (login == -1) {
            req.setAttribute("error", "账号已关闭，登陆失败，请联系管理员");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}
