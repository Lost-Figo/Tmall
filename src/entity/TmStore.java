package entity;

public class TmStore {
    private int sid;
    private int sdid;
    private String name;
    private String phone;
    private String describe;

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public TmStore(int sid, int sdid, String name, String phone, String describe) {
        this.sid = sid;
        this.sdid = sdid;
        this.name = name;
        this.phone = phone;
        this.describe = describe;
    }
}
