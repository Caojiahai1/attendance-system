package cc.service.impl;

import cc.dao.EmployeeDAO;
import cc.model.Employee;
import cc.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By CJH on 2018/5/5
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Resource
    private EmployeeDAO employeeDAO;


    @Override
    public List<Employee> getAll(Integer limit, Integer offset) {
        return employeeDAO.getAll(limit, offset);
    }

    @Override
    public Integer getCount() {
        return employeeDAO.getCount();
    }

    @Override
    public void addEmployee(Employee employee) {
        employeeDAO.addEmployee(employee);
    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeDAO.updateEmployee(employee);
    }

    @Override
    public void deleteEmployee(Employee employee) {
        employeeDAO.deleteEmployee(employee);
    }
}