package org.sang.servlet;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.sang.bean.Department;
import org.sang.bean.MeetingRoom;
import org.sang.bean.Product;
import org.sang.dao.DepartmentDao;
import org.sang.service.DepartmentService;
import org.sang.service.MeetingRoomService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class MyChartServlet extends HttpServlet {
    MeetingRoomService meetingRoomService=new MeetingRoomService();
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //定义一个list集合

        // 数据添加到集合里面，这里可以改为获取sql数据信息，然后转为json字符串，然后存到list中。
        //这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，
        //每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合。


        List<MeetingRoom> list=meetingRoomService.getAllMeetingRoom();

        ObjectMapper mapper = new ObjectMapper(); // 提供java-json相互转换功能的类

        String result = mapper.writeValueAsString(list); // 将list中的对象转换为Json字符串

        // 将json字符串数据返回给前端
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.write(result);
        out.close();

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

//    public static void main(String[] args) throws JsonProcessingException {
//        //定义一个list集合
////        List<Product> list = new ArrayList<Product>();
////
////        // 数据添加到集合里面，这里可以改为获取sql数据信息，然后转为json字符串，然后存到list中。
////        //这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，
////        //每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合。
////        list.add(new Product("短袖", 10));
////        list.add(new Product("牛仔裤", 20));
////        list.add(new Product("羽绒服", 30));
//
//        List<Department> list=departmentService.getAllDepartment();
//
//        ObjectMapper mapper = new ObjectMapper(); // 提供java-json相互转换功能的类
//
//        String result = mapper.writeValueAsString(list); // 将list中的对象转换为Json字符串
//
//
//        System.out.println(result.toString());
//    }
}
