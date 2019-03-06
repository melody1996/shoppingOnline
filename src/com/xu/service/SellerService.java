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
	//通过手机号查找卖家
	public Seller findSellerByPhone(String sellerPhone) {
		Seller seller=sellerMapper.findSellerByPhone(sellerPhone);
		return seller;
	}
	//卖家注册
	public void register(Seller seller) {
		sellerMapper.register(seller);
	}
	//修改密码
	public void update(Seller seller) {
		sellerMapper.update(seller);
		
	}
	//根据用户名查询
	public Seller findSellerByName(String sellerName) {
		Seller seller=sellerMapper.findSellerByName(sellerName);
		return seller;
	}
	//修改个人信息
	public void updateInfo(Seller seller) {
		sellerMapper.updateInfo(seller);
	}
}
