package com.xu.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * 
 * 商户控制类
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
import com.xu.model.Shopper;
import com.xu.service.GoodsService;
import com.xu.service.SellerService;
import com.xu.service.ShopService;
import com.xu.utils.PagedResult;
import com.xu.utils.RandomName;

@Controller
public class SellerController {
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

	// seller登录
	@RequestMapping(value = "seller_login.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView login(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, String sellerPhone,
			String sellerPassword, HttpSession session) {
		// System.out.println(shopperPhone);
		Seller seller = sellerService.findSellerByPhone(sellerPhone);
		ModelAndView mv = new ModelAndView();
		if (seller == null) {
			errorFlag = 1;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_login");
		} else if (seller.getSellerPassword().endsWith(sellerPassword)) {
			session.setAttribute("seller", seller);
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			PagedResult<Goods> pageResult = goodsService.getAllGoodsByShopId(shop.getShopId(), pageNumber, pageSize);
			mv.addObject("pageResult", pageResult);
			session.setAttribute("pageResult", pageResult);
			mv.addObject("shop", shop);
			session.setAttribute("shop", shop);
			mv.setViewName("jsp/manageGoods");
		} else {
			errorFlag = 2;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_login");
		}
		return mv;
	}

	// seller注销
	@RequestMapping(value = "seller_logout.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.setAttribute("seller", null);
		mv.setViewName("jsp/index");
		return mv;
	}

	// seller注册
	@RequestMapping(value = "seller_register.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView register(String sellerPhone, String sellerPassword, String sellerConfirmPassword,
			String sellerEmail, String sellerRealname, String sellerIdCardNo, HttpSession session) {
		Seller seller = sellerService.findSellerByPhone(sellerPhone);
		ModelAndView mv = new ModelAndView();
		// 验证邮箱
		String RegEmail = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern patternEmail = Pattern.compile(RegEmail);
		Matcher matcherEmail = patternEmail.matcher(sellerEmail);
		// 验证身份证号
		String idCardNo = "[1-9]{2}[0-9]{4}(19|20)[0-9]{2}"
				+ "((0[1-9]{1})|(1[1-2]{1}))((0[1-9]{1})|([1-2]{1}[0-9]{1}|(3[0-1]{1})))" + "[0-9]{3}[0-9x]{1}";
		Pattern patternId = Pattern.compile(idCardNo);
		System.out.println(sellerIdCardNo);
		Matcher matcherId = patternId.matcher(sellerIdCardNo);
		if (seller != null) {
			errorFlag = 3;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_register");
		} else if (!(matcherEmail.matches())) {
			errorFlag = 4;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_register");
		} else if (!(matcherId.matches())) {
			System.out.println(matcherId.matches());
			errorFlag = 5;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_register");
		} else if (!(sellerPassword.equals(sellerConfirmPassword))) {
			errorFlag = 6;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_register");
		} else {
			seller = new Seller();
			String iniName = RandomName.getRandomName();
			System.out.println(iniName);
			seller.setSellerName("卖家" + iniName);
			seller.setSellerPhone(sellerPhone);
			seller.setSellerEmail(sellerEmail);
			seller.setSellerRealname(sellerRealname);
			seller.setSellerIdCardNo(sellerIdCardNo);
			seller.setSellerPassword(sellerPassword);
			session.setAttribute("seller", seller);
			sellerService.register(seller);
			seller = sellerService.findSellerByPhone(sellerPhone);
			Shop shop = new Shop();
			shop.setShopId(seller.getSellerId());
			mv.setViewName("jsp/sell_login");
		}
		return mv;
	}

	// 修改密码
	@RequestMapping(value = "seller_modifyPwd.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView seller_modifyPwd(String password, String sellerNewPassword, String sellerConfirmPassword,
			HttpSession session) {
		// System.out.println(shopperPhone);
		Seller seller = (Seller) session.getAttribute("seller");
		ModelAndView mv = new ModelAndView();
		if (!(seller.getSellerPassword().endsWith(password))) {
			errorFlag = 1;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_modifyPwd");
		} else if (!(sellerNewPassword.equals(sellerConfirmPassword))) {
			errorFlag = 2;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			seller.setSellerPassword(sellerNewPassword);
			sellerService.update(seller);
			session.setAttribute("seller", null);
			errorFlag = 3;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_login");
		}
		return mv;
	}

	// 修改个人信息
	@RequestMapping(value = "seller_modifyInfo.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView seller_modifyInfo(String sellerName, String sellerPhone, String sellerEmail,
			HttpSession session) {
		Seller sellerByName = sellerService.findSellerByName(sellerName);
		Seller sellerByPhone = sellerService.findSellerByPhone(sellerPhone);
		Seller seller = (Seller) session.getAttribute("seller");
		ModelAndView mv = new ModelAndView();
		String RegEmail = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern pattern = Pattern.compile(RegEmail);
		Matcher matcherEmail = pattern.matcher(sellerEmail);
		String RegPhone="^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
		pattern = Pattern.compile(RegPhone);
		Matcher matcherPhone = pattern.matcher(sellerPhone);
		if ((sellerByName != null) && !(sellerByName.getSellerName().equals(seller.getSellerName()))) {
			System.out.println(sellerByName.getSellerName());
			System.out.println(seller.getSellerName());
			errorFlag = 1;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_detail_info");
		} else if ((sellerByPhone != null) && !(sellerByPhone.getSellerName().equals(seller.getSellerName()))) {
			errorFlag = 2;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_detail_info");
		} else if(!(matcherPhone.matches())) {
			errorFlag = 3;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_detail_info");
		} else if (!(matcherEmail.matches())) {
			errorFlag = 4;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_detail_info");
		} else {
			seller.setSellerName(sellerName);
			seller.setSellerPhone(sellerPhone);
			seller.setSellerEmail(sellerEmail);
			session.setAttribute("seller", seller);
			sellerService.updateInfo(seller);
			errorFlag = 7;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/seller_detail_info");
		}
		return mv;
	}
}
