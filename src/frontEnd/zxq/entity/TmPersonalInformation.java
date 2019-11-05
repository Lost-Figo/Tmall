package frontEnd.zxq.entity;

public class TmPersonalInformation {
    private int perid;
    private int tmuid;
    private String name;
    private String sex;
    private String phone;
    private String email;
    private String kind;
    private String homedress;
    private String headimg;
    private String signature;

    public TmPersonalInformation(int tmuid, String name, String sex, String phone, String email, String kind, String homedress, String headimg, String signature) {
        this.tmuid = tmuid;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
        this.kind = kind;
        this.homedress = homedress;
        this.headimg = headimg;
        this.signature = signature;
    }

    public TmPersonalInformation(int tmuid, String name, String sex, String phone, String email, String kind, String homedress, String signature) {
        this.tmuid = tmuid;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
        this.kind = kind;
        this.homedress = homedress;
        this.signature = signature;
    }

    public TmPersonalInformation() {
    }

    public int getPerid() {
        return perid;
    }

    public void setPerid(int perid) {
        this.perid = perid;
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getHomedress() {
        return homedress;
    }

    public void setHomedress(String homedress) {
        this.homedress = homedress;
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

    @Override
    public String toString() {
        return "TmPersonalInformation{" +
                "perid=" + perid +
                ", tmuid=" + tmuid +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", kind='" + kind + '\'' +
                ", homedress='" + homedress + '\'' +
                ", headimg='" + headimg + '\'' +
                ", signature='" + signature + '\'' +
                '}';
    }
}
