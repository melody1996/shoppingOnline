package com.xu.model;

public class Cart {
    private Integer cartId;
    
    private Integer shopperId;

    private Integer goodsId;

    private Integer goodsNumber;

    private Float goodsTotalPrice;
    
    private String goodsName;

    private Float goodsPrice;

    private String goodsDescription;
    
    public String getGoodsDescription() {
		return goodsDescription;
	}

	public void setGoodsDescription(String goodsDescription) {
		this.goodsDescription = goodsDescription;
	}

	private String goodsImageUrl;
    

    public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Float getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsImageUrl() {
		return goodsImageUrl;
	}

	public void setGoodsImageUrl(String goodsImageUrl) {
		this.goodsImageUrl = goodsImageUrl;
	}

	public Integer getCartId() {
        return cartId;
    }

    public Integer getShopperId() {
		return shopperId;
	}

	public void setShopperId(Integer shopperId) {
		this.shopperId = shopperId;
	}

	public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(Integer goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    public Float getGoodsTotalPrice() {
        return goodsTotalPrice;
    }

    public void setGoodsTotalPrice(Float goodsTotalPrice) {
        this.goodsTotalPrice = goodsTotalPrice;
    }
}