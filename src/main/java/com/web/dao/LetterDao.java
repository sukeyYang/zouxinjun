package com.web.dao;

import java.util.List;

import com.common.BaseDao;
import com.web.entity.Letter;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

/**
 * Created by sukey on 2017/4/14.
 */
@Repository
public class LetterDao extends BaseDao {

   public  List<Letter> findLetters(Letter letter,int page,int pageSize) {
        StringBuilder sql = new StringBuilder();

        sql.append("From Letter where 1=1 ");
        if (StringUtils.isEmpty(letter.getOpenid())) {
            sql.append(" and openid =:openid ");
        }

        if (letter.getLength()!=null && letter.getLength()>0) {
            int maxLength =letter.getLength()*2;
            int minLength =letter.getLength()/2;
            sql.append(" and length >= ");
            sql.append(minLength);
            sql.append(" and length<= ");
            sql.append(maxLength);
        }

        if (letter.getGender() !=null ) {
            sql.append(" and gender =:gender ");
        }

        sql.append( " order by readTime asc, createtime desc");

        return findObjects(sql.toString(),letter,page,pageSize);

    }

    public  List<Letter> findLetters(Letter letter) {
           StringBuilder sql = new StringBuilder();

           sql.append("From Letter where 1=1 ");
           if (StringUtils.isEmpty(letter.getOpenid())) {
               sql.append(" and openid =:openid ");
           }

           if (letter.getLength()!=null && letter.getLength()>0) {
               int maxLength =letter.getLength()*2;
               int minLength =letter.getLength()/2;
               sql.append(" and length >= ");
               sql.append(minLength);
               sql.append(" and length<= ");
               sql.append(maxLength);
           }

           if (letter.getGender() !=null ) {
               sql.append(" and gender =:gender ");
           }

           sql.append( " order by readTime asc, createtime desc");

           return findObjects(sql.toString(),letter);

       }

}
