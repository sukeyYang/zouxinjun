package com.web.service.imp;

import java.util.List;
import java.util.Map;

import com.web.dao.LetterDao;
import com.web.entity.*;
import com.web.service.LetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by sukey on 2017/4/14.
 */

@Service
public class LetterServiceImp implements LetterService {

    @Autowired
    private LetterDao letterDao;

    @Override
    public void saveLetter(Letter letter) {
        letterDao.save(letter);
    }

    @Override
    public Letter findLetterById(int id) {
        return (Letter)letterDao.getObjectById(id,new Letter());
    }

    @Override
    public List<Letter> findLetterByOpenid(String openid) {
        Letter letter =new Letter();
        letter.setOpenid(openid);

        return letterDao.findLetters(letter);
    }

    @Override
    public List<Letter> findMatchCaseLetter(String openid,int page,int pageSize) {
        Letter letter =new Letter();
        letter.setOpenid(openid);
        List<Letter> userLetters = letterDao.findLetters(letter);
        if(userLetters.size()>0){
            Letter userLetter = userLetters.get(0);
            letter.setGender(userLetter.getGender());
            letter.setLength(userLetter.getLength());
        }

        return letterDao.findLetters(letter,page,pageSize);
    }

    @Override
    public void saveOpenLetterService(OpenLetterRecord openLetterRecord) {
        letterDao.save(openLetterRecord);
    }

    @Override
    public MessageRecords findOpenLetterList(String openid) {
        OpenLetterRecord record = new OpenLetterRecord();
        record.setReceiver(openid);
        List<Map> records = letterDao.findOpenLetterRecords(record);
        record.setReceiverRead(0);
        List<Map> unreadRecords = letterDao.findOpenLetterRecords(record);
        MessageRecords messageRecords =new MessageRecords();
        messageRecords.setRecordList(records);
        messageRecords.setUnreadRecord(unreadRecords.size());

        return messageRecords;
    }

    @Override
    public MessageRecords findTakeAwayLetterList(String senderOpenid) {
        OpenLetterRecord record = new OpenLetterRecord();
        record.setSender(senderOpenid);
        List<Map> records = letterDao.findOpenLetterRecords(record);
        record.setSenderRead(0);
        List<Map> unreadRecords = letterDao.findOpenLetterRecords(record);
        MessageRecords messageRecords =new MessageRecords();
        messageRecords.setRecordList(records);
        messageRecords.setUnreadRecord(unreadRecords.size());

        return messageRecords;
    }


    @Override
    public List<Letter> findLetters(Letter letter) {
        return letterDao.findLetters(letter);
    }
}
