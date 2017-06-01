package com.web.service.imp;

import java.util.List;

import com.web.dao.SactDao;
import com.web.entity.SactComment;
import com.web.entity.SpontaneousActivity;
import com.web.service.SactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by YHLS on 2017/5/15.
 */
@Service
public class SactServiceImp implements SactService {

    @Autowired
    private SactDao sactDao;


    @Override
    public void saveSpontaneousActivity(SpontaneousActivity spontaneousActivity) {
        sactDao.save(spontaneousActivity);
    }

    @Override
    public List<SpontaneousActivity> findSactList(int page, int pageSize) {
        SpontaneousActivity sact = new SpontaneousActivity();
        return sactDao.findSact(sact, page, pageSize);
    }

//    @Override
//    public SpontaneousActivity findSactById(int id) {
//        SpontaneousActivity sact = new SpontaneousActivity();
//        sact.setId(id);
//
//       List<SpontaneousActivity> list= sactDao.findSact(sact,0,0);
//
//       if(list.size()>0){
//           return list.get(0);
//       }else{
//           return  null;
//       }
//
//    }

    @Override
    public SpontaneousActivity findSactById(int id) {

        SpontaneousActivity object =new SpontaneousActivity();
        SpontaneousActivity result = (SpontaneousActivity)sactDao.getObjectById(id,object);
        return  result;
    }

}
