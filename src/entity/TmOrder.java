package entity;

import java.util.Date;

public class TmOrder {
    private int oid;
    private int ordercode;
    private String address;
    private int status;
    private int uid;
    private String recevier;
    private String phone;
    private String userMassage;
    private Date createdate;
    private Date payDate;
    private Date deliverydate;
    private Date confirmdate;
    private int post;


    public int getPost() {
        return post;
    }

    public void setPost(int post) {
        this.post = post;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getOrdercode() {
        return ordercode;
    }

    public void setOrdercode(int ordercode) {
        this.ordercode = ordercode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getRecevier() {
        return recevier;
    }

    public void setRecevier(String recevier) {
        this.recevier = recevier;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserMassage() {
        return userMassage;
    }

    public void setUserMassage(String userMassage) {
        this.userMassage = userMassage;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public Date getDeliverydate() {
        return deliverydate;
    }

    public void setDeliverydate(Date deliverydate) {
        this.deliverydate = deliverydate;
    }

    public Date getConfirmdate() {
        return confirmdate;
    }

    public void setConfirmdate(Date confirmdate) {
        this.confirmdate = confirmdate;
    }

    public TmOrder(int oid, int ordercode, String address, int status, int uid, String recevier, String phone, String userMassage, Date createdate, Date payDate, Date deliverydate, Date confirmdate, int post) {
        this.oid = oid;
        this.ordercode = ordercode;
        this.address = address;
        this.status = status;
        this.uid = uid;
        this.recevier = recevier;
        this.phone = phone;
        this.userMassage = userMassage;
        this.createdate = createdate;
        this.payDate = payDate;
        this.deliverydate = deliverydate;
        this.confirmdate = confirmdate;
        this.post = post;
    }
}
