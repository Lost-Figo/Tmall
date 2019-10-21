package entity;

public class TmProduct {
    private int pdid;
    private String name;
    private String subtitle;
    private int originPrice;
    private int promotePrice;
    private int cid;
    private int spid;

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public int getOriginPrice() {
        return originPrice;
    }

    public void setOriginPrice(int originPrice) {
        this.originPrice = originPrice;
    }

    public int getPromotePrice() {
        return promotePrice;
    }

    public void setPromotePrice(int promotePrice) {
        this.promotePrice = promotePrice;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getSpid() {
        return spid;
    }

    public void setSpid(int spid) {
        this.spid = spid;
    }

    public TmProduct() {
    }

    public TmProduct(int pdid, String name, String subtitle, int originPrice, int promotePrice, int cid, int spid) {
        this.pdid = pdid;
        this.name = name;
        this.subtitle = subtitle;
        this.originPrice = originPrice;
        this.promotePrice = promotePrice;
        this.cid = cid;
        this.spid = spid;
    }
}
