package com.web.dao;

import java.util.*;

import com.common.BaseDao;
import com.web.entity.Praise;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

/**
 * Created by YHLS on 2017/5/16.
 */
@Repository
public class PraiseDao extends BaseDao {

    public List findPraiseRecord(Praise praise) {

        StringBuilder sql = new StringBuilder();
        sql.append("From Praise where 1=1 ");

        if (!StringUtils.isEmpty(praise.getOpenid())){
            sql.append(" and openid=:openid ");
        }

        if(praise.getActivityId()!=null){
            sql.append(" and activityId=:activityId");
        }

        return findObjects(sql.toString(),praise);
    }
}
