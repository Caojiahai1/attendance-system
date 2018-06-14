package cc.dao;

import cc.model.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By CJH on 2018/5/5
 */
@Repository
public interface EmployeeDAO {
    List<Employee> getAll(@Param("limit")Integer limit, @Param("offset")Integer offset);

    Integer getCount();

    void addEmployee(Employee employee);

    void updateEmployee(Employee employee);

    void deleteEmployee(Employee employee);
}