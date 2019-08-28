package org.sang.service;

import org.sang.bean.Department;
import org.sang.dao.DepartmentDao;

import java.util.List;

public class DepartmentService {
    private DepartmentDao departmentDao = new DepartmentDao();

    public int updateDepById(String name, int id) {
        return departmentDao.updateDepById(name, id);
    }


    public List<Department> getAllDepartment() {
        return departmentDao.getAllDepartment();
    }

    public int deleteDepById(int id) {
        return departmentDao.deleteDepById(id);
    }

    public int insert(String name) {
        return departmentDao.insert(name);
    }
}
