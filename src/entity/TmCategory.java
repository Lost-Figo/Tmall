package entity;

public class TmCategory {
    private int cid;
    private String name;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public TmCategory(int cid, String name) {
        this.cid = cid;
        this.name = name;
    }

    public TmCategory() {
    }

    @Override
    public String toString() {
        return "TmCategory{" +
                "cid=" + cid +
                ", name='" + name + '\'' +
                '}';
    }
}
