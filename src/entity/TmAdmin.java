package entity;

public class TmAdmin {
    private int aid;
    private String name;
    private String password;
    private String tmclass;

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTmclass() {
        return tmclass;
    }

    public void setTmclass(String tmclass) {
        this.tmclass = tmclass;
    }

    public TmAdmin(int aid, String name, String password, String tmclass) {
        this.aid = aid;
        this.name = name;
        this.password = password;
        this.tmclass = tmclass;
    }
}
