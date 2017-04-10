/**
 *
 */
package com.common;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("BaseDao")
public abstract class BaseDao {

    @Autowired
    protected SessionFactory sessionFactory;

    /**
     * 保存或者更新实体
     */
    public void save(Object entry) {
        Session session = sessionFactory.openSession();
        Transaction ts = session.beginTransaction();
        session.saveOrUpdate(entry);
        ts.commit();
        session.close();
        //sessionFactory.getCurrentSession().saveOrUpdate(entry);
    }

    public void saveBatch(List list) {
        Session session = sessionFactory.openSession();
        Transaction ts = session.beginTransaction();
        for (Object entry : list) {
            session.saveOrUpdate(entry);
        }
        ts.commit();
        session.close();
        //sessionFactory.getCurrentSession().saveOrUpdate(entry);
    }

    /**
     * 根据sql返回单个查询结果
     *
     * @param sql
     *
     * @return
     */
    public Object getUniqueResult(String sql) {
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        return query.uniqueResult();
    }

    /**
     * 根据sql和param返回单个查询结果
     *
     * @param sql
     * @param param
     *
     * @return
     */
    public Object getUniqueResult(String sql, Map param) {
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        query.setProperties(param);
        return query.uniqueResult();
    }

    /**
     * 查询对象集合
     *
     * @param sql
     * @param entry
     *
     * @return
     */
    public List findObjects(String sql, Object entry) {
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setProperties(entry);
        return query.list();
    }

    /**
     * 删除方法（参数必须是ids）
     *
     * @param sql
     * @param ids
     */
    public void removeByIds(String sql, List<Integer> ids) {
        Query query = sessionFactory.getCurrentSession().createQuery(sql);
        query.setParameterList("ids", ids);
        query.executeUpdate();
    }

    /**
     * 删除对象
     *
     * @param entry
     */
    public void remove(Object entry) {
        //sessionFactory.getCurrentSession().delete(entry);
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if (null != entry) {
            session.delete(entry);//删除对象
        }
        tx.commit();
        session.close();//从缓存中删，也就是把持久化对象变为游离态
    }

    /**
     * 根据id查询对象
     *
     * @return
     */
    public Object getObjectById(Integer id, Object entity) {
        return sessionFactory.getCurrentSession().get((Class) entity, id);
    }

    /**
     * 查询方法（页面表格用）
     *
     * @param sql   sql
     * @param param 参数
     *
     * @return
     */
    public SearchTemplate search(String sql, Map param) {
        SearchTemplate template = new SearchTemplate(sql);
        Query query = sessionFactory.getCurrentSession().createSQLQuery(template.getOrderSql(param));
        if (param.get("page") != null && param.get("pageSize") != null) {
            int page = Integer.parseInt(param.get("page").toString());
            int pageSize = Integer.parseInt(param.get("pageSize").toString());
            query.setFirstResult(page == 1 ? 0 : (page - 1) * pageSize);
            query.setMaxResults(pageSize);
        }
        query.setProperties(param);
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        template.setValues(query.list());
        // 总条数
        query = sessionFactory.getCurrentSession().createSQLQuery(template.getCountSql());
        query.setProperties(param);
        template.setCount(((BigInteger) query.uniqueResult()).intValue());
        return template;
    }

    /**
     * 高级查询方法（页面表格用）
     *
     * @param sql   sql
     * @param param 参数
     *
     * @return
     */
    public SearchTemplate searchadvanced(String sql, Map param) {
        SearchTemplate template = new SearchTemplate(sql);
        Query query = sessionFactory.getCurrentSession().createSQLQuery(template.getAdvancedSql(param));
        if (param.get("page") != null && param.get("pageSize") != null) {
            int page = Integer.parseInt(param.get("page").toString());
            int pageSize = Integer.parseInt(param.get("pageSize").toString());
            query.setFirstResult(page == 1 ? 0 : (page - 1) * pageSize);
            query.setMaxResults(pageSize);
        }
        query.setProperties(param);
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        template.setValues(query.list());
        // 总条数
        query = sessionFactory.getCurrentSession().createSQLQuery(template.getCountSql());
        query.setProperties(param);
        template.setCount(((BigInteger) query.uniqueResult()).intValue());
        return template;
    }

    /**
     * 根据sql查询返回List<Map>
     *
     * @param sql   sql
     * @param param 参数
     *
     * @return
     */
    public List findResult(String sql, Map param) {
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        query.setProperties(param);
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        return query.list();
    }

    /**
     * 根据sql查询返回List<Entity>
     *
     * @param sql
     * @param param
     * @param entry
     *
     * @return
     */
    public List findObjects(String sql, Map param, Class entry) {
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(entry);
        query.setProperties(param);
        return query.list();
    }

    /**
     * 执行sql操作语句
     *
     * @param sql
     * @param params
     */
    public void executeSql(String sql, Map params) {
        try {
            Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
            query.setProperties(params);
            query.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
