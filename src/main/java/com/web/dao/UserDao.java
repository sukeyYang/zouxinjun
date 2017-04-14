package com.web.dao;

import java.util.List;

import com.common.BaseDao;
import com.web.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

/**
 * Created by sukey on 2017/4/14.
 */
@Repository
public class UserDao extends BaseDao {

    public List<User> findUsers(User user) {
        StringBuilder sql = new StringBuilder();

        sql.append("From User where 1=1 ");
        if (StringUtils.isEmpty(user.getOpenid())) {
            sql.append(" and openid =:openid ");
        }

        if (StringUtils.isEmpty(user.getPhone())) {
            sql.append(" and phone =:phone ");
        }

        return findObjects(sql.toString(), user);

    }
}
