package com.web.entity;

import java.util.Date;
import javax.persistence.*;

/**
 * Created by YHLS on 2017/5/15.
 */

@Entity
@Table(name = "sactComment")
public class SactComment {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    /**
     * 活动id
     */
    @Column(name = "activityId")
    private Integer activityId;

    /**
     * 评论人
     */
    @Column(name = "openid")
    private String openid;

    /**
     * 评论人昵称
     */
    @Column(name = "nickname")
    private String nickname;

    /**
     * 评论人头像
     */
    @Column(name = "headImage")
    private String headImage;

    /**
     * 评论内容
     */
    @Column(name = "commentText")
    private String commentText;

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

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
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

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
