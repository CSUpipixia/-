package org.sang.servlet;

import org.sang.bean.Employee;
import org.sang.bean.Meeting;
import org.sang.service.MeetingService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DoBookMeetingServlet extends HttpServlet {
    private MeetingService meetingService = new MeetingService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String meetingname = req.getParameter("meetingname");
        String numberofparticipants = req.getParameter("numberofparticipants");
        String starttime = req.getParameter("starttime");
        String endtime = req.getParameter("endtime");
        String roomid = req.getParameter("roomid");
        String description = req.getParameter("description");
        String[] selSelectedEmployees = req.getParameterValues("selSelectedEmployees");
        //获取当前登录的用户对象
        Employee loginUser = (Employee) req.getSession().getAttribute("loginUser");

        //格式化
        StringBuilder start=new StringBuilder(starttime);
        start.append(":00");
        StringBuilder end=new StringBuilder(endtime);
        end.append(":00");

        Meeting meeting = new Meeting(meetingname, Integer.parseInt(roomid), loginUser.getEmployeeid(), Integer.parseInt(numberofparticipants), Timestamp.valueOf(start.toString()), Timestamp.valueOf(end.toString()), new Timestamp(System.currentTimeMillis()), description);
        meetingService.insert(meeting, selSelectedEmployees);
        resp.sendRedirect(req.getContextPath()+"/mybooking");
    }
}
