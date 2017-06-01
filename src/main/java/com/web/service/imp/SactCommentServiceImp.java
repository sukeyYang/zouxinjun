package com.web.service.imp;

import java.util.List;

import com.web.dao.SactCommentDao;
import com.web.dao.SactDao;
import com.web.entity.SactComment;
import com.web.entity.SpontaneousActivity;
import com.web.service.SactCommentService;
import com.web.service.SactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by YHLS on 2017/5/15.
 */
@Service
public class SactCommentServiceImp implements SactCommentService {

    @Autowired
    private SactCommentDao sactCommentDao;


    @Override
    public void saveSactComment(SactComment sactComment) {
        sactCommentDao.save(sactComment);
    }

    public List<SactComment> findSactCommentList(int activityId) {
        SactComment sactComment = new SactComment();
        sactComment.setActivityId(activityId);
        return sactCommentDao.findSactCommentList(sactComment);
    }
}
