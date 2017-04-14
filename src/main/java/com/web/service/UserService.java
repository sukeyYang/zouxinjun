package com.web.service;

import com.web.entity.User;

/**
 * Created by sukey on 2017/4/14.
 */
public interface UserService {

    /**
     * 保存用户信息
     * @param user
     */
    void saveUser(User user);


    /**
     * 通过Openid查询用户信息
     * @param openid
     * @return
     */
    User findUserByOpenid(String openid);

    /**
     *  通过Openid、phone查询用户信息
     * @param openid
     * @param phone
     * @return
     */
       User findUser(String openid,String phone);

}
