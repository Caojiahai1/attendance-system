package cc.controller;

import cc.model.User;
import cc.service.UserService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Create By CJH on 2018/5/8
 */
@Controller
public class RegisterController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "register")
    @ResponseBody
    public JSONObject register (User user) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", true);

        if (!userService.userExist(user.getUsername())) {
            jsonObject.put("success", false);
            return jsonObject;
        } else {
            userService.register(user);
        }
        return jsonObject;
    }
}