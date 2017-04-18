package com.web.service;

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
    void saveOpenLetterService(OpenLetterRecord openLetterRecord);

    /**
     * 查询用户已打开的信件记录
     *
     * @param receiverOpenid
     *
     * @return
     */
    MessageRecords findOpenLetterList(String receiverOpenid);

    /**
     * 查询b被取走的信件
     *
     * @param senderOpenid
     *
     * @return
     */
    MessageRecords findTakeAwayLetterList(String senderOpenid);


}
