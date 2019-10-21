package entity;

public class TmStoreAdmin {
    private int sdid;
    private String name;
    private String password;

    public TmStoreAdmin(int sdid, String name, String password) {
        this.sdid = sdid;
        this.name = name;
        this.password = password;
    }

    public int getSdid() {
        return sdid;
    }

    public void setSdid(int sdid) {
        this.sdid = sdid;
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

    public TmStoreAdmin() {
    }
}
