package com.web.service;

import java.util.List;

import com.web.entity.SactComment;
import com.web.entity.SpontaneousActivity;

/**
 * Created by YHLS on 2017/5/15.
 */
public interface SactService {

    public void saveSpontaneousActivity(SpontaneousActivity spontaneousActivity);

    public List<SpontaneousActivity> findSactList(int page, int pageSize);

//    public SpontaneousActivity findSactById(int id);

    /**
     * 通过Id获取对应活动
     *
     * @param id
     *
     * @return
     */
    SpontaneousActivity findSactById(int id);


}
