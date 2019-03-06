package com.xu.dao;

import java.util.List;

import com.xu.model.Goods;

public interface GoodsMapper {

	List<Goods> getAllGoods();

	// ���ݹؼ���ģ����ѯ��Ʒ
	List<Goods> getAllGoodsByKeywords(String keywords);

	// ���ݵ���id��ѯ��Ʒ
	List<Goods> getAllGoodsByShopId(Integer shopId);

	List<Goods> getAllGoodsByShopName(String shopname);

	Goods findGoodById(Integer goodsId);

	void updateGoodsStock(Goods goods);

	void updateGoodsStatusById(Goods goods);

	void putOnGoods(Goods goods);

	void updateGoods(Goods goods);
}