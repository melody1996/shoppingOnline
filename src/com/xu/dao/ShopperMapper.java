package com.xu.dao;

import java.util.List;

import com.xu.model.Address;
import com.xu.model.Shopper;

public interface ShopperMapper {
	List<Shopper> getAll();

//ͨ���ֻ��Ų���shopper
	Shopper findShopperByPhone(String shopperPhone);

//shopperע��
	void register(Shopper shopper);

	void update(Shopper shopper);

	Shopper findShopperByName(String shopperName);

	List<Address> getAllAddress(Integer shopperId);

	Shopper findShopperById(Integer shopperId);

	void updatePassword(Shopper shopper);
}