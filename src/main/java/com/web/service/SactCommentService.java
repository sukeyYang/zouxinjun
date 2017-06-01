package com.web.service;

import java.util.List;

import com.web.entity.SactComment;
import com.web.entity.SpontaneousActivity;

/**
 * Created by YHLS on 2017/5/15.
 */
public interface SactCommentService {

    public void saveSactComment(SactComment sactComment);

    //   通过活动id查找评论列表
    List<SactComment> findSactCommentList(int activityId);
}
