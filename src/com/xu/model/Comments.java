package com.xu.model;

import java.util.Date;

public class Comments {
    private Integer commentId;

    private Integer shopperId;
    
    private String shopperName;

    private Integer goodsId;

    private String commentContent;
    
    private Date commentTime;
    
    private Shopper shopper;
    
    private Goods goods;
    
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

	public String getShopperName() {
		return shopperName;
	}

	public void setShopperName(String shopperName) {
		this.shopperName = shopperName;
	}

	public Date getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getShopperId() {
        return shopperId;
    }

    public void setShopperId(Integer shopperId) {
        this.shopperId = shopperId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }
}