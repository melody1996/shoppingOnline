package com.xu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xu.model.Comments;
import com.xu.model.Goods;
import com.xu.model.Seller;
import com.xu.model.Shop;
import com.xu.service.GoodsService;
import com.xu.service.ShopService;
import com.xu.utils.PagedResult;
import com.xu.utils.RandomName;

/**
 * 商品的控制类
 * 
 * @author SA18225420_徐奇奇
 * @date 2018年11月8日
 * @version 1.0
 * @remarks TODO
 */
@Controller
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ShopService shopService;

	private int goodsFlag = Integer.MAX_VALUE;

	public int getGoodsFlag() {
		return goodsFlag;
	}

	public void setGoodsFlag(int goodsFlag) {
		this.goodsFlag = goodsFlag;
	}

	/**
	 * 分页显示商品
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "showAllGoods.do", produces = "application/json;charset=utf-8")
	public ModelAndView showAllGoods(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 当前页和每页的条数
		// 传入数据到分页工具类
		PagedResult<Goods> pageResult = goodsService.getAllGoodsByPage(pageNumber, pageSize);
		// 数据传到前台页面显示层
		mv.addObject("pageResult", pageResult);
		session.setAttribute("pageResult", pageResult);
		// 跳转页面
		mv.setViewName("jsp/index");
		return mv;
	}

	/**
	 * 分页显示商品,根据关键字模糊查询
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "searchGoods.do", produces = "application/json;charset=utf-8")
	public ModelAndView searchGoods(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, String keywords, String shopname,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		PagedResult<Goods> pageResult = null;
		session.setAttribute("keywords", keywords);
		session.setAttribute("shopname", shopname);
		// 当前页和每页的条数
		// 传入数据到分页工具类
		if ((keywords == null || keywords == "") && (shopname == null || shopname == "")) {
			mv.setViewName("jsp/index");
		} else if (shopname == null || shopname == "") {
			pageResult = goodsService.getAllGoodsByKeywords(keywords, pageNumber, pageSize);
		} else {
//			Shop shop = shopService.findShopByShopname(shopname);
//			System.out.println(shop);
			pageResult = goodsService.getAllGoodsByShopName(shopname, pageNumber, pageSize);
		}
		// 数据传到前台页面显示层
		mv.addObject("pageResult", pageResult);
		// 跳转页面
		mv.setViewName("jsp/index");
		return mv;
	}

	// 查看商品详情
	@RequestMapping(value = "showGoodsDetailInfo.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showGoodDetailInfo(Integer goodsId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Goods goods = goodsService.findGoodById(goodsId);
		int count = goodsService.getCommentCountById(goodsId);
		System.out.println(count);
		mv.addObject("goods", goods);
		mv.addObject("count", count);
		mv.setViewName("jsp/goodsDetailInfo");
		return mv;
	}

	/**
	 * 查看店铺所有的商品
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "showAllGoodsByShopId.do", produces = "application/json;charset=utf-8")
	public ModelAndView showAllGoodsByShopId(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, Integer shopId) {
		ModelAndView mv = new ModelAndView();
		Shop shop = shopService.getShopById(shopId);
		// 当前页和每页的条数
		// 传入数据到分页工具类
		PagedResult<Goods> pageResult = goodsService.getAllGoodsByShopId(shopId, pageNumber, pageSize);
		// 数据传到前台页面显示层
		mv.addObject("pageResult", pageResult);
		mv.addObject("shop", shop);
		// 跳转页面
		mv.setViewName("jsp/shop");
		return mv;
	}

	/**
	 * 分页显示当前卖家首页的商品
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "showShopGoods.do", produces = "application/json;charset=utf-8")
	public ModelAndView showShopGoods(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			PagedResult<Goods> pageResult = goodsService.getAllGoodsByShopId(shop.getShopId(), pageNumber, pageSize);
			mv.addObject("pageResult", pageResult);
			session.setAttribute("pageResult", pageResult);
			mv.addObject("shop", shop);
			session.setAttribute("shop", shop);
			mv.setViewName("jsp/manageGoods");
		}
		return mv;

	}

	/**
	 * 分页显示当前卖家的商品
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "showShopAllGoods.do", produces = "application/json;charset=utf-8")
	public ModelAndView showShopAllGoods(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			PagedResult<Goods> pageResult = goodsService.getAllGoodsByShopId(shop.getShopId(), pageNumber, pageSize);
			mv.addObject("pageResult", pageResult);
			session.setAttribute("pageResult", pageResult);
			mv.addObject("shop", shop);
			session.setAttribute("shop", shop);
			mv.setViewName("jsp/shopGoodsList");
		}
		return mv;
	}

	/**
	 * 下架商品
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "putOffGoodsById.do", produces = "application/json;charset=utf-8")
	public ModelAndView putOffGoodsById(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, Integer goodsId,
			Integer goodsStatus, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			Goods goods = goodsService.findGoodById(goodsId);
			goodsStatus = 1;
			goods.setGoodsStatus(goodsStatus);
			goodsService.updateGoodsStatusById(goods);
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			PagedResult<Goods> pageResult = goodsService.getAllGoodsByShopId(shop.getShopId(), pageNumber, pageSize);
			mv.addObject("pageResult", pageResult);
			session.setAttribute("pageResult", pageResult);
			goodsFlag = 1;// 已下架
			mv.addObject("goodsFlag", goodsFlag);
			mv.setViewName("jsp/shopGoodsList");
		}
		return mv;
	}

	/**
	 * 重新上架商品
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "reputOnGoodsById.do", produces = "application/json;charset=utf-8")
	public ModelAndView reputOnGoodsById(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, Integer goodsId,
			Integer goodsStatus, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			Goods goods = goodsService.findGoodById(goodsId);
			goodsStatus = 0;
			goods.setGoodsStatus(goodsStatus);
			goodsService.updateGoodsStatusById(goods);
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			PagedResult<Goods> pageResult = goodsService.getAllGoodsByShopId(shop.getShopId(), pageNumber, pageSize);
			mv.addObject("pageResult", pageResult);
			session.setAttribute("pageResult", pageResult);
			goodsFlag = 2;// 已上架
			mv.addObject("goodsFlag", goodsFlag);
			mv.setViewName("jsp/shopGoodsList");
		}
		return mv;
	}

	/**
	 * 上架商品
	 * 
	 * @throws IOException
	 * @throws IllegalStateException
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5")
	 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
	 */
	@RequestMapping(value = "putOnGoods.do", produces = "application/json;charset=utf-8")
	public ModelAndView putOnGoods(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, String goodsName, Float goodsPrice,
			Integer goodsStock, String goodsAddress, String goodsDescription, MultipartFile file, HttpSession session,
			HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			String sqlPath = null;// 保存数据库的路径
			String filename = null;// 定义文件名
			String contentType = file.getContentType(); // 获取文件类型（后缀）
			// 因为获取的后缀是XXXX/xxx形式
			contentType = contentType.substring(contentType.indexOf("/") + 1);
			long imageName = System.currentTimeMillis();
			filename = imageName + "." + contentType;
			System.out.println(filename);
			String url = request.getSession().getServletContext().getRealPath("upload/headicon");
			System.out.println(url);
			url = url + "/";
			File targetFile = new File(url, filename);

			file.transferTo(targetFile);// 保存图片
			Goods goods = new Goods();
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			goods.setShopId(shop.getShopId());
			goods.setGoodsName(goodsName);
			goods.setGoodsPrice(goodsPrice);
			goods.setGoodsStock(goodsStock);
			goods.setGoodsAddress(goodsAddress);
			goods.setGoodsDescription(goodsDescription);
			goods.setGoodsImageUrl("upload/headicon/" + filename);
			System.out.println("图片为：" + goods.getGoodsImageUrl());
			goodsService.putOnGoods(goods);
			PagedResult<Goods> pageResult = goodsService.getAllGoodsByShopId(shop.getShopId(), pageNumber, pageSize);
			mv.addObject("pageResult", pageResult);
			session.setAttribute("pageResult", pageResult);
			mv.addObject("shop", shop);
			session.setAttribute("shop", shop);
			mv.setViewName("jsp/shopGoodsList");
		}
		return mv;
	}
	
	// 展示商品详情，以便修改
		@RequestMapping(value = "findGoodsById.do", produces = "application/json;charset=utf-8")
		@ResponseBody
		public ModelAndView findGoodsById(Integer goodsId, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			Seller seller = (Seller) session.getAttribute("seller");
			if (seller == null) {
				mv.setViewName("jsp/seller_modifyPwd");
			} else {
				Goods goods=goodsService.findGoodById(goodsId);
				mv.addObject("goods", goods);
				mv.setViewName("jsp/modifyGoods");
			}
			return mv;
		}
		
		/**
		 * 修改商品
		 * 
		 * @throws IOException
		 * @throws IllegalStateException
		 * 
		 * @RequestParam(value = "pageSize", defaultValue = "5")
		 * @RequestParam(value = "pageNumber", defaultValue = "1" 设置分页的默认值
		 */
		@RequestMapping(value = "modifyGoods.do", produces = "application/json;charset=utf-8")
		public ModelAndView modifyGoods(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
				@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, String goodsName, Float goodsPrice,
				Integer goodsStock, String goodsAddress, String goodsDescription, MultipartFile file, HttpSession session,
				HttpServletRequest request) throws IllegalStateException, IOException {
			ModelAndView mv = new ModelAndView();
			Seller seller = (Seller) session.getAttribute("seller");
			if (seller == null) {
				mv.setViewName("jsp/seller_modifyPwd");
			} else {
				String sqlPath = null;// 保存数据库的路径
				String filename = null;// 定义文件名
				String contentType = file.getContentType(); // 获取文件类型（后缀）
				// 因为获取的后缀是XXXX/xxx形式
				contentType = contentType.substring(contentType.indexOf("/") + 1);
				long imageName = System.currentTimeMillis();
				filename = imageName + "." + contentType;
				System.out.println(filename);
				String url = request.getSession().getServletContext().getRealPath("upload/headicon");
				System.out.println(url);
				File targetFile = new File(url, filename);
//				url = url + "/";
				file.transferTo(targetFile);// 保存图片
				Goods goods = new Goods();
				Shop shop = shopService.getShopBySellerId(seller.getSellerId());
				goods.setShopId(shop.getShopId());
				goods.setGoodsName(goodsName);
				goods.setGoodsPrice(goodsPrice);
				goods.setGoodsStock(goodsStock);
				goods.setGoodsAddress(goodsAddress);
				goods.setGoodsDescription(goodsDescription);
				goods.setGoodsImageUrl("upload/headicon/" + filename);
				System.out.println("图片为：" + goods.getGoodsImageUrl());
				goodsService.updateGoods(goods);
				goodsFlag = 3;// 已修改
				mv.addObject("goods", goods);
				mv.addObject("goodsFlag", goodsFlag);
				session.setAttribute("pageResult", null);
				mv.setViewName("jsp/modifyGoods");
			}
			return mv;
		}
}