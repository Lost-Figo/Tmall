package frontEnd.zxq.entity;

public class TmOrderItem {
    private int oiid;
    private int pdid;
    private int tmuid;
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

    public int getTmuid() {
        return tmuid;
    }

    public void setTmuid(int tmuid) {
        this.tmuid = tmuid;
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

    public TmOrderItem() {
    }

    public TmOrderItem(int oiid, int pdid, int tmuid, int oid, int count) {
        this.oiid = oiid;
        this.pdid = pdid;
        this.tmuid = tmuid;
        this.oid = oid;
        this.count = count;
    }
}
