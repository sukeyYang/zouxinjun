package com.web.entity;

import java.util.Date;
import javax.persistence.*;

/**
 * Created by sukey on 2017/4/10.
 */

@Entity
@Table(name = "spontaneousActivity")
public class SpontaneousActivity {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    /**
     * 自发活动标题
     */
    @Column(name = "title")
    private String title;

    /**
     * 自发活动内容
     */
    @Column(name = "content")
    private String content;

    /**
     * 自发活动人数
     */
    @Column(name = "numOfPeople")
    private Integer numOfPeople;

    /**
     * 发起人
     */
    @Column(name = "openid")
    private String openid;

    /**
     * 发起人昵称
     */
    @Column(name = "nickname")
    private String nickname;

    /**
     * 发起人头像
     */
    @Column(name = "headImage")
    private String headImage;

    /**
     * 电话
     */
    @Column(name = "phone")
    private String phone;

    /**
     * 被查看次数
     */
    @Column(name = "numOfCheck")
    private Integer numOfCheck;

    /**
     * 点赞次数
     */
    @Column(name = "numOfLiked")
    private Integer numOfLiked;

    /**
     * 评论次数
     */
    @Column(name = "numOfComment")
    private Integer numOfComment;

    /**
     * 创建时间
     */
    @Column(name = "createTime")
    private Date createTime;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getNumOfPeople() {
        return numOfPeople;
    }

    public void setNumOfPeople(Integer numOfPeople) {
        this.numOfPeople = numOfPeople;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getNumOfCheck() {
        return numOfCheck;
    }

    public void setNumOfCheck(Integer numOfCheck) {
        this.numOfCheck = numOfCheck;
    }

    public Integer getNumOfLiked() {
        return numOfLiked;
    }

    public void setNumOfLiked(Integer numOfLiked) {
        this.numOfLiked = numOfLiked;
    }

    public Integer getNumOfComment() {
        return numOfComment;
    }

    public void setNumOfComment(Integer numOfComment) {
        this.numOfComment = numOfComment;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


}
