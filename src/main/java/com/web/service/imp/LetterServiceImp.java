package com.web.service.imp;

import java.util.*;

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
        return (Letter) letterDao.getObjectById(id, new Letter());
    }

    @Override
    public List<Letter> findLetterByOpenid(String openid) {
        Letter letter = new Letter();
        letter.setOpenid(openid);

        return letterDao.findLetters(letter);
    }

    @Override
    public List<Letter> findMatchCaseLetter(String openid, int page, int pageSize) {
        Letter letter = new Letter();
        letter.setOpenid(openid);
        List<Letter> userLetters = letterDao.findLetters(letter);
        if (userLetters.size() > 0) {
            Letter userLetter = userLetters.get(0);
            letter.setGender(userLetter.getGender());
            letter.setLength(userLetter.getLength());
        }

        return letterDao.findLetters(letter, page, pageSize);
    }

    @Override
    public void saveOpenLetter(OpenLetterRecord openLetterRecord) {
        letterDao.save(openLetterRecord);
    }


    @Override
    public int countLetterRecord(String openid) {
        return letterDao.countOpenLetterRecords(openid);
    }

    @Override
    public void updateReceiverReadStatus(String openid) {
        letterDao.updateReceiverReadStatus(openid);
    }

    @Override
    public void updateSenderReadStatus(String openid) {
        letterDao.updateSenderReadStatus(openid);
    }

    @Override
    public List<Map> findLetterRecordList(String openid) {
        Map<String, String> map = new HashMap<>();
        map.put("openid", openid);
        List<Map> records = letterDao.findOpenLetterRecords(map);

        return records;
    }

    @Override
    public void saveUserLetterRecord(UserLetterRecord record) {
        letterDao.save(record);
    }

    @Override
    public UserLetterRecord findUserLetterRecord(String openid) {
        UserLetterRecord record = new UserLetterRecord();

        record.setOpenid(openid);

        List<UserLetterRecord> userLetterRecords = letterDao.findUserLetterRecord(record);
        if (userLetterRecords.size() > 0) {
            return userLetterRecords.get(0);
        }

        return null;
    }


    @Override
    public List<Letter> findLetters(Letter letter) {
        return letterDao.findLetters(letter);
    }
}
