package com.web.service;

import java.util.List;

import com.web.entity.Participant;

/**
 * Created by YHLS on 2017/5/17.
 */
public interface ParticipantService {

    public Boolean findJoinRecord(Integer activityId, String openid);

    public void saveParticipant(Participant participant);

    public List findParticipant(String originator);

    public List findOriginator(String openid);
}
