package com.web.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.utils.SendRedPackUtil;
import com.web.component.robbot.TulingApiProcess;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.utils.MessageUtil;
import com.web.entity.MessageResponse;

@Component
public class CoreService {


    static Log log = LogFactory.getLog(CoreService.class);



    /**
     * 处理微信发来的请求
     *
     * @param request
     *
     * @return
     */
    public String processRequest(HttpServletRequest request) {
        String respMessage = null;
        try {
            // 默认返回的文本消息内容
            String respContent = "请求处理异常，请稍候尝试！";

            // xml请求解析
            // 调用消息工具类MessageUtil解析微信发来的xml格式的消息，解析的结果放在HashMap里；
            Map<String, String> requestMap = MessageUtil.parseXml(request);

            // 从HashMap中取出消息中的字段；
            // 发送方帐号（open_id）
            String fromUserName = requestMap.get("FromUserName");
            // 公众帐号
            String toUserName = requestMap.get("ToUserName");
            // 消息类型
            String msgType = requestMap.get("MsgType");
            // 消息内容
            String content = requestMap.get("Content");
            // 从HashMap中取出消息中的字段；

            log.info("fromUserName is:" + fromUserName + " toUserName is:" + toUserName + " msgType is:" + msgType);

            // 文本消息
            if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
                //微信聊天机器人测试 2015-3-31
                if (content != null) {
                    respContent = TulingApiProcess.getTulingResult(content);
                    String reply = new String(respContent.getBytes("utf-8"), "ISO8859_1");
                    if (respContent == "" || null == respContent) {
                        MessageResponse.getTextMessage(fromUserName, toUserName, "服务号暂时无法回复，请稍后再试！");
                    }
                    //return FormatXmlProcess.formatXmlAnswer(toUserName, fromUserName, respContent);
                    return MessageResponse.getTextMessage(fromUserName, toUserName, reply);
                }
            } else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {// 事件推送
                String eventType = requestMap.get("Event");// 事件类型

                if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {// 订阅
                    respContent = "谢谢你长得这么好看还关注我，开心或者不开心，我都可以陪你聊天哟！";
                    respContent = new String(respContent.getBytes("utf-8"), "ISO8859_1");//中文乱码处理
                    return MessageResponse.getTextMessage(fromUserName, toUserName, respContent);

                } else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {// 取消订阅
                    // TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息
                } else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {// 自定义菜单点击事件
                    String eventKey = requestMap.get("EventKey");// 事件KEY值，与创建自定义菜单时指定的KEY值对应
                    log.info("eventKey is:" + eventKey);
                    return MenuClickService.getClickResponse(eventKey, fromUserName, toUserName);
                }
            }

            //开启微信声音识别测试 2015-3-30
            else if (msgType.equals("voice")) {
                String recvMessage = requestMap.get("Recognition");
                //respContent = "收到的语音解析结果："+recvMessage;
                if (recvMessage != null) {
                    respContent = TulingApiProcess.getTulingResult(recvMessage);
                } else {
                    respContent = "您说的太模糊了，能不能重新说下呢？";
                }
                return MessageResponse.getTextMessage(fromUserName, toUserName, respContent);
            }
            //拍照功能
            else if (msgType.equals("pic_sysphoto")) {

            } else {
                return MessageResponse.getTextMessage(fromUserName, toUserName, "返回为空");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return respMessage;
    }

}
