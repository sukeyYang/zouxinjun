package com.web.entity;

import java.util.Date;
import javax.persistence.*;

/**
 * Created by sukey on 2017/4/10.
 */

@Entity
@Table(name = "open_letter_record")
public class UserLetterRecord {

    @Id
    @Basic(optional = false)
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    /**
     * 写信人
     */
    @Column(name = "openid")
    private String openid;

    /**
     * 已写信的数量
     */
    @Column(name = "letterNumber")
    private String letterNumber;

    /**
     * 打开信的数量
     */
    @Column(name = "openTime")
    private String openTime;


    @Column(name = "createTime")
    private Date createTime;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getLetterNumber() {
        return letterNumber;
    }

    public void setLetterNumber(String letterNumber) {
        this.letterNumber = letterNumber;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
