package com.web.service;

import java.util.List;

import com.web.entity.Letter;

/**
 * Created by sukey on 2017/4/14.
 */
public interface LetterService {

    void saveLetter(Letter letter);

    /**
     * 通过Id获取用户信件
     * @param id
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
    List<Letter> findMatchCaseLetter(String openid,int page,int pageSize);

    List<Letter> findLetters(Letter letter);


}
