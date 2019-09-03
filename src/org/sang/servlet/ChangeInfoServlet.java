package org.sang.servlet;

import org.sang.bean.Employee;
import org.sang.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeInfoServlet")
public class ChangeInfoServlet extends HttpServlet {
    EmployeeService employeeService=new EmployeeService();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String employeename = req.getParameter("employeename");
        String accountname = req.getParameter("accountname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String newdeptid=req.getParameter("newdeptid");

        if(employeename.length()!=0 && !employeename.equals(""))
            ((Employee)req.getSession().getAttribute("loginUser")).setEmployeename(employeename);
        else
            employeename=((Employee)req.getSession().getAttribute("loginUser")).getEmployeename();

        if(accountname.length()!=0 && !accountname.equals(""))
            ((Employee)req.getSession().getAttribute("loginUser")).setUsername(accountname);
        else
            accountname=((Employee)req.getSession().getAttribute("loginUser")).getUsername();

        if(phone.length()!=0 && !phone.equals(""))
            ((Employee)req.getSession().getAttribute("loginUser")).setPhone(phone);
        else
            phone=((Employee)req.getSession().getAttribute("loginUser")).getPhone();

        if(email.length()!=0 && !email.equals(""))
            ((Employee)req.getSession().getAttribute("loginUser")).setEmail(email);
        else
            email=((Employee)req.getSession().getAttribute("loginUser")).getEmail();



//        Employee employee = new Employee(((Employee)req.getSession().getAttribute("loginUser")).getEmployeename(), ((Employee)req.getSession().getAttribute("loginUser")).getUsername()
//                , ((Employee)req.getSession().getAttribute("loginUser")).getPhone(),
//                ((Employee)req.getSession().getAttribute("loginUser")).getEmail(),24);

        Employee employee = new Employee(employeename,accountname,phone,email,23);
        employee.setEmployeeid( ((Employee)req.getSession().getAttribute("loginUser")).getEmployeeid());

//        ((Employee)req.getSession().getAttribute("loginUser")).setEmployeeid(employee.getEmployeeid());

        employeeService.changeInfo(employee);

        req.getRequestDispatcher("/userinfo.jsp").forward(req, resp);

//        if (accountname.length() == 0 || accountname.equals("")) {
//            req.setAttribute("error", "学工号不能为空");
//            req.getRequestDispatcher("/reg").forward(req, resp);
//        } else if (employeename.length() == 0 || employeename.equals("")) {
//            req.setAttribute("error", "姓名不能为空");
//            req.getRequestDispatcher("/reg").forward(req, resp);
//        } else {
//            Employee employee = new Employee(employeename, accountname, phone, email, Integer.parseInt(deptid));
//            int reg = employeeService.reg(employee);
//            if (reg == 1) {
//                //注册成功
//                req.setAttribute("error", "添加成功");
//                req.getRequestDispatcher("/reg").forward(req, resp);
//            } else if (reg == -1) {
//                //用户名重复，注册失败
//                req.setAttribute("error", "学工号重复，注册失败");
//                req.getRequestDispatcher("/reg").forward(req, resp);
//                String status = req.getParameter("status");
//            } else {
//                req.setAttribute("error", "不明原因，注册失败");
//                req.getRequestDispatcher("/reg").forward(req, resp);
//            }
//        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
