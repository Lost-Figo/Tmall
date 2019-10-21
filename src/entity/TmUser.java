package entity;

public class TmUser {
    private int tmuid;
    private String name;
    private String password;

    public int getTmuid() {
        return tmuid;
    }

    public void setTmuid(int tmuid) {
        this.tmuid = tmuid;
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

    public TmUser() {
    }
}