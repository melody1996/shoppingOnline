package com.xu.dao;

import java.util.List;

import com.xu.model.Goods;

public interface GoodsMapper {

	List<Goods> getAllGoods();

	// 根据关键字模糊查询商品
	List<Goods> getAllGoodsByKeywords(String keywords);

	// 根据店铺id查询商品
	List<Goods> getAllGoodsByShopId(Integer shopId);

	List<Goods> getAllGoodsByShopName(String shopname);

	Goods findGoodById(Integer goodsId);

	void updateGoodsStock(Goods goods);

	void updateGoodsStatusById(Goods goods);

	void putOnGoods(Goods goods);

	void updateGoods(Goods goods);
}