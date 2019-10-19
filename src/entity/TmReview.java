package entity;

import java.util.Date;

public class TmReview {
    private int rid;
    private int uid;
    private int pid;
    private String content;
    private Date createDate;

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public TmReview(int rid, int uid, int pid, String content, Date createDate) {
        this.rid = rid;
        this.uid = uid;
        this.pid = pid;
        this.content = content;
        this.createDate = createDate;
    }
}
