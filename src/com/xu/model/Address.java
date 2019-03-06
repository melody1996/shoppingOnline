package com.xu.model;

/**
 * TODO
 * @author SA18225420_–Ï∆Ê∆Ê
 * @date 2018ƒÍ11‘¬15»’
 * @version 1.0
 * @remarks TODO
 */
public class Address {
    private Integer addressId;

    private Integer shopperId;

    private String consigneeName;

    private String consigneeAddress;

    private String consigneePhone;

    private String consigneePostalCode;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

  
	public Integer getShopperId() {
		return shopperId;
	}

	public void setShopperId(Integer shopperId) {
		this.shopperId = shopperId;
	}

	public String getConsigneeName() {
        return consigneeName;
    }

    public void setConsigneeName(String consigneeName) {
        this.consigneeName = consigneeName == null ? null : consigneeName.trim();
    }

    public String getConsigneeAddress() {
        return consigneeAddress;
    }

    public void setConsigneeAddress(String consigneeAddress) {
        this.consigneeAddress = consigneeAddress == null ? null : consigneeAddress.trim();
    }

    public String getConsigneePhone() {
        return consigneePhone;
    }

    public void setConsigneePhone(String consigneePhone) {
        this.consigneePhone = consigneePhone == null ? null : consigneePhone.trim();
    }

    public String getConsigneePostalCode() {
        return consigneePostalCode;
    }

    public void setConsigneePostalCode(String consigneePostalCode) {
        this.consigneePostalCode = consigneePostalCode == null ? null : consigneePostalCode.trim();
    }
}