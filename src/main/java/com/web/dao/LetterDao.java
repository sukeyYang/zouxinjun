package com.web.dao;

import java.util.*;

import com.common.BaseDao;
import com.web.entity.Letter;
import com.web.entity.OpenLetterRecord;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

/**
 * Created by sukey on 2017/4/14.
 */
@Repository
public class LetterDao extends BaseDao {

    public List<Letter> findLetters(Letter letter, int page, int pageSize) {
        StringBuilder sql = new StringBuilder();

        sql.append("From Letter where 1=1 ");
        if (StringUtils.isEmpty(letter.getOpenid())) {
            sql.append(" and openid =:openid ");
        }

        if (letter.getLength() != null && letter.getLength() > 0) {
            int maxLength = letter.getLength() * 2;
            int minLength = letter.getLength() / 2;
            sql.append(" and length >= ");
            sql.append(minLength);
            sql.append(" and length<= ");
            sql.append(maxLength);
        }

        if (letter.getGender() != null) {
            sql.append(" and gender =:gender ");
        }

        sql.append(" order by readTime asc, createtime desc");

        return findObjects(sql.toString(), letter, page, pageSize);

    }

    public List<Letter> findLetters(Letter letter) {
        StringBuilder sql = new StringBuilder();

        sql.append("From Letter where 1=1 ");
        if (StringUtils.isEmpty(letter.getOpenid())) {
            sql.append(" and openid =:openid ");
        }

        if (letter.getLength() != null && letter.getLength() > 0) {
            int maxLength = letter.getLength() * 2;
            int minLength = letter.getLength() / 2;
            sql.append(" and length >= ");
            sql.append(minLength);
            sql.append(" and length<= ");
            sql.append(maxLength);
        }

        if (letter.getGender() != null) {
            sql.append(" and gender =:gender ");
        }

        sql.append(" order by readTime asc, createtime desc");

        return findObjects(sql.toString(), letter);

    }

    public List<Map> findOpenLetterRecords(OpenLetterRecord record) {
        Map<String,String> map =new HashMap();
        StringBuilder sql = new StringBuilder();

        sql.append("select u.headimgurl,u.nickname,r.title,s.createTime from  ( select t.letterId,t.sender,t.receiver,t.createTime  open_letter_record t where 1=1 ");

        if (StringUtils.isEmpty(record.getReceiver())) {
            map.put("receiver",record.getReceiver());
            sql.append(" and receiver =:receiver ");
            if (record.getReceiverRead() != null) {
                map.put("receiverRead",String.valueOf(record.getReceiverRead()));
                sql.append(" and receiverRead =:receiverRead ");
            }
            sql.append(" ) s left join user u on s.receiver = u.openid left join letter r on s.letterId =  r.letterId ");

        }
        if (StringUtils.isEmpty(record.getSender())) {
            map.put("sender", record.getSender());
            sql.append(" and sender =:sender ");

            if (record.getSendRead() != null) {
                map.put("sendRead", String.valueOf(record.getSendRead()));
                sql.append(" and sendRead =:sendRead ");
            }
            sql.append(" ) s left join user u on s.sender = u.openid left join letter r on s.letterId =  r.letterId ");
        }
        sql.append(" order by s.createTime desc ");

        return findResult(sql.toString(), map);

    }

}
