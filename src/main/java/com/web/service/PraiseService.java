package com.web.service;

import com.web.entity.Praise;

/**
 * Created by YHLS on 2017/5/16.
 */
public interface PraiseService {
    public Boolean findPraiseRecord(Integer activityId, String openid);

    public void savePraise(Praise praise);
}
