package entity;

public class TmStoreWareHouse {
    private int spid;
    private int sid;
    private int pdid;
    private int count;

    public int getSpid() {
        return spid;
    }

    public void setSpid(int spid) {
        this.spid = spid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public TmStoreWareHouse(int spid, int sid, int pdid, int count) {
        this.spid = spid;
        this.sid = sid;
        this.pdid = pdid;
        this.count = count;
    }

    public TmStoreWareHouse() {
    }
}
