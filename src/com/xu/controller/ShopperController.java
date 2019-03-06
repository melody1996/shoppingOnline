package com.xu.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.xu.model.Shopper;
import com.xu.service.ShopperService;
import com.xu.utils.PagedResult;
import com.xu.utils.RandomName;

/**
 * 用户的控制类
 * 
 * @author SA18225420_徐奇奇
 * @date 2018年11月8日
 * @version 1.0
 * @remarks TODO
 */
@Controller
public class ShopperController {
	@Autowired
	private ShopperService shopperService;
	private int errorFlag = Integer.MAX_VALUE;

	public int getErrorFlag() {
		return errorFlag;
	}

	public void setErrorFlag(int errorFlag) {
		this.errorFlag = errorFlag;
	}

//登录
	@RequestMapping(value = "login.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView login(String shopperPhone, String shopperPassword, HttpSession session) {
		System.out.println(shopperPhone);
		Shopper shopper = shopperService.findShopperByPhone(shopperPhone);
		System.out.println(shopper);
		ModelAndView mv = new ModelAndView();
		if (shopper == null) {
			errorFlag = 1;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/login");
		} else if (shopper.getShopperPassword().endsWith(shopperPassword)) {
			session.setAttribute("shopper", shopper);
			mv.setViewName("jsp/index");
		} else {
			errorFlag = 2;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/login");
		}
		return mv;
	}

//登出
	@RequestMapping(value = "logout.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.setAttribute("shopper", null);
		mv.setViewName("jsp/index");
		return mv;
	}

//注册
	@RequestMapping(value = "register.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView register(String shopperPhone, String shopperPassword, String ConfirmPassword,
			String shopperEmail, HttpSession session) {
		Shopper shopper = shopperService.findShopperByPhone(shopperPhone);
		ModelAndView mv = new ModelAndView();
		String RegEmail = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern pattern = Pattern.compile(RegEmail);
		Matcher matcher = pattern.matcher(shopperEmail);
//		System.out.println(shopperPassword);
//		System.out.println(ConfirmPassword);
		if (shopper != null) {
			errorFlag = 3;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/register");
		} else if (!(matcher.matches())) {
			errorFlag = 4;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/register");
		} else if (!(shopperPassword.equals(ConfirmPassword))) {
			errorFlag = 5;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/register");
		} else {
			shopper = new Shopper();
			String iniName = RandomName.getRandomName();
			shopper.setShopperName("用户" + iniName);
			shopper.setShopperPhone(shopperPhone);
			shopper.setShopperEmail(shopperEmail);
			shopper.setShopperPassword(shopperPassword);
			session.setAttribute("shopper", shopper);
			shopperService.register(shopper);
			mv.setViewName("jsp/index");
		}
		return mv;
	}

	// 修改密码
	@RequestMapping(value = "modifyPwd.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView modifyPwd(String password, String shopperNewPassword, String shopperConfirmPassword,
			HttpSession session) {
		// System.out.println(shopperPhone);
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		ModelAndView mv = new ModelAndView();
		if (!(shopper.getShopperPassword().endsWith(password))) {
			errorFlag = 1;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/modifyPwd");
		} else if (!(shopperNewPassword.equals(shopperConfirmPassword))) {
			errorFlag = 2;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/modifyPwd");
		} else {
			shopper.setShopperPassword(shopperNewPassword);
			shopperService.updatePassword(shopper);
			errorFlag = 6;
			mv.addObject("errorFlag", errorFlag);
			session.setAttribute("user", null);
			mv.setViewName("jsp/login");
		}
		return mv;
	}

	// 修改个人信息
	@RequestMapping(value = "modifyInfo.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView modifyInfo(String shopperName, String shopperPhone, String shopperEmail, HttpSession session) {
		Shopper shopperByName = shopperService.findShopperByName(shopperName);
		Shopper shopperByPhone = shopperService.findShopperByPhone(shopperPhone);
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		ModelAndView mv = new ModelAndView();
		String RegEmail = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern pattern = Pattern.compile(RegEmail);
		Matcher matcherEmail = pattern.matcher(shopperEmail);
		String RegPhone = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
		pattern = Pattern.compile(RegPhone);
		Matcher matcherPhone = pattern.matcher(shopperPhone);
		if (shopperByName != null && !(shopperByName.getShopperName().equals(shopper.getShopperName()))) {
			errorFlag = 1;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/detail_info");
		} else if (shopperByPhone != null && !(shopperByPhone.getShopperName().equals(shopper.getShopperName()))) {
			errorFlag = 2;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/detail_info");
		} else if (!(matcherPhone.matches())) {
			errorFlag = 3;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/detail_info");
		} else if (!(matcherEmail.matches())) {
			errorFlag = 4;
			mv.addObject("errorFlag", errorFlag);
			mv.setViewName("jsp/detail_info");
		} else {
			shopper.setShopperName(shopperName);
			shopper.setShopperPhone(shopperPhone);
			shopper.setShopperEmail(shopperEmail);
			session.setAttribute("shopper", shopper);
			shopperService.update(shopper);
			errorFlag = 7;
			mv.setViewName("jsp/detail_info");
		}
		return mv;
	}
}
