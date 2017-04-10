package com.web.entity;

import java.util.Date;
import javax.persistence.*;

/**
 * Created by sukey on 2017/4/10.
 */

@Entity
@Table(name = "letter")
public class Letter {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    /**
     * 信件标题
     */
    @Column(name = "title")
    private String title;

    /**
     * 信件内容
     */
    @Column(name = "content")
    private String content;

    /**
     * 发件人
     */
    @Column(name = "openid")
    private String openid;

    /**
     * 发件人昵称
     */
    @Column(name = "nickname")
    private String nickname;

    /**
     * 发件人头像
     */
    @Column(name = "headImage")
    private String headImage;


    /**
     * 信件长度
     */
    @Column(name = "length")
    private Integer length;

    /**
     * 性别
     */
    @Column(name = "gender")
    private Integer gender;

    /**
     * 阅读次数
     */
    @Column(name = "readTime")
    private Integer readTime;

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

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getReadTime() {
        return readTime;
    }

    public void setReadTime(Integer readTime) {
        this.readTime = readTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
