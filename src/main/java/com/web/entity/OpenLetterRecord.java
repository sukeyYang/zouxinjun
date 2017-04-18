package com.web.entity;

import java.util.Date;
import javax.persistence.*;

/**
 * Created by sukey on 2017/4/10.
 */

@Entity
@Table(name = "open_letter_record")
public class OpenLetterRecord {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    /**
     * 写信人
     */
    @Column(name = "sender")
    private String sender;

    /**
     * 拆信人
     */
    @Column(name = "receiver")
    private String receiver;


    /**
     * 信件ID
     */
    @Column(name = "letterId")
    private String letterId;

    /**
     * 信件发送者是否阅读该消息
     */
    @Column(name = "senderRead")
    private Integer senderRead;

    /**
     * 拆信者是否阅读该消息
     */
    @Column(name = "receiverRead")
    private Integer receiverRead;


    @Column(name = "createTime")
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getLetterId() {
        return letterId;
    }

    public void setLetterId(String letterId) {
        this.letterId = letterId;
    }

    public Integer getSenderRead() {
        return senderRead;
    }

    public void setSenderRead(Integer senderRead) {
        this.senderRead = senderRead;
    }

    public Integer getReceiverRead() {
        return receiverRead;
    }

    public void setReceiverRead(Integer receiverRead) {
        this.receiverRead = receiverRead;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


}
