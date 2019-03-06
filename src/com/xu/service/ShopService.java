package com.xu.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.xu.dao.ShopMapper;
import com.xu.model.Shop;

@Service
@Transactional
public class ShopService {
	@Resource
	private ShopMapper shopMapper;

	public Shop findShopByShopname(String shopname) {
		Shop shop = shopMapper.findShopByShopname(shopname);
		return shop;
	}

	public Shop getShopById(Integer shopId) {
		Shop shop = shopMapper.getShopById(shopId);
		return shop;
	}

	public Shop getShopBySellerId(Integer sellerId) {
		Shop shop = shopMapper.getShopBySellerId(sellerId);
		return shop;
	}

	public void updateShop(Shop shop) {
		shopMapper.updateShop(shop);
	}

	public Shop findShopByName(String shopName) {
		Shop shop = shopMapper.findShopByName(shopName);
		return shop;
	}

}
