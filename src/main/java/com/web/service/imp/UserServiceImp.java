package com.web.service.imp;

import java.util.Date;
import java.util.List;

import com.web.dao.UserDao;
import com.web.entity.User;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by sukey on 2017/4/14.
 */
public class UserServiceImp implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void saveUser(User user) {
        user.setCreatetime(new Date());
        userDao.save(user);
    }

    @Override
    public User findUserByOpenid(String openid) {
        User queryUser = new User();
        queryUser.setOpenid(openid);
        List<User> users = userDao.findUsers(queryUser);
        if (users.size() > 0)
            return users.get(0);
        return null;
    }

    @Override
    public User findUser(String openid, String phone) {
        User queryUser = new User();
        queryUser.setOpenid(openid);
        queryUser.setPhone(phone);
        List<User> users = userDao.findUsers(queryUser);
        if (users.size() > 0)
            return users.get(0);
        return null;
    }
}
