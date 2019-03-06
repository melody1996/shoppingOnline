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
import com.xu.model.Address;
import com.xu.model.Shopper;
import com.xu.service.AddressService;
import com.xu.utils.PagedResult;
import com.xu.utils.RandomName;

/**
 * 地址的控制类
 * 
 * @author SA18225420_徐奇奇
 * @date 2018年11月8日
 * @version 1.0
 * @remarks TODO
 */
@Controller
public class AddressController {
	@Autowired
	private AddressService addressService;
	private int addressErrorFlag = Integer.MAX_VALUE;

	public int getAddressErrorFlag() {
		return addressErrorFlag;
	}

	public void setAddressErrorFlag(int addressErrorFlag) {
		this.addressErrorFlag = addressErrorFlag;
	}

	/**
	 * 分页显示收货地址
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "showAddress.do", produces = "application/json;charset=utf-8")
	public ModelAndView showAddress(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			// 当前页和每页的条数
			// 传入数据到分页工具类
			PagedResult<Address> pageResult = addressService.getAllAddressByPage(shopper.getShopperId(), pageNumber,
					pageSize);
			// 数据传到前台页面显示层
			mv.addObject("pageResult", pageResult);
			// 跳转页面
			mv.setViewName("jsp/manageAddress");
		}
		return mv;
	}
	// 添加收货地址
	@RequestMapping(value = "addAddress.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView addAddress(String consigneeName, String consigneeAddress, String consigneePhone,
			String consigneePostalCode, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			String RegPhone = "^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
			Pattern patternPhone = Pattern.compile(RegPhone);
			Matcher matcherPhone = patternPhone.matcher(consigneePhone);
			String RegCellPostalCode = "[1-9]\\d{5}";
			Pattern patternPostalCode = Pattern.compile(RegCellPostalCode);
			Matcher matcherPostalCode = patternPostalCode.matcher(consigneePostalCode);
			if (!(matcherPhone.matches())) {
				addressErrorFlag = 1;
				mv.addObject("addressErrorFlag", addressErrorFlag);
				mv.setViewName("jsp/add_address");
			} else if (!(matcherPostalCode.matches())) {
				addressErrorFlag = 2;
				mv.addObject("addressErrorFlag", addressErrorFlag);
				mv.setViewName("jsp/add_address");
			} else {
				Address address = new Address();
				address.setShopperId(shopper.getShopperId());
				address.setConsigneeName(consigneeName);
				address.setConsigneeAddress(consigneeAddress);
				address.setConsigneePhone(consigneePhone);
				address.setConsigneePostalCode(consigneePostalCode);
				addressService.addAddress(address);
				mv.setViewName("forward:/showAddress.do");
			}
		}
		return mv;
	}

	// 根据id查找地址
	@RequestMapping(value = "findAddressById.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView findAddressById(String addressId) {
		ModelAndView mv = new ModelAndView();
		Address address = addressService.findAddressById(addressId);
		mv.addObject("address", address);
		mv.setViewName("jsp/modifyAddress");
		return mv;
	}

	// 修改收货地址
	@RequestMapping(value = "modifyAddress.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView modifyAddress(String addressId, String consigneeName, String consigneeAddress,
			String consigneePhone, String consigneePostalCode) {
		ModelAndView mv = new ModelAndView();
		String RegPhone = "^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		Pattern patternPhone = Pattern.compile(RegPhone);
		Matcher matcherPhone = patternPhone.matcher(consigneePhone);
		String RegCellPostalCode = "[1-9]\\d{5}";
		Pattern patternPostalCode = Pattern.compile(RegCellPostalCode);
		Matcher matcherPostalCode = patternPostalCode.matcher(consigneePostalCode);
		if (!(matcherPhone.matches())) {
			addressErrorFlag = 1;
			mv.addObject("addressErrorFlag", addressErrorFlag);
			mv.setViewName("forward:/findAddressById.do");
		} else if (!(matcherPostalCode.matches())) {
			addressErrorFlag = 2;
			mv.addObject("addressErrorFlag", addressErrorFlag);
			mv.setViewName("forward:/findAddressById.do");
		} else {
			Address address = addressService.findAddressById(addressId);
			address.setConsigneeName(consigneeName);
			address.setConsigneeAddress(consigneeAddress);
			address.setConsigneePhone(consigneePhone);
			address.setConsigneePostalCode(consigneePostalCode);
			addressService.modifyAddress(address);
			addressErrorFlag = 3;
			mv.addObject("addressErrorFlag", addressErrorFlag);
			mv.setViewName("forward:/findAddressById.do");
		}
		return mv;
	}
	// 根据id删除地址
		@RequestMapping(value = "deleteAddressById.do", produces = "application/json;charset=utf-8")
		@ResponseBody
		public ModelAndView deleteAddressById(String addressId) {
			ModelAndView mv = new ModelAndView();
			Address address = addressService.findAddressById(addressId);
			addressService.deleteAddress(address);
			mv.setViewName("forward:/showAddress.do");
			return mv;
		}
}
