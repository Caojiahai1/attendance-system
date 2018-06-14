package cc.controller;

import cc.common.WebConstants;
import cc.service.UserService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Create By CJH on 2018/4/27
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "success")
    public String login () {
        return "index";
    }


    @GetMapping(value = "userValidate")
    @ResponseBody
    public JSONObject userValidate (HttpServletRequest request, @RequestParam String userName, @RequestParam String password) {
        JSONObject jsonObject = userService.userValidate(userName, password);
        if (jsonObject.get("success").equals(true)) {
            HttpSession session = request.getSession(true);
            session.setAttribute(WebConstants.USER_SESSION_KEY, userName);
        }
        return jsonObject;
    }

    @RequestMapping(value = "logout")
    public String logout (HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        session.setAttribute(WebConstants.USER_SESSION_KEY, null);
        return "redirect:/login.jsp";
    }
}