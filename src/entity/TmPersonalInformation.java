package entity;

public class TmPersonalInformation {
    private int perid;
    private int uid;
    private String name;
    private String sex;
    private String headimg;
    private String signature;

    public int getPerid() {
        return perid;
    }

    public void setPerid(int perid) {
        this.perid = perid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getHeadimg() {
        return headimg;
    }

    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public TmPersonalInformation(int perid, int uid, String name, String sex, String headimg, String signature) {
        this.perid = perid;
        this.uid = uid;
        this.name = name;
        this.sex = sex;
        this.headimg = headimg;
        this.signature = signature;
    }
}
