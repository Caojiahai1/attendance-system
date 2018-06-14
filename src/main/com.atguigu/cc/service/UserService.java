package cc.service;

import cc.model.User;
import com.alibaba.fastjson.JSONObject;

import java.util.List;

/**
 * Create By CJH on 2018/4/25
 */
public interface UserService {
    List<User> getAll();

    JSONObject userValidate(String userName, String password);

    Boolean userExist(String username);

    void register(User user);
}