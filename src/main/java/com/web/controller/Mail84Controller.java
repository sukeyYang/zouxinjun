package com.web.controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.utils.HttpUtil;
import com.utils.StringUtil;
import com.web.entity.*;
import com.web.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import static com.utils.getAccessTokenUtil.getAccessToken;
import static com.utils.getAccessTokenUtil.sendTemplate;
import static com.utils.getAccessTokenUtil.sendTemplates;

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

    @Autowired
    private SactService sactService;

    @Autowired
    private SactCommentService sactCommentService;

    @Autowired
    private PraiseService praiseService;

    @Autowired
    private ParticipantService participantService;

    @RequestMapping("/index")
    public String index(HttpServletRequest request,
                        HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
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
//        String wechatId = request.getParameter("wechatId");
        someone.setSchool(school);
        someone.setPhone(phone);
//        someone.setWechatId(wechatId);
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
        //验证是否为新用户
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
    public List<Letter> moreLetters(HttpServletRequest request, HttpServletResponse response) {
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
        //发送模板消息
        String accessToken = getAccessToken();
        String rest = sendTemplate(accessToken, sender);
        System.out.println(rest);
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

    @RequestMapping("/secondaryActivity")
    public String secondaryActivity(HttpServletRequest request,
                                    HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        //验证是否为新用户
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
        // 准备加载一个自发活动列表
        List<SpontaneousActivity> sactList = sactService.findSactList(1, 10);
        request.setAttribute("sactList", sactList);
        return "/jsp/secondaryActivity";
    }

    //下拉预加载letterlist
    @RequestMapping(value = "/moreSactList", method = RequestMethod.POST)
    @ResponseBody
    public List<SpontaneousActivity> moreSactList(HttpServletRequest request, HttpServletResponse response) {
        int page = Integer.parseInt(request.getParameter("page"));
        List<SpontaneousActivity> sactList = sactService.findSactList(page, 10);
        return sactList;
    }

    //保存自发活动
    @RequestMapping("/saveActivities")
    @ResponseBody
    public String saveActivities(HttpServletRequest request, HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Integer numOfPeople = Integer.parseInt(request.getParameter("numOfPeople"));
        User someone = userService.findUserByOpenid(openid);
        SpontaneousActivity sact = new SpontaneousActivity();
        sact.setTitle(title);
        sact.setContent(content);
        sact.setNumOfPeople(numOfPeople);
        sact.setOpenid(openid);
        sact.setNickname(someone.getNickname());
        sact.setHeadImage(someone.getHeadimgurl());
        sact.setPhone(someone.getPhone());
        sact.setNumOfCheck(0);
        sact.setNumOfComment(0);
        sact.setNumOfLiked(0);
        sact.setCreateTime(new Date());
        sactService.saveSpontaneousActivity(sact);
        return "ok";
    }

    //点击自发活动列表，被查看次数+1，准备加载评论列表
    @RequestMapping(value = "/sactCommentDetails", method = RequestMethod.POST)
    @ResponseBody
    public List<SactComment> sactCommentDetails(HttpServletRequest request, HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        int activityId = Integer.parseInt(request.getParameter("activityId"));
        //被查看次数+1
        SpontaneousActivity sact = sactService.findSactById(activityId);
        sact.setNumOfCheck(sact.getNumOfCheck() + 1);
        sactService.saveSpontaneousActivity(sact);
        //准备加载评论列表
        List<SactComment> sactCommentList = sactCommentService.findSactCommentList(activityId);
        return sactCommentList;
    }

    //保存自发活动的评论
    @RequestMapping("/saveSactComment")
    @ResponseBody
    public SactComment saveSactComment(HttpServletRequest request, HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        Integer activityId = Integer.parseInt(request.getParameter("activityId"));
        String commentText = request.getParameter("commentText");
        User someone = userService.findUserByOpenid(openid);
        String headimgurl = someone.getHeadimgurl();
        String nickname = someone.getNickname();
        SactComment sactComment = new SactComment();
        sactComment.setActivityId(activityId);
        sactComment.setCommentText(commentText);
        sactComment.setOpenid(openid);
        sactComment.setNickname(nickname);
        sactComment.setHeadImage(headimgurl);
        sactComment.setCreateTime(new Date());
        sactCommentService.saveSactComment(sactComment);
        //评论数+1
        SpontaneousActivity sact = sactService.findSactById(activityId);
        sact.setNumOfComment(sact.getNumOfComment() + 1);
        sactService.saveSpontaneousActivity(sact);
        return sactComment;
    }

    //点赞
    @RequestMapping("/praise")
    @ResponseBody
    public Boolean praise(HttpServletRequest request, HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        Integer activityId = Integer.parseInt(request.getParameter("activityId"));
        Boolean praiseOrNot = praiseService.findPraiseRecord(activityId, openid);
        if (praiseOrNot == false) {
            Praise praise = new Praise();
            praise.setActivityId(activityId);
            praise.setOpenid(openid);
            praise.setCreateTime(new Date());
            praiseService.savePraise(praise);
            //点赞数+1
            SpontaneousActivity sact = sactService.findSactById(activityId);
            sact.setNumOfLiked(sact.getNumOfLiked() + 1);
            sactService.saveSpontaneousActivity(sact);
            return false;
        } else {
            return true;
        }
    }

    //参加活动
    @RequestMapping("/join")
    @ResponseBody
    public Boolean join(HttpServletRequest request, HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        Integer activityId = Integer.parseInt(request.getParameter("activityId"));
        SpontaneousActivity sact = sactService.findSactById(activityId);
        Boolean joinOrNot = participantService.findJoinRecord(activityId, openid);
        // 判定用户若为活动发起人则不能参加活动
        if (!openid.equals(sact.getOpenid()) && joinOrNot == false) {
            //活动人数+1
            sact.setNumOfPeople(sact.getNumOfPeople() + 1);
            sactService.saveSpontaneousActivity(sact);
            //保存参加活动信息
            Participant participant = new Participant();
            participant.setActivityId(activityId);
            participant.setOriginator(sact.getOpenid());
            participant.setOpenid(openid);
            participantService.saveParticipant(participant);
            //发送模板消息
            String accessToken = getAccessToken();
            String rest = sendTemplates(accessToken, sact.getOpenid());
            System.out.println(rest);
            return false;
        } else {
            return true;
        }

    }

    @RequestMapping("/sactMessage")
    public String sactMessage(HttpServletRequest request,
                              HttpServletResponse response) {
        String openid = (String) request.getSession().getAttribute("openid");
        //用户参与的活动通知
        List<Map> joinList = participantService.findOriginator(openid);
        request.setAttribute("joinList", joinList);
        //用户发起活动有人参加通知
        List<Map> othersJoinList = participantService.findParticipant(openid);
        request.setAttribute("othersJoinList", othersJoinList);
        return "/jsp/sactMessage";
    }

}

