package com.xu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.xu.dao.SellerMapper;
import com.xu.dao.ShopperMapper;
import com.xu.model.Seller;
import com.xu.utils.BeanUtil;
import com.xu.utils.PagedResult;

@Service
@Transactional
public class SellerService {
	@Resource
	private SellerMapper sellerMapper;
	//ͨ���ֻ��Ų�������
	public Seller findSellerByPhone(String sellerPhone) {
		Seller seller=sellerMapper.findSellerByPhone(sellerPhone);
		return seller;
	}
	//����ע��
	public void register(Seller seller) {
		sellerMapper.register(seller);
	}
	//�޸�����
	public void update(Seller seller) {
		sellerMapper.update(seller);
		
	}
	//�����û�����ѯ
	public Seller findSellerByName(String sellerName) {
		Seller seller=sellerMapper.findSellerByName(sellerName);
		return seller;
	}
	//�޸ĸ�����Ϣ
	public void updateInfo(Seller seller) {
		sellerMapper.updateInfo(seller);
	}
}
