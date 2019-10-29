package frontEnd.zxq.entity;

public class TmProperty {
    private int pid;
    private String name;
    private int cid;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public TmProperty(int pid, String name, int cid) {
        this.pid = pid;
        this.name = name;
        this.cid = cid;
    }

    public TmProperty() {
    }
}
