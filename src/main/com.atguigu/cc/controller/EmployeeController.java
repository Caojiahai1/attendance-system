package cc.controller;

import cc.model.Employee;
import cc.service.EmployeeService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Create By CJH on 2018/5/5
 */
@Controller
@RequestMapping(value = "/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @ResponseBody
    @RequestMapping(value = "list")
    public JSONObject list (HttpServletRequest request, @RequestParam Integer limit, @RequestParam Integer offset) {
        JSONObject jsonObject = new JSONObject();
        List<Employee> list = employeeService.getAll(limit, offset);
        jsonObject.put("rows", list);
        jsonObject.put("total", employeeService.getCount());
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping(value = "add")
    public JSONObject add (Employee employee) {
        JSONObject jsonObject = new JSONObject();
        employee.setId(null);
        employeeService.addEmployee(employee);
        jsonObject.put("success", true);
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping(value = "update")
    public JSONObject update (Employee employee) {
        JSONObject jsonObject = new JSONObject();
        employeeService.updateEmployee(employee);
        jsonObject.put("success", true);
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping(value = "delete")
    public JSONObject delete (Employee employee) {
        JSONObject jsonObject = new JSONObject();
        employeeService.deleteEmployee(employee);
        jsonObject.put("success", true);
        return jsonObject;
    }
}