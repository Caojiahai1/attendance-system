package cc.controller;

import cc.model.User;
import cc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Create By CJH on 2018/4/25
 */
@Controller
public class TestController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "hello")
    public String hello () {
        return "index";
    }

    @RequestMapping(value = "list")
    @ResponseBody
    public List<User> list () {
        return userService.getAll();
    }


}