package com.web.dao;

import java.util.List;

import com.common.BaseDao;
import com.web.entity.SactComment;
import com.web.entity.SpontaneousActivity;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by YHLS on 2017/5/15.
 */
@Repository
public class SactDao extends BaseDao {

    public List<SpontaneousActivity> findSact(SpontaneousActivity sact, int page, int pageSize) {
        StringBuilder sql = new StringBuilder();

        sql.append("From SpontaneousActivity where 1=1 ");

        return findObjects(sql.toString(), sact, page, pageSize);

    }

    /**
     * 根据id查询对象
     *
     * @return
     */
    public Object getObjectById(Integer id, SpontaneousActivity entity) {
        return sessionFactory.getCurrentSession().get(entity.getClass(), id);
    }

}
