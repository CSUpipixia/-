package org.sang.servlet;

import org.sang.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ResetCreditsServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String eid = req.getParameter("eid");
        int i = employeeService.updateEmpCreditsById(Integer.parseInt(eid), 10);
        if (i == 1) {
            resp.sendRedirect(req.getContextPath() + "/serachemp");
        } else {
            req.setAttribute("error", "重置积分失败");
            req.getRequestDispatcher("/serachemp").forward(req, resp);
        }
    }
}
