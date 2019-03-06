package com.xu.dao;

import com.xu.model.Seller;

public interface SellerMapper {
//通过手机号查找卖家
	Seller findSellerByPhone(String sellerPhone);
//卖家注册
	void register(Seller seller);
	//修改密码
	void update(Seller seller);
	
	Seller findSellerByName(String sellerName);

	void updateInfo(Seller seller);
}