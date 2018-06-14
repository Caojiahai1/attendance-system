package cc.dao;

import cc.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By CJH on 2018/4/25
 */
@Repository
public interface UserDAO {
    List<User> getAll();

    int userValidate(@Param("username") String userName,@Param("password") String password);

    Integer userExist(String username);

    void register(User user);
}