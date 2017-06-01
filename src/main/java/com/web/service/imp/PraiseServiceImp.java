package com.web.service.imp;

import java.util.List;

import com.web.dao.PraiseDao;
import com.web.entity.Praise;
import com.web.service.PraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by YHLS on 2017/5/16.
 */
@Service
public class PraiseServiceImp implements PraiseService {

    @Autowired
    private PraiseDao praiseDao;

    @Override
    public Boolean findPraiseRecord(Integer activityId, String openid) {
        Praise praise = new Praise();
        praise.setActivityId(activityId);
        praise.setOpenid(openid);
        List<Praise> list = praiseDao.findPraiseRecord(praise);
        if (list.size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public void savePraise(Praise praise) {
        praiseDao.save(praise);
    }
}
