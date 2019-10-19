package entity;

public class TmProductImage {
    private int piid;
    private int pid;
    private String imageadd;

    public int getPiid() {
        return piid;
    }

    public void setPiid(int piid) {
        this.piid = piid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getImageadd() {
        return imageadd;
    }

    public void setImageadd(String imageadd) {
        this.imageadd = imageadd;
    }

    public TmProductImage(int piid, int pid, String imageadd) {
        this.piid = piid;
        this.pid = pid;
        this.imageadd = imageadd;
    }
}
