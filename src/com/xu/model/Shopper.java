package com.xu.model;

public class Shopper {
    private Integer shopperId;

    private String shopperName;

    private String shopperPhone;

    private String shopperEmail;

    private String shopperPassword;

    public Integer getShopperId() {
        return shopperId;
    }

    public void setShopperId(Integer shopperId) {
        this.shopperId = shopperId;
    }

    public String getShopperName() {
        return shopperName;
    }

    public void setShopperName(String shopperName) {
        this.shopperName = shopperName == null ? null : shopperName.trim();
    }

    public String getShopperPhone() {
        return shopperPhone;
    }

    public void setShopperPhone(String shopperPhone) {
        this.shopperPhone = shopperPhone == null ? null : shopperPhone.trim();
    }

    public String getShopperEmail() {
        return shopperEmail;
    }

    public void setShopperEmail(String shopperEmail) {
        this.shopperEmail = shopperEmail == null ? null : shopperEmail.trim();
    }

    public String getShopperPassword() {
        return shopperPassword;
    }

    public void setShopperPassword(String shopperPassword) {
        this.shopperPassword = shopperPassword == null ? null : shopperPassword.trim();
    }
}