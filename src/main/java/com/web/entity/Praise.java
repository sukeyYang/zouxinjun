package com.web.entity;

import java.util.Date;
import javax.persistence.*;

/**
 * Created by YHLS on 2017/5/16.
 */
@Entity
@Table(name = "praise")
public class Praise {

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
     * 点赞人
     */
    @Column(name = "openid")
    private String openid;

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
