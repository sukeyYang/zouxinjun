package com.web.service.imp;

import java.util.List;

import com.web.dao.ParticipantDao;
import com.web.dao.PraiseDao;
import com.web.entity.Participant;
import com.web.service.ParticipantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by YHLS on 2017/5/17.
 */
@Service
public class ParticipantServiceImp implements ParticipantService {

    @Autowired
    private ParticipantDao participantDao;

    @Override
    public Boolean findJoinRecord(Integer activityId, String openid) {
        Participant participant = new Participant();
        participant.setActivityId(activityId);
        participant.setOpenid(openid);
        List<Participant> list = participantDao.findJoinRecord(participant);
        if (list.size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public void saveParticipant(Participant participant) {
        participantDao.save(participant);
    }

    public List findParticipant(String originator) {
        Participant participant = new Participant();
        participant.setOriginator(originator);
        List list = participantDao.findParticipant(participant);
        return list;
    }

    public List findOriginator(String openid) {
        Participant participant = new Participant();
        participant.setOpenid(openid);
        List list = participantDao.findOriginator(participant);
        return list;
    }
}
