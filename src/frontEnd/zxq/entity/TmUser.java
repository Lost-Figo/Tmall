package frontEnd.zxq.entity;

public class TmUser {
    private int tmuid;
    private String name;
    private String password;

    public TmUser(){}
    public TmUser(String name ,String password){
        this.name = name ;
        this.password = password;
    }

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

    @Override
    public String toString() {
        return "TmUser{" +
                "tmuid=" + tmuid +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}