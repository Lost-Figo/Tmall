package entity;

public class Znodes {
    int id;
    int pId;
    String name;

    public Znodes(int id, int pId, String name) {
        this.id = id;
        this.pId = pId;
        this.name = name;
    }

    public Znodes() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
