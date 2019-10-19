package entity;

public class TmProductImage {
    private int piid;
    private int pdid;
    private String imageadd;

    public int getPiid() {
        return piid;
    }

    public void setPiid(int piid) {
        this.piid = piid;
    }

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public String getImageadd() {
        return imageadd;
    }

    public void setImageadd(String imageadd) {
        this.imageadd = imageadd;
    }

    public TmProductImage(int piid, int pdid, String imageadd) {
        this.piid = piid;
        this.pdid = pdid;
        this.imageadd = imageadd;
    }
}
