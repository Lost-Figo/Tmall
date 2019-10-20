package entity;

import java.util.Date;

public class TmReview {
    private int rid;
    private int tmuid;
    private int pdid;
    private String content;
    private Date createDate;

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getTmuid() {
        return tmuid;
    }

    public void setTmuid(int tmuid) {
        this.tmuid = tmuid;
    }

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
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

    public TmReview(int rid, int tmuid, int pdid, String content, Date createDate) {
        this.rid = rid;
        this.tmuid = tmuid;
        this.pdid = pdid;
        this.content = content;
        this.createDate = createDate;
    }

    public TmReview() {
    }
}
