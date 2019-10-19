package entity;

public class TmShoppingAddress {
    private int addid;
    private int uid;
    private String address;
    private int post; //邮编
    private String phone;

    public int getAddid() {
        return addid;
    }

    public void setAddid(int addid) {
        this.addid = addid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPost() {
        return post;
    }

    public void setPost(int post) {
        this.post = post;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public TmShoppingAddress(int addid, int uid, String address, int post, String phone) {
        this.addid = addid;
        this.uid = uid;
        this.address = address;
        this.post = post;
        this.phone = phone;
    }
}
