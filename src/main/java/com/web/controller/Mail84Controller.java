package com.web.controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utils.StringUtil;
import com.web.entity.*;
import com.web.service.LetterService;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * Created by YHLS on 2017/4/12.
 */
@Controller
@RequestMapping("/activity")
public class Mail84Controller {

    @Autowired
    private LetterService letterService;

    @Autowired
    private UserService userService;

    //判断用户是否为新用户，并将标识传回前台
    @RequestMapping("/index")
    public String index(HttpServletRequest request,
                        HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        User someone = userService.findUserByOpenid(openid);
        if (someone == null) {
            someone = new User();
            someone.setCreatetime(new Date());
            someone.setOpenid(openid);
            someone.setNickname("Alan");
            someone.setSex(1);
            someone.setHeadimgurl("http://wx.qlogo.cn/mmopen/2ZOQOHfxjxIq8I5ls5KXkJKYMxZuzxTcWM5ibThBxzH5dYGfU5gawg4hl9iaZ8BKSUxib0SaOfEFl1q0ibjXKN1ib2Vb2vGz4ibvKc/0");
            someone.setSubscribe(0);
            request.setAttribute("isNew", 1);
//            return "redirect:wechat/login/activity/index";
        } else if (StringUtils.isEmpty(someone.getPhone())) {
            request.setAttribute("isNew", 1);
        } else {
            request.setAttribute("isNew", 0);
        }
        //统计用户的未读信息
        request.setAttribute("userRecord", letterService.countLetterRecord(openid));
        return "/jsp/index";
    }

    //对新用户提交的完善信息进行保存
    @RequestMapping(value = "/saveUserinfo", method = RequestMethod.POST)
    @ResponseBody
    public String saveUserInfo(HttpServletRequest request,
                               HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        User someone = userService.findUserByOpenid(openid);
        String school = request.getParameter("school");
        String phone = request.getParameter("phone");
        String wechatId = request.getParameter("wechatId");
        someone.setSchool(school);
        someone.setPhone(phone);
        someone.setWechatId(wechatId);
        userService.saveUser(someone);
        return "ok";
    }

    @RequestMapping("/aboutUs")
    public String aboutUs(HttpServletRequest request,
                          HttpServletResponse response) {
        return "/jsp/aboutUs";
    }

    @RequestMapping("/mainActivity")
    public String mainActivity(HttpServletRequest request,
                               HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        //准备加载一个letterlist
        List<Letter> letterList = letterService.findMatchCaseLetter(openid, 1, 10);
        request.setAttribute("letterList", letterList);
        //计算用户的拆信机会
        request.setAttribute("flag", 0);
        UserLetterRecord userRecord = letterService.findUserLetterRecord(openid);
        if (userRecord == null) {
            userRecord = new UserLetterRecord();
            userRecord.setOpenid(openid);
            userRecord.setLetterNumber(0);
            userRecord.setCreateTime(new Date());
            userRecord.setOpenTime(0);
            letterService.saveUserLetterRecord(userRecord);
        }
        int sendRecord = userRecord.getLetterNumber();
        int receiveRecord = userRecord.getOpenTime();
        if (sendRecord > receiveRecord) {
            request.setAttribute("flag", sendRecord - receiveRecord);
        }
        //统计用户未读的消息记录
        request.setAttribute("userRecord", letterService.countLetterRecord(openid));
        return "/jsp/mainActivity";
    }

    //下拉预加载letterlist
    @RequestMapping(value = "/moreLetters", method = RequestMethod.POST)
    @ResponseBody
    public List<Letter> saveMessage(HttpServletRequest request, HttpServletResponse response) {
        String p = request.getParameter("page");
        int page = Integer.parseInt(p);
        String openid = (String) request.getSession().getAttribute("openid");
        List<Letter> letterList = letterService.findMatchCaseLetter(openid, page, 10);
        return letterList;
    }

    //对用户发布的信件进行保存（新建记录）
    @RequestMapping(value = "/saveLetter", method = RequestMethod.POST)
    @ResponseBody
    public String saveLetter(HttpServletRequest request, HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Letter letter = new Letter();
        letter.setTitle(title);
        letter.setContent(content);
        letter.setOpenid(openid);
        letter.setCreateTime(new Date());
        User someone = userService.findUserByOpenid(openid);
        letter.setGender(someone.getSex());
        letter.setHeadImage(someone.getHeadimgurl());
        letter.setLength(content.length());
        letter.setNickname(someone.getNickname());
        letter.setPhone(someone.getPhone());
        letter.setSchool(someone.getSchool());
        letter.setReadTime(0);
        letterService.saveLetter(letter);
        //用户的发信次数+1，用于计算用户的拆信机会
        UserLetterRecord userSend = letterService.findUserLetterRecord(openid);
        userSend.setLetterNumber(userSend.getLetterNumber() + 1);
        letterService.saveUserLetterRecord(userSend);
        return "ok";
    }

    //保存用户领取信件的记录
    @RequestMapping(value = "/userReceive", method = RequestMethod.POST)
    @ResponseBody
    public String openLetter(HttpServletRequest request, HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        String sender = request.getParameter("sender");
//        User someone = userService.findUserByOpenid(sender);
//        String senderName = someone.getNickname();
//        String senderName = request.getParameter("senderName");
        String letterId = request.getParameter("letterId");
        OpenLetterRecord openRecord = new OpenLetterRecord();
        openRecord.setSender(sender);
        openRecord.setReceiver(openid);
        openRecord.setLetterId(letterId);
        openRecord.setSenderRead(0);
        openRecord.setReceiverRead(0);
        openRecord.setCreateTime(new Date());
        letterService.saveOpenLetter(openRecord);
        UserLetterRecord userReceive = letterService.findUserLetterRecord(openid);
        //用户只有先发信件才能领取信件，所以userReceive不可能为空
        //用户的拆信次数+1
        userReceive.setOpenTime(userReceive.getOpenTime() + 1);
        letterService.saveUserLetterRecord(userReceive);
        return "ok";
    }

    @RequestMapping("/message")
    public String message(HttpServletRequest request,
                          HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        request.setAttribute("userRecord", letterService.countLetterRecord(openid));
        return "/jsp/message";
    }

    @RequestMapping("/mainMessage")
    public String mainMessage(HttpServletRequest request,
                              HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        //用户领取信件的记录
        List<Map> openLetterList = letterService.findOpenLetterList(openid);
        request.setAttribute("openLetterList", openLetterList);
        //用户信件被领取的记录
        List<Map> takeAwayLetterList = letterService.findTakeAwayLetterList(openid);
        request.setAttribute("takeAwayLetterList", takeAwayLetterList);
        //更新状态
        letterService.updateReceiverReadStatus(openid);
        letterService.updateSenderReadStatus(openid);
        return "/jsp/mainMessage";
    }

    @RequestMapping("/personalData")
    public String personalData(HttpServletRequest request,
                               HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        User someone = userService.findUserByOpenid(openid);
        request.setAttribute("headimgurl", someone.getHeadimgurl());
        request.setAttribute("nickname", someone.getNickname());
        request.setAttribute("school", someone.getSchool());
        request.setAttribute("phone", someone.getPhone());
        return "/jsp/personalData";
    }

    //保存用户修改的个人资料
    @RequestMapping(value = "/changeUserinfo", method = RequestMethod.POST)
    @ResponseBody
    public String changeUserInfo(HttpServletRequest request,
                                 HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        User someone = userService.findUserByOpenid(openid);
        String school = request.getParameter("school");
        String phone = request.getParameter("phone");
        if (school != null && !"".equals(school.trim())) {
            someone.setSchool(school);
        }
        if (!StringUtil.isStrTrimEmpty(phone)) {
            someone.setPhone(phone);
        }
        userService.saveUser(someone);
        return "ok";
    }

    @RequestMapping("/pushMessage")
    public String pushMessage(HttpServletRequest request,
                              HttpServletResponse response) {
        return "/jsp/pushMessage";
    }

    @RequestMapping("/suggestion")
    public String suggestion(HttpServletRequest request,
                             HttpServletResponse response) {
        return "/jsp/suggestion";
    }

    @RequestMapping("/user")
    public String user(HttpServletRequest request,
                       HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        User someone = userService.findUserByOpenid(openid);
        request.setAttribute("headimgurl", someone.getHeadimgurl());
        request.setAttribute("nickname", someone.getNickname());
        request.setAttribute("school", someone.getSchool());
        return "/jsp/user";
    }

}

