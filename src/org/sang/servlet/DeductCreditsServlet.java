package org.sang.servlet;

import org.sang.bean.Employee;
import org.sang.service.EmployeeService;
import org.sang.service.MeetingService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeductCreditsServlet extends HttpServlet {
    private MeetingService meetingService = new MeetingService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int loginEmpRole = ((Employee) req.getSession().getAttribute("loginUser")).getRole();
        if (loginEmpRole != 1)
            req.getRequestDispatcher("/notifications.jsp").forward(req, resp);

        String mid = req.getParameter("mid");
        int i = meetingService.deductCreditsById(Integer.parseInt(mid), 2); //扣除2分积分
        if (i == 1) {
            resp.sendRedirect(req.getContextPath() + "/searchmeeting");
        } else {
            req.setAttribute("error", "扣除积分失败");
            req.getRequestDispatcher("/searchmeeting").forward(req, resp);
        }
    }
}
