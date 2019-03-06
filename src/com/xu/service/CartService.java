package com.xu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.xu.dao.CartMapper;
import com.xu.dao.GoodsMapper;
import com.xu.model.Cart;
import com.xu.model.Goods;
import com.xu.utils.BeanUtil;
import com.xu.utils.PagedResult;

@Service
@Transactional
public class CartService {
	@Resource
	private CartMapper cartMapper;
	@Resource
	private GoodsMapper goodsMapper;
	public Cart findCartById(Integer shopperId, Integer goodsId) {
		return cartMapper.findCartById(shopperId,goodsId);
	}

	public void updateCart(Cart cart) {
		cartMapper.updateCart(cart);
		
	}

	public void addIntoCart(Cart cart) {
		cartMapper.addIntoCart(cart);
	}

	public List<Cart> getCartByShopperId(Integer shopperId) {
		List<Cart> cart=cartMapper.getCartByShopperId(shopperId);
		for (int i = 0; i < cart.size(); i++) {
			Goods goods=goodsMapper.findGoodById(cart.get(i).getGoodsId());
			cart.get(i).setGoodsName(goods.getGoodsName());
			cart.get(i).setGoodsPrice(goods.getGoodsPrice());
			cart.get(i).setGoodsDescription(goods.getGoodsDescription());
			cart.get(i).setGoodsImageUrl(goods.getGoodsImageUrl());
		}
		return cart;
	}

	public void deleteCart(Cart cart) {
		cartMapper.deleteCart(cart);
		
	}

	public int modifyGoodNumber(Cart cart) {
		int i=cartMapper.modifyGoodNumber(cart);
		return i;
	}
	
}
