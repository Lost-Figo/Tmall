package entity;

public class TmOrderItem {
    private int oiid;
    private int pdid;
    private int uid;
    private int oid;
    private int count;

    public int getOiid() {
        return oiid;
    }

    public void setOiid(int oiid) {
        this.oiid = oiid;
    }

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public TmOrderItem(int oiid, int pdid, int uid, int oid, int count) {
        this.oiid = oiid;
        this.pdid = pdid;
        this.uid = uid;
        this.oid = oid;
        this.count = count;
    }
}
