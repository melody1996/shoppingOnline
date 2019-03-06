package com.xu.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.xu.dao.CommentsMapper;
import com.xu.dao.GoodsMapper;
import com.xu.dao.ShopMapper;
import com.xu.model.Comments;
import com.xu.model.Goods;
import com.xu.model.Shop;
import com.xu.utils.BeanUtil;
import com.xu.utils.PagedResult;

@Service
@Transactional
public class GoodsService {
	@Resource
	private GoodsMapper goodsMapper;
	@Resource
	private ShopMapper shopMapper;
	@Resource
	private CommentsMapper commentMapper;

	public PagedResult<Goods> getAllGoodsByPage(Integer pageNumber, Integer pageSize) {
		// 1. 调用分页插件
		PageHelper.startPage(pageNumber, pageSize);
		// 2. 查询数据库，获取数据
		List<Goods> goods = goodsMapper.getAllGoods();
		for (int i = 0; i < goods.size(); i++) {
			Shop shop = shopMapper.getShopById(goods.get(i).getShopId());
			goods.get(i).setShopName(shop.getShopName());
		}
		// 3. 通过分页工具类加载分页数据
		BeanUtil.toPagedResult(goods);
		return BeanUtil.toPagedResult(goods);
	}

	public PagedResult<Goods> getAllGoodsByKeywords(String keywords, Integer pageNumber, Integer pageSize) {
		// 1. 调用分页插件
		PageHelper.startPage(pageNumber, pageSize);
		// 2. 查询数据库，获取数据
		List<Goods> goods = goodsMapper.getAllGoodsByKeywords(keywords);
		for (int i = 0; i < goods.size(); i++) {
			Shop shop = shopMapper.getShopById(goods.get(i).getShopId());
			goods.get(i).setShopName(shop.getShopName());
		}
		// 3. 通过分页工具类加载分页数据
		BeanUtil.toPagedResult(goods);
		return BeanUtil.toPagedResult(goods);
	}

	/**
	 * 根据商店id查找商品
	 * 
	 * @param shopId
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public PagedResult<Goods> getAllGoodsByShopId(Integer shopId, Integer pageNumber, Integer pageSize) {
		PageHelper.startPage(pageNumber, pageSize);
		// 2. 查询数据库，获取数据
		List<Goods> goods = goodsMapper.getAllGoodsByShopId(shopId);
		// 3. 通过分页工具类加载分页数据
		BeanUtil.toPagedResult(goods);
		return BeanUtil.toPagedResult(goods);
	}

	public PagedResult<Goods> getAllGoodsByShopName(String shopname, Integer pageNumber, Integer pageSize) {
		PageHelper.startPage(pageNumber, pageSize);
		// 2. 查询数据库，获取数据
		List<Goods> goods = goodsMapper.getAllGoodsByShopName(shopname);
		for (int i = 0; i < goods.size(); i++) {
			Shop shop = shopMapper.getShopById(goods.get(i).getShopId());
			goods.get(i).setShopName(shop.getShopName());
		}
		// 3. 通过分页工具类加载分页数据
		BeanUtil.toPagedResult(goods);
		return BeanUtil.toPagedResult(goods);
	}

	public Goods findGoodById(Integer goodsId) {
		Goods goods = goodsMapper.findGoodById(goodsId);
		Shop shop = shopMapper.getShopById(goods.getShopId());
		goods.setShopName(shop.getShopName());
		return goods;
	}

	public int getCommentCountById(Integer goodsId) {
		return commentMapper.getCommentCountById(goodsId);
	}

	public void updateGoodsStock(Goods goods) {
		goodsMapper.updateGoodsStock(goods);

	}

	public void updateGoodsStatusById(Goods goods) {
		goodsMapper.updateGoodsStatusById(goods);
		
	}

	public void putOnGoods(Goods goods) {
		goodsMapper.putOnGoods(goods);

		
	}

	public void updateGoods(Goods goods) {
		goodsMapper.updateGoods(goods);
	}
}
