package com.xu.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * 
 * 购物车控制类
 * @author SA18225420_徐奇奇
 * @date 2018年11月12日
 * @version 1.0
 * @remarks TODO
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.xu.model.Cart;
import com.xu.model.Goods;
import com.xu.model.Shopper;
import com.xu.service.CartService;
import com.xu.service.GoodsService;

@Controller
public class CartController {
	@Autowired
	CartService cartService = new CartService();
	@Autowired
	private GoodsService goodsService;
	private int ErrorFlag = Integer.MAX_VALUE;

	public int getErrorFlag() {
		return ErrorFlag;
	}

	public void setErrorFlag(int ErrorFlag) {
		this.ErrorFlag = ErrorFlag;
	}

	// 加入购物车
	@RequestMapping(value = "addIntoCart.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView addIntoCart(Integer shopperId, Integer goodsId, String goodsNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		Goods goods = goodsService.findGoodById(goodsId);
		System.out.println(shopper);
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
//		} else if (!(matcher.matches())) {
//			ErrorFlag = 1;
//			mv.addObject("ErrorFlag", ErrorFlag);
//			int count = goodsService.getCommentCountById(goodsId);
//			mv.addObject("goods", goods);
//			mv.addObject("count", count);
//			mv.setViewName("jsp/goodsDetailInfo");
		} else {
			shopperId = shopper.getShopperId();
			int goodsNum = Integer.parseInt(goodsNumber.trim());
			Cart cart = cartService.findCartById(shopperId, goodsId);
			if (cart != null) {
				cart.setShopperId(shopperId);
				cart.setGoodsNumber(cart.getGoodsNumber() + goodsNum);
				cart.setGoodsTotalPrice(cart.getGoodsNumber() * goods.getGoodsPrice());
				cartService.updateCart(cart);
//					goods.setGoodsStock(goods.getGoodsStock() - goodsNum);
//					goodsService.updateGoodsStock(goods);
			} else {
				cart = new Cart();
				cart.setShopperId(shopperId);
				cart.setGoodsId(goodsId);
				cart.setGoodsNumber(goodsNum);
				cart.setGoodsTotalPrice(goodsNum * goods.getGoodsPrice());
				cartService.addIntoCart(cart);
			}
			mv.addObject("goods", goods);
			mv.addObject("goodsNum", goodsNum);
			mv.setViewName("jsp/addIntoCartResult");
		}
		return mv;
	}

	// 查看个人购物车
	@RequestMapping(value = "showCart.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showCart(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Cart> cart = cartService.getCartByShopperId(shopper.getShopperId());
			mv.addObject("cart", cart);
			mv.setViewName("jsp/cart");
		}
		return mv;
	}

	@RequestMapping(value = "deleteCartById.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView deleteCartById(Integer shopperId, Integer goodsId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			shopperId = shopper.getShopperId();
			Cart cart = cartService.findCartById(shopperId, goodsId);
			cart.setShopperId(shopperId);
			cartService.deleteCart(cart);
			mv.setViewName("forward:/showCart.do");
		}
		return mv;
	}

	/**
	 * 修改商品数量 要用ajax，所以用String类型
	 */
	@RequestMapping(value = "modifyGoodNumber.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String modifyGoodNumber(Integer shopperId, Integer goodsId, Integer goodsNumber, HttpSession session) {
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		Goods goods = goodsService.findGoodById(goodsId);
		if (shopper == null) {
			return "not_login";
		} else if (goodsNumber > goods.getGoodsStock()) {
			return "no";
		} else {
			shopperId = shopper.getShopperId();
			Cart cart = cartService.findCartById(shopperId, goodsId);
			cart.setShopperId(shopperId);
			cart.setGoodsNumber(goodsNumber);
			cart.setGoodsTotalPrice(cart.getGoodsNumber() * goods.getGoodsPrice());
			int i = cartService.modifyGoodNumber(cart);
			if (i > 0) {
				return "yes";
			} else {
				return "no";
			}
		}
	}

	/**
	 * 修改商品数量 要用ajax，所以用String类型
	 */
	@RequestMapping(value = "checkGoodNumber.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String checkGoodNumber(Integer shopperId, Integer goodsId, Integer goodsNumber) {
		Goods goods = goodsService.findGoodById(goodsId);
		if (goodsNumber > goods.getGoodsStock()) {
			return "no";
		} else {
			return null;
		}

	}
}