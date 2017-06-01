package com.web.dao;

import java.util.List;

import com.common.BaseDao;
import com.web.entity.SactComment;
import org.springframework.stereotype.Repository;

/**
 * Created by YHLS on 2017/5/15.
 */
@Repository
public class SactCommentDao extends BaseDao {

    public List<SactComment> findSactCommentList(SactComment sactComment) {
        StringBuilder sql = new StringBuilder();

        sql.append("From SactComment where 1=1 ");
        if (sactComment.getActivityId() != null) {
            sql.append(" and activityId =:activityId ");
        }

        sql.append(" order by createTime desc");

        return findObjects(sql.toString(), sactComment);
    }


}
