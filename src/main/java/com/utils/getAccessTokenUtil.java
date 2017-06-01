package com.utils;

import java.io.UnsupportedEncodingException;

import com.alibaba.fastjson.JSONObject;
import com.common.Configure;

public class getAccessTokenUtil {

    public static String getAccessToken() {
        String accesstokenURL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + Configure.WXAppid + "&secret=" + Configure.AppSecret;
        String accessTokenInfo = HttpUtil.getUrl(accesstokenURL);
        try {
            accessTokenInfo = new String(accessTokenInfo.getBytes("ISO-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        JSONObject tokenInfo = JSONObject.parseObject(accessTokenInfo);
        return tokenInfo.getString("access_token");
    }

    public static String getJsapiTicket(String ACCESS_TOKEN) {
        String jsTicketUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + ACCESS_TOKEN + "&type=jsapi";
        String jsapi_ticketInfo = HttpUtil.getUrl(jsTicketUrl);
        try {
            jsapi_ticketInfo = new String(jsapi_ticketInfo.getBytes("ISO-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        JSONObject ticketInfo = JSONObject.parseObject(jsapi_ticketInfo);

        return ticketInfo.getString("ticket");
    }

    public static String getCouponTicket(String ACCESS_TOKEN) {
        String couponTicketUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + ACCESS_TOKEN + "&type=wx_card";
        String coupon_ticketInfo = HttpUtil.getUrl(couponTicketUrl);
        try {
            coupon_ticketInfo = new String(coupon_ticketInfo.getBytes("ISO-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        JSONObject ticketInfo = JSONObject.parseObject(coupon_ticketInfo);

        return ticketInfo.getString("ticket");
    }

    public static String sendTemplate(String ACCESS_TOKEN, String openid) {
        String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" + ACCESS_TOKEN;
        JSONObject submit = new JSONObject();
        JSONObject data = new JSONObject();
        JSONObject first = new JSONObject();
        JSONObject remark = new JSONObject();
        JSONObject keyword1 = new JSONObject();
        JSONObject keyword2 = new JSONObject();
        JSONObject keyword3 = new JSONObject();
        JSONObject keyword4 = new JSONObject();
        first.put("value", "您参与的活动，有信件被查看");
        first.put("color", "#000");
        keyword1.put("value", "走心君");
        keyword1.put("color", "#000");
        keyword2.put("value", "查令十字街84号");
        keyword2.put("color", "#000");
        keyword3.put("value", "2017/5");
        keyword3.put("color", "#000");
        keyword4.put("value", "走心君公众号");
        keyword4.put("color", "#000");
        remark.put("value", "更多精彩活动将在后续开放");
        remark.put("color", "#000");
        data.put("first", first);
        data.put("keyword1", keyword1);
        data.put("keyword2", keyword2);
        data.put("keyword3", keyword3);
        data.put("keyword4", keyword4);
        data.put("remark", remark);
        submit.put("touser", openid);
        submit.put("template_id", "TCEMK9tblhb1B7oLUfGUlMxJUoSXwIkl3F96DAqmpgI");
        submit.put("url", "www.zouxinjun.com/zouxinjun/activity/message");
        submit.put("data", data);
        String receiveData = HttpUtil.httpRequest(url, "POST", submit.toString());
        return receiveData;
    }

    public static String sendTemplates(String ACCESS_TOKEN, String openid) {
        String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" + ACCESS_TOKEN;
        JSONObject submit = new JSONObject();
        JSONObject data = new JSONObject();
        JSONObject first = new JSONObject();
        JSONObject remark = new JSONObject();
        JSONObject keyword1 = new JSONObject();
        JSONObject keyword2 = new JSONObject();
        JSONObject keyword3 = new JSONObject();
        JSONObject keyword4 = new JSONObject();
        first.put("value", "您发起的活动有小伙伴来参加了");
        first.put("color", "#000");
        keyword1.put("value", "走心君");
        keyword1.put("color", "#000");
        keyword2.put("value", "青春就是要搞事");
        keyword2.put("color", "#000");
        keyword3.put("value", "2017/5");
        keyword3.put("color", "#000");
        keyword4.put("value", "走心君公众号");
        keyword4.put("color", "#000");
        remark.put("value", "更多精彩活动将在后续开放");
        remark.put("color", "#000");
        data.put("first", first);
        data.put("keyword1", keyword1);
        data.put("keyword2", keyword2);
        data.put("keyword3", keyword3);
        data.put("keyword4", keyword4);
        data.put("remark", remark);
        submit.put("touser", openid);
        submit.put("template_id", "TCEMK9tblhb1B7oLUfGUlMxJUoSXwIkl3F96DAqmpgI");
        submit.put("url", "www.zouxinjun.com/zouxinjun/activity/message");
        submit.put("data", data);
        String receiveData = HttpUtil.httpRequest(url, "POST", submit.toString());
        return receiveData;
    }


    public static void main(String[] args) {
        String accessToken = getAccessToken();
        System.out.println(accessToken);
        System.out.println(getJsapiTicket(accessToken));
        String ticket = getCouponTicket(accessToken);
        System.out.println(ticket);
    }
}
