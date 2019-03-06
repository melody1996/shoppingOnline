package com.xu.dao;

import java.util.List;

import com.xu.model.Cart;
import com.xu.model.Goods;

public interface CartMapper {

	Cart findCartById(Integer shopperId, Integer goodsId);

	void updateCart(Cart cart);

	void addIntoCart(Cart cart);

	List<Cart> getCartByShopperId(Integer shopperId);

	void deleteCart(Cart cart);

	int modifyGoodNumber(Cart cart);
}