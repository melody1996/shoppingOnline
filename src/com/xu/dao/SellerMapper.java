package com.xu.dao;

import com.xu.model.Seller;

public interface SellerMapper {
//ͨ���ֻ��Ų�������
	Seller findSellerByPhone(String sellerPhone);
//����ע��
	void register(Seller seller);
	//�޸�����
	void update(Seller seller);
	
	Seller findSellerByName(String sellerName);

	void updateInfo(Seller seller);
}