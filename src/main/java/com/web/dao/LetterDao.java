package com.web.dao;

import java.math.BigInteger;
import java.util.*;

import com.common.BaseDao;
import com.web.entity.*;
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


        if (letter.getLength() != null && letter.getLength() > 0) {
            int maxLength = letter.getLength() * 2;
            int minLength = letter.getLength() / 2;
            sql.append(" and length >= ");
            sql.append(minLength);
            sql.append(" and length<= ");
            sql.append(maxLength);
        }

        if (letter.getGender() != null) {
            sql.append(" and gender !=:gender ");
        }
        sql.append("and id not in (select letterId from OpenLetterRecord where receiver = :openid ) ");


        sql.append(" order by readTime asc, createtime desc");

        return findObjects(sql.toString(), letter, page, pageSize);

    }

    public List<Letter> findLetters(Letter letter) {
        StringBuilder sql = new StringBuilder();

        sql.append("From Letter where 1=1 ");
        if (!StringUtils.isEmpty(letter.getOpenid())) {
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
            sql.append(" and gender !=:gender ");
        }

        sql.append("and id not in (select letterId from OpenLetterRecord where receiver =:openid ) ");

        sql.append(" order by readTime asc, createtime desc");

        return findObjects(sql.toString(), letter);

    }

    public List<Map> findOpenLetterRecords(Map<String, String> queryCondition) {

        StringBuilder sql = new StringBuilder();

        sql.append("select u.headimgurl,u.nickname,r.title,r.content,r.phone,DATE_FORMAT(s.createTime, '%Y-%m-%d %k:%i:%s' ) AS createtime from  ( select t.letterId,t.sender,t.receiver,t.createTime from open_letter_record t where 1=1 ");

        sql.append(" and receiver =:openid or sender =:openid ");

        sql.append(" ) s left join user u on s.receiver = u.openid left join letter r on s.letterId =  r.id ");


        sql.append(" order by s.createTime desc ");

        return findResult(sql.toString(), queryCondition);

    }

    public List<Map> findOpenLetterRecords(OpenLetterRecord record) {
        Map<String, String> map = new HashMap();
        StringBuilder sql = new StringBuilder();

        sql.append("select u.headimgurl,u.nickname,u.phone as uphone,r.title,r.content,r.phone,s.receiverRead,s.senderRead,DATE_FORMAT(s.createTime, '%Y-%m-%d' ) AS createtime from  ( select t.letterId,t.sender,t.receiver,t.receiverRead,t.senderRead,t.createTime from open_letter_record t where 1=1 ");

        if (!StringUtils.isEmpty(record.getReceiver())) {
            map.put("receiver", record.getReceiver());
            sql.append(" and receiver =:receiver ");
            if (record.getReceiverRead() != null) {
                map.put("receiverRead", String.valueOf(record.getReceiverRead()));
                sql.append(" and receiverRead =:receiverRead ");
            }
            sql.append(" ) s left join user u on s.sender = u.openid left join letter r on s.letterId =  r.id ");

        }
        if (!StringUtils.isEmpty(record.getSender())) {
            map.put("sender", record.getSender());
            sql.append(" and sender =:sender ");

            if (record.getSenderRead() != null) {
                map.put("senderRead", String.valueOf(record.getSenderRead()));
                sql.append(" and senderRead =:senderRead ");
            }
            sql.append(" ) s left join user u on s.receiver = u.openid left join letter r on s.letterId =  r.id ");
        }
        sql.append(" order by s.createTime desc ");

        return findResult(sql.toString(), map);

    }

    public BigInteger countOpenLetterRecords(String openid) {
        Map<String, String> map = new HashMap();
        StringBuilder sql = new StringBuilder();
        map.put("openid", openid);
        sql.append("select count(*) from  open_letter_record t where ( receiver =:openid and receiverRead=0 ) or ( sender =:openid and senderRead=0 ) ");

        return (BigInteger) getUniqueResult(sql.toString(), map);

    }

    public void updateSenderReadStatus(String openid) {
        Map<String, String> map = new HashMap();
        StringBuilder sql = new StringBuilder();
        map.put("openid", openid);
        sql.append("update  open_letter_record set senderRead = 1 where  sender =:openid and senderRead=0  ");

        executeSql(sql.toString(), map);

    }

    public void updateReceiverReadStatus(String openid) {
        Map<String, String> map = new HashMap();
        StringBuilder sql = new StringBuilder();
        map.put("openid", openid);
        sql.append("update  open_letter_record set receiverRead = 1 where  receiver =:openid and receiverRead=0  ");

        executeSql(sql.toString(), map);

    }


    public List<UserLetterRecord> findUserLetterRecord(UserLetterRecord record) {
        StringBuilder sql = new StringBuilder();

        sql.append("From UserLetterRecord where 1=1 ");
        if (!StringUtils.isEmpty(record.getOpenid())) {
            sql.append(" and openid =:openid ");
        }

        return findObjects(sql.toString(), record);

    }

}
