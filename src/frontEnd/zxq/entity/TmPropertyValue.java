package frontEnd.zxq.entity;

public class TmPropertyValue {
    private int pvid;
    private int pid;
    private int pdid;
    private int value;

    public int getPvid() {
        return pvid;
    }

    public void setPvid(int pvid) {
        this.pvid = pvid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public TmPropertyValue(int pvid, int pid, int pdid, int value) {
        this.pvid = pvid;
        this.pid = pid;
        this.pdid = pdid;
        this.value = value;
    }

    public TmPropertyValue() {
    }
}
