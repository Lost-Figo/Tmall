package entity;

import java.util.Date;

public class TmNews {
    private int nid;
    private String username;
    private String productname;
    private int sid;
    private int status;
    private Date shijian;
    private int liulan;

    public TmNews() {
    }

    public TmNews(int nid, String username, String productname, int sid, int status, Date shijian, int liulan) {
        this.nid = nid;
        this.username = username;
        this.productname = productname;
        this.sid = sid;
        this.status = status;
        this.shijian = shijian;
        this.liulan = liulan;
    }

    public int getLiulan() {
        return liulan;
    }

    public void setLiulan(int liulan) {
        this.liulan = liulan;
    }

    public Date getShijian() {
        return shijian;
    }

    public void setShijian(Date shijian) {
        this.shijian = shijian;
    }

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
