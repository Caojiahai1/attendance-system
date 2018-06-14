package cc.service.impl;

import cc.dao.UserDAO;
import cc.model.User;
import cc.service.UserService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By CJH on 2018/4/25
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDAO userDAO;

    @Override
    public List<User> getAll() {
        return userDAO.getAll();
    }

    @Override
    public JSONObject userValidate(String userName, String password) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success",false);
        int user = userDAO.userValidate(userName, password);
        if (user == 1) {
            jsonObject.put("success",true);
        }
        return jsonObject;
    }

    @Override
    public Boolean userExist(String username) {
        if (userDAO.userExist(username) > 0) {
            return false;
        }
        return true;
    }

    @Override
    public void register(User user) {
        userDAO.register(user);
    }
}