package com.xu.model;

import java.math.BigDecimal;
import java.util.Date;

public class Orders {
	private Integer orderId;

	private Integer shopperId;

	private Integer addressId;

	private String orderNumber;

	private Integer goodId;
	
	private Integer shopId;
	
	private Date goodsReceivedTime;

	private Integer goodNumber;

	private Float orderTotalPrice;

	private Date orderTime;

	private String orderPayWay;

	private Integer orderIsComfirm;

	private Integer goodsIsCommented;
	
	private Goods goods;
	
	private Shopper shopper;

	private Integer goodsIsSent;

	private Integer goodsIsReceived;


	public Date getGoodsReceivedTime() {
		return goodsReceivedTime;
	}

	public void setGoodsReceivedTime(Date goodsReceivedTime) {
		this.goodsReceivedTime = goodsReceivedTime;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	
	public Shopper getShopper() {
		return shopper;
	}

	public void setShopper(Shopper shopper) {
		this.shopper = shopper;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Integer getOrderIsComfirm() {
		return orderIsComfirm;
	}

	public void setOrderIsComfirm(Integer orderIsComfirm) {
		this.orderIsComfirm = orderIsComfirm;
	}

	public Integer getGoodsIsCommented() {
		return goodsIsCommented;
	}

	public void setGoodsIsCommented(Integer goodsIsCommented) {
		this.goodsIsCommented = goodsIsCommented;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getShopperId() {
		return shopperId;
	}

	public void setShopperId(Integer shopperId) {
		this.shopperId = shopperId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber == null ? null : orderNumber.trim();
	}

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public Integer getGoodNumber() {
		return goodNumber;
	}

	public void setGoodNumber(Integer goodNumber) {
		this.goodNumber = goodNumber;
	}

	public Float getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(Float orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getOrderPayWay() {
		return orderPayWay;
	}

	public void setOrderPayWay(String orderPayWay) {
		this.orderPayWay = orderPayWay == null ? null : orderPayWay.trim();
	}

	public Integer getGoodsIsSent() {
		return goodsIsSent;
	}

	public void setGoodsIsSent(Integer goodsIsSent) {
		this.goodsIsSent = goodsIsSent;
	}

	public Integer getGoodsIsReceived() {
		return goodsIsReceived;
	}

	public void setGoodsIsReceived(Integer goodsIsReceived) {
		this.goodsIsReceived = goodsIsReceived;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
}