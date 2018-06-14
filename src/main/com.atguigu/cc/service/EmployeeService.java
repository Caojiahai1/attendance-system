package cc.service;

import cc.model.Employee;

import java.util.List;

/**
 * Create By CJH on 2018/5/5
 */
public interface EmployeeService {
    List<Employee> getAll(Integer limit, Integer offset);

    Integer getCount();

    void addEmployee(Employee employee);

    void updateEmployee(Employee employee);

    void deleteEmployee(Employee employee);
}