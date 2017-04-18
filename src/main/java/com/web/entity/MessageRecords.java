package com.web.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by sukey on 2017/4/18.
 */
public class MessageRecords {

    private List<Map> recordList;

    private int unreadRecord;

    public List<Map> getRecordList() {
        return recordList;
    }

    public void setRecordList(List<Map> recordList) {
        this.recordList = recordList;
    }

    public int getUnreadRecord() {
        return unreadRecord;
    }

    public void setUnreadRecord(int unreadRecord) {
        this.unreadRecord = unreadRecord;
    }
}
