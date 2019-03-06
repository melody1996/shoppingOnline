package com.xu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.xu.dao.ShopperMapper;
import com.xu.model.Address;
import com.xu.model.Shopper;
import com.xu.utils.BeanUtil;
import com.xu.utils.PagedResult;

@Service
@Transactional
public class ShopperService {
	@Resource
	private ShopperMapper shopperMapper;

	public PagedResult<Shopper> getAllByPage(Integer pageNumber, Integer pageSize) {
		//1. 调用分页插件
				PageHelper.startPage(pageNumber, pageSize);
				//2. 查询数据库，获取数据
				List<Shopper> shopper=shopperMapper.getAll();
				//3. 通过分页工具类加载分页数据
				BeanUtil.toPagedResult(shopper);
				return BeanUtil.toPagedResult(shopper);
	}

	public Shopper findShopperByPhone(String shopperPhone) {
		Shopper shopper=shopperMapper.findShopperByPhone(shopperPhone);
		return shopper;
	}
	public void register(Shopper shopper) {
		shopperMapper.register(shopper);
	}

	public void update(Shopper shopper) {
		shopperMapper.update(shopper);
		
	}

	public Shopper findShopperByName(String shopperName) {
		Shopper shopper=shopperMapper.findShopperByName(shopperName);
		return shopper;
	}

	public Shopper findShopperById(Integer shopperId) {
		Shopper shopper=shopperMapper.findShopperById(shopperId);
		return shopper;
	}

	public void updatePassword(Shopper shopper) {
		shopperMapper.updatePassword(shopper);
		
	}
}
