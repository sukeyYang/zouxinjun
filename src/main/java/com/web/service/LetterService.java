package com.web.service;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import com.web.entity.*;

/**
 * Created by sukey on 2017/4/14.
 */
public interface LetterService {

    /**
     * 保存、更新信件
     *
     * @param letter
     */
    void saveLetter(Letter letter);

    /**
     * 通过Id获取用户信件
     *
     * @param id
     *
     * @return
     */
    Letter findLetterById(int id);

    /**
     * 通过openid查询用户提交的信件
     *
     * @param openid
     *
     * @return
     */
    List<Letter> findLetterByOpenid(String openid);


    /**
     * 通过openid 、字数查询与该用户匹配信件
     *
     * @param openid
     *
     * @return
     */
    List<Letter> findMatchCaseLetter(String openid, int page, int pageSize);

    /**
     * 自定义查询letter;
     *
     * @param letter
     *
     * @return
     */
    List<Letter> findLetters(Letter letter);

    /**
     * 保存用户已打开的信件记录
     *
     * @param openLetterRecord
     */
    void saveOpenLetter(OpenLetterRecord openLetterRecord);


    /**
     * 统计用户未读的消息记录
     *
     * @param openid
     *
     * @return
     */
    BigInteger countLetterRecord(String openid);


    /**
     * 更新发信人未读的消息记录
     *
     * @param openid
     *
     * @return
     */
    void updateReceiverReadStatus(String openid);

    /**
     * 更新拆信者未读消息状态
     *
     * @param openid
     *
     * @return
     */
    void updateSenderReadStatus(String openid);

    /**
     * 查询消息通知
     *
     * @param senderOpenid
     *
     * @return
     */
    List<Map> findLetterRecordList(String senderOpenid);


    /**
     * 保存用户已打开的信件记录
     *
     * @param userLetterRecord
     */
    void saveUserLetterRecord(UserLetterRecord userLetterRecord);


    /**
     * 保存用户已打开的信件记录
     *
     * @param openid
     */
    UserLetterRecord findUserLetterRecord(String openid);


}
