package com.web.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.utils.*;
import com.common.Configure;
import com.web.entity.User;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by sukey on 2016/5/21.
 */
@Controller
@RequestMapping("/wechat")
public class WechatController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request) {
        String request_url = request.getRequestURL().toString();
        String redirect_url = request_url.substring(0, request_url.indexOf("login")) + "authorize";
        redirect_url = redirect_url.replace(":", "%3A").replaceAll("/", "%2F");
        String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + Configure.WXAppid + "&redirect_uri=" + redirect_url + "&response_type=code&scope=snsapi_userinfo&state=123" +
            "#wechat_redirect";
        return "redirect:" + url;
    }

    @RequestMapping(value = "/authorize")
    public String authorize(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String code = request.getParameter("code");


        String get_access_token_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + Configure.WXAppid + "&secret=" + Configure.AppSecret + "&code=" + code + "&grant_type=authorization_code";
        String json = HttpUtil.getUrl(get_access_token_url);

        try {
            json = new String(json.getBytes("ISO-8859-1"), "utf-8");

        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        JSONObject jsonObject = JSONObject.parseObject(json);
        String openid = jsonObject.getString("openid");
        String userInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=" + jsonObject.getString("access_token") + "&openid=" + openid + "&lang=zh_CN";
        String uInfo = HttpUtil.getUrl(userInfoUrl);
        System.out.println(uInfo);
        try {
            uInfo = new String(uInfo.getBytes("ISO-8859-1"), "utf-8");

        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        JSONObject userInfo = JSONObject.parseObject(uInfo);

        User user = userService.findUserByOpenid(openid);
        String nickname = userInfo.getString("nickname");
        int sex = Integer.parseInt(String.valueOf(userInfo.get("sex")));
        String province = userInfo.getString("province");
        String city = userInfo.getString("city");
        String country = userInfo.getString("country");
        String headimgurl = userInfo.getString("headimgurl");

        if (user == null) {
            user = new User();
            user.setOpenid(openid);
            user.setNickname(nickname);
            user.setHeadimgurl(headimgurl);
            user.setSex(sex);
            user.setProvince(province);
            user.setCity(city);
            user.setCountry(country);
        } else {
            user.setNickname(nickname);
            user.setHeadimgurl(headimgurl);
        }
        userService.saveUser(user);
        request.getSession().setAttribute("openid", openid);
        return "redirect:/activity/index";
    }

    @RequestMapping(value = "/getWeiXinJsConf", method = RequestMethod.POST)
    @ResponseBody
    public String getWeiXinJsConf(HttpServletRequest request, HttpServletResponse response) {
        String timeStamp = String.valueOf(System.currentTimeMillis());
        timeStamp = timeStamp.substring(0, 10);
        String nonceStr = SignUtil.getRandomString(12);
        String url = request.getParameter("url");
        String jsTicket = (String) request.getSession().getAttribute("jsTicket");
        if (jsTicket == "" || jsTicket == null) {
            String accessToken = (String) request.getSession().getAttribute("accessToken");
            if (accessToken == "" || accessToken == null) {
                accessToken = getAccessTokenUtil.getAccessToken();
                request.getSession().setAttribute("accessToken", accessToken);
            }
            jsTicket = getAccessTokenUtil.getJsapiTicket(accessToken);
            request.getSession().setAttribute("jsTicket", jsTicket);
        }
        String signature = SignUtil.jsTicketSign(jsTicket, nonceStr, timeStamp, url);
        JSONObject obj = new JSONObject();
        obj.put("timeStamp", timeStamp);
        obj.put("nonceStr", nonceStr);
        obj.put("signature", signature);
        obj.put("url", url);
        System.out.println(obj.toString());
        System.out.println(jsTicket);
        return obj.toString();
    }
}
