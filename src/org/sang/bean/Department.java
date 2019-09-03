package org.sang.bean;
//部门

public class Department {
    private int departmentid;//唯一标识符
    private String departmentname;

    public Department() {
    }

    public Department(int departmentid, String departmentname) {
        this.departmentid = departmentid;
        this.departmentname = departmentname;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public String getDepartmentname() {
        return departmentname;
    }//departmentName

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }


}
