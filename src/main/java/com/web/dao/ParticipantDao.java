package com.web.dao;

import java.util.*;

import com.common.BaseDao;
import com.web.entity.Participant;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

/**
 * Created by YHLS on 2017/5/17.
 */
@Repository
public class ParticipantDao extends BaseDao {

    public List findJoinRecord(Participant participant) {

        StringBuilder sql = new StringBuilder();
        sql.append("From Participant where 1=1 ");

        if (!StringUtils.isEmpty(participant.getOpenid())) {
            sql.append(" and openid=:openid ");
        }

        if (participant.getActivityId() != null) {
            sql.append(" and activityId=:activityId ");
        }

        return findObjects(sql.toString(), participant);
    }

    public List findParticipant(Participant participant) {

        Map<String, String> param = new HashMap<>();
        param.put("originator", participant.getOriginator());

        StringBuilder sql = new StringBuilder();
        sql.append("select t.activityId,s.nickname,u.phone,s.headImage,s.title,s.content,s.numOfPeople,s.numOfCheck,s.numOfComment,s.numOfLiked,s.createTime from ");
        sql.append(" (select * from participant where originator=:originator ) as t ");
        sql.append(" left join user u on u.openid=t.originator ");
        sql.append(" left join spontaneousActivity s on t.activityId = s.id ");
        return findResult(sql.toString(), param);
    }

    public List findOriginator(Participant participant) {

        Map<String, String> param = new HashMap<>();
        param.put("openid", participant.getOpenid());

        StringBuilder sql = new StringBuilder();
        sql.append("select t.activityId,s.nickname,u.phone,s.headImage,s.title,s.content,s.numOfPeople,s.numOfCheck,s.numOfComment,s.numOfLiked,s.createTime from ");
        sql.append(" (select * from participant where openid=:openid ) as t ");
        sql.append(" left join user u on u.openid=t.openid ");
        sql.append(" left join spontaneousActivity s on t.activityId = s.id ");
        return findResult(sql.toString(), param);
    }
}
