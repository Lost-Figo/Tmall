package frontEnd.zxq.entity;

public class TmShoppingAddress {
    private int addid;
    private int tmuid;
    private String address;
    private String recevier;
    private String post; //邮编
    private String phone;

    public TmShoppingAddress() {
    }

    public TmShoppingAddress(int addid, int tmuid, String address, String recevier, String post, String phone) {
        this.addid = addid;
        this.tmuid = tmuid;
        this.address = address;
        this.recevier = recevier;
        this.post = post;
        this.phone = phone;
    }

    public TmShoppingAddress(int tmuid, String address, String recevier, String post, String phone) {
        this.tmuid = tmuid;
        this.address = address;
        this.recevier = recevier;
        this.post = post;
        this.phone = phone;
    }

    public int getAddid() {
        return addid;
    }

    public void setAddid(int addid) {
        this.addid = addid;
    }

    public int getTmuid() {
        return tmuid;
    }

    public void setTmuid(int tmuid) {
        this.tmuid = tmuid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRecevier() {
        return recevier;
    }

    public void setRecevier(String recevier) {
        this.recevier = recevier;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "TmShoppingAddress{" +
                "addid=" + addid +
                ", tmuid=" + tmuid +
                ", address='" + address + '\'' +
                ", recevier='" + recevier + '\'' +
                ", post='" + post + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
