package com.xu.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * 
 * 店铺控制类
 * @author SA18225420_徐奇奇
 * @date 2018年11月12日
 * @version 1.0
 * @remarks TODO
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xu.model.Goods;
import com.xu.model.Seller;
import com.xu.model.Shop;
import com.xu.service.GoodsService;
import com.xu.service.SellerService;
import com.xu.service.ShopService;
import com.xu.utils.PagedResult;
import com.xu.utils.RandomName;

@Controller
public class ShopController {
	@Autowired
	private SellerService sellerService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private GoodsService goodsService;
	
	private int errorFlag = Integer.MAX_VALUE;

	public int getErrorFlag() {
		return errorFlag;
	}

	public void setErrorFlag(int errorFlag) {
		this.errorFlag = errorFlag;
	}
	// 查询店铺信息
	@RequestMapping(value = "showShopInfo.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showShopInfo(HttpSession session) {
		// System.out.println(shopperPhone);
		Seller seller = (Seller) session.getAttribute("seller");
		ModelAndView mv = new ModelAndView();
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		}else {
			Shop shop= shopService.getShopBySellerId(seller.getSellerId());
			mv.addObject("shop",shop);
			mv.setViewName("jsp/shop_detail_info");
		}
		return mv;
	}
	// 修改店铺信息
		@RequestMapping(value = "modifyShopInfo.do", produces = "application/json;charset=utf-8")
		@ResponseBody
		public ModelAndView modifyShopInfo(String shopName,String shopAddress,String shopDescription,HttpSession session) {
			// System.out.println(shopperPhone);
			Seller seller = (Seller) session.getAttribute("seller");
			ModelAndView mv = new ModelAndView();
			if (seller == null) {
				mv.setViewName("jsp/sell_modifyPwd");
			}else {
				Shop shopByName=shopService.findShopByName(shopName);
				Shop shop= shopService.getShopBySellerId(seller.getSellerId());
				if(shopByName!=null && !(shopByName.getShopName()).equals(shop.getShopName())) {
					errorFlag=1;
					mv.addObject("errorFlag",errorFlag);		
				}else {
					shop.setSellerId(seller.getSellerId());
					shop.setShopName(shopName);
					shop.setShopAddress(shopAddress);
					shop.setShopDescription(shopDescription);
					shopService.updateShop(shop);
					errorFlag=2;
					mv.addObject("errorFlag",errorFlag);
					mv.addObject("shop",shop);
				}	
				mv.setViewName("jsp/shop_detail_info");
			}
			return mv;
		}
}
