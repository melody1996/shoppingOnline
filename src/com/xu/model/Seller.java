package com.xu.model;

public class Seller {
    private Integer sellerId;

    private String sellerName;

    private String sellerPhone;

    private String sellerEmail;

    private String sellerPassword;

    private String sellerIdCardNo;

    private String sellerRealname;

    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName == null ? null : sellerName.trim();
    }

    public String getSellerPhone() {
        return sellerPhone;
    }

    public void setSellerPhone(String sellerPhone) {
        this.sellerPhone = sellerPhone == null ? null : sellerPhone.trim();
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail == null ? null : sellerEmail.trim();
    }

    public String getSellerPassword() {
        return sellerPassword;
    }

    public void setSellerPassword(String sellerPassword) {
        this.sellerPassword = sellerPassword == null ? null : sellerPassword.trim();
    }

    public String getSellerIdCardNo() {
        return sellerIdCardNo;
    }

    public void setSellerIdCardNo(String sellerIdCardNo) {
        this.sellerIdCardNo = sellerIdCardNo == null ? null : sellerIdCardNo.trim();
    }

    public String getSellerRealname() {
        return sellerRealname;
    }

    public void setSellerRealname(String sellerRealname) {
        this.sellerRealname = sellerRealname == null ? null : sellerRealname.trim();
    }
}