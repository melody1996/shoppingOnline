package com.xu.dao;

import com.xu.model.Shop;

public interface ShopMapper {
	Shop findShopByShopname(String shopname);

	Shop getShopById(Integer shopId);

	Shop getShopBySellerId(Integer sellerId);

	void updateShop(Shop shop);

	Shop findShopByName(String shopName);

}