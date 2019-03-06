package com.xu.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.xu.model.Cart;
import com.xu.model.Goods;
import com.xu.model.Orders;
import com.xu.model.Seller;
import com.xu.model.Shop;
import com.xu.model.Shopper;
import com.xu.service.AddressService;
import com.xu.service.CartService;
import com.xu.service.GoodsService;
import com.xu.service.OrdersService;
import com.xu.service.ShopService;
import com.xu.service.ShopperService;
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
public class OrdersController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private CartService cartService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private ShopperService shopperService;

	private int flag = Integer.MAX_VALUE;

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	// 生成订单
	@RequestMapping(value = "addIntoOrder.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView addIntoOrder(Integer[] ids, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			int j = 0;
			for (int i = 0; i < ids.length; i++) {
				if (ids[i] != 0) {
					j++;
				}
			}
			int[] goodsId = new int[j];
			j = 0;
			for (int i = 0; i < ids.length; i++) {
				if (ids[i] != 0) {
					goodsId[j] = ids[i];
					j++;
				}
			}
			List<Goods> goodsList = new ArrayList<Goods>();
			for (int i = 0; i < goodsId.length; i++) {
				goodsList.add(goodsService.findGoodById(goodsId[i]));
			}
			// 获取下单时间
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
			String Strdate = dateFormat.format(date);
			List<Orders> ordersList = new ArrayList<Orders>();
			for (int i = 0; i < goodsList.size(); i++) {
				Cart cart = cartService.findCartById(shopper.getShopperId(), goodsList.get(i).getGoodsId());
				// 生成订单号
				DecimalFormat df = new DecimalFormat("0000");
				String shopperId = df.format(shopper.getShopperId());
				String shoppId = df.format(goodsList.get(i).getShopId());
				String orderNumber = shopperId + Strdate + shoppId;
				// 形成订单
				Orders orders = new Orders();
				orders.setGoodId(goodsList.get(i).getGoodsId());
				orders.setShopperId(shopper.getShopperId());
				orders.setShopId(goodsList.get(i).getShopId());
				orders.setOrderTime(date);
				orders.setGoodNumber(cart.getGoodsNumber());
				orders.setOrderTotalPrice(cart.getGoodsTotalPrice());
				orders.setOrderNumber(orderNumber);
				ordersService.addIntoOrders(orders);
				orders = ordersService.findOrderByIdAndNumber(shopper.getShopperId(), goodsList.get(i).getGoodsId(),
						orderNumber);
				orders.setGoods(goodsList.get(i));
				ordersList.add(orders);
//				cart.setShopperId(shopper.getShopperId());
//				cartService.deleteCart(cart);
			}
//			System.out.println(ordersList);
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < ordersList.size(); i++) {
				if (resultMap.containsKey(ordersList.get(i).getOrderNumber())) {
					resultMap.get(ordersList.get(i).getOrderNumber()).add(ordersList.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(ordersList.get(i));
					resultMap.put(ordersList.get(i).getOrderNumber(), tmpList);
				}
			}
			List<Address> addressList = addressService.findAllAddresByShopperId(shopper.getShopperId());
			mv.addObject("addressList", addressList);
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/showOrders");
		}

		return mv;
	}

	// 查看未确认订单
	@RequestMapping(value = "showNotComfirmedOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showNotComfirmedOrders(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Orders> notComfirmedorders = ordersService.findNotComfirmedOrders(shopper.getShopperId());
			for (int i = 0; i < notComfirmedorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notComfirmedorders.get(i).getGoodId());
				notComfirmedorders.get(i).setGoods(goods);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notComfirmedorders.size(); i++) {
				if (resultMap.containsKey(notComfirmedorders.get(i).getOrderNumber())) {
					resultMap.get(notComfirmedorders.get(i).getOrderNumber()).add(notComfirmedorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notComfirmedorders.get(i));
					resultMap.put(notComfirmedorders.get(i).getOrderNumber(), tmpList);
				}
			}
			List<Address> addressList = addressService.findAllAddresByShopperId(shopper.getShopperId());
			mv.addObject("addressList", addressList);
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/showOrders");
		}
		return mv;
	}

	// 确认订单
	@RequestMapping(value = "comfirmOrder.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView comfirmOrder(Integer[] orderId, Integer addressId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Orders> ordersList = new ArrayList<Orders>();
			for (int i = 0; i < orderId.length; i++) {
				Orders order = ordersService.findOrderById(orderId[i]);
				order.setAddressId(addressId);
				order.setGoodsIsCommented(1);
				ordersService.updateOrder(order);
				Goods goods = goodsService.findGoodById(order.getGoodId());
				goods.setGoodsStock(goods.getGoodsStock() - order.getGoodNumber());
				goodsService.updateGoodsStock(goods);
				order.setGoods(goods);
				ordersList.add(order);
				Cart cart = cartService.findCartById(shopper.getShopperId(), order.getGoodId());
				if (cart != null) {
					cart.setShopperId(shopper.getShopperId());
					cartService.deleteCart(cart);
				}

			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < ordersList.size(); i++) {
				if (resultMap.containsKey(ordersList.get(i).getOrderNumber())) {
					resultMap.get(ordersList.get(i).getOrderNumber()).add(ordersList.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(ordersList.get(i));
					resultMap.put(ordersList.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/comfirmOrderResult");
		}
		return mv;
	}

	// 取消未确认订单
	@RequestMapping(value = "cancelOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView cancelOrders(String orderNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Orders> order = ordersService.findOrderByOrderNumber(orderNumber);
			for (int i = 0; i < order.size(); i++) {
				ordersService.cancelOrder(order.get(i));
			}
			List<Orders> notComfirmedorders = ordersService.findNotComfirmedOrders(shopper.getShopperId());
			for (int i = 0; i < notComfirmedorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notComfirmedorders.get(i).getGoodId());
				notComfirmedorders.get(i).setGoods(goods);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notComfirmedorders.size(); i++) {
				if (resultMap.containsKey(notComfirmedorders.get(i).getOrderNumber())) {
					resultMap.get(notComfirmedorders.get(i).getOrderNumber()).add(notComfirmedorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notComfirmedorders.get(i));
					resultMap.put(notComfirmedorders.get(i).getOrderNumber(), tmpList);
				}
			}
			List<Address> addressList = addressService.findAllAddresByShopperId(shopper.getShopperId());
			mv.addObject("addressList", addressList);
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/showOrders");
		}
		return mv;
	}

	// 查看未发货订单
	@RequestMapping(value = "showNotSentOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showNotSentOrders(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Orders> notSentorders = ordersService.findNotSentOrders(shopper.getShopperId());
			for (int i = 0; i < notSentorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notSentorders.get(i).getGoodId());
				notSentorders.get(i).setGoods(goods);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notSentorders.size(); i++) {
				if (resultMap.containsKey(notSentorders.get(i).getOrderNumber())) {
					resultMap.get(notSentorders.get(i).getOrderNumber()).add(notSentorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notSentorders.get(i));
					resultMap.put(notSentorders.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/showNotSentOrders");
		}
		return mv;
	}

	// 取消未发货订单
	@RequestMapping(value = "cancelNotSentOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView cancelNotSentOrders(String orderNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Orders> order = ordersService.findOrderByOrderNumber(orderNumber);
			for (int i = 0; i < order.size(); i++) {
				ordersService.cancelOrder(order.get(i));
			}
			List<Orders> notComfirmedorders = ordersService.findNotComfirmedOrders(shopper.getShopperId());
			for (int i = 0; i < notComfirmedorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notComfirmedorders.get(i).getGoodId());
				notComfirmedorders.get(i).setGoods(goods);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notComfirmedorders.size(); i++) {
				if (resultMap.containsKey(notComfirmedorders.get(i).getOrderNumber())) {
					resultMap.get(notComfirmedorders.get(i).getOrderNumber()).add(notComfirmedorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notComfirmedorders.get(i));
					resultMap.put(notComfirmedorders.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/showNotSentOrders");
		}
		return mv;
	}

	// 查看未收货订单
	@RequestMapping(value = "showNotReceivedOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showNotReceivedOrders(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Orders> notReceivedorders = ordersService.findNotReceivedOrders(shopper.getShopperId());
			for (int i = 0; i < notReceivedorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notReceivedorders.get(i).getGoodId());
				notReceivedorders.get(i).setGoods(goods);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notReceivedorders.size(); i++) {
				if (resultMap.containsKey(notReceivedorders.get(i).getOrderNumber())) {
					resultMap.get(notReceivedorders.get(i).getOrderNumber()).add(notReceivedorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notReceivedorders.get(i));
					resultMap.put(notReceivedorders.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/showNotReceivedOrders");
		}
		return mv;
	}

	// 确认收货
	@RequestMapping(value = "comfirmReceipt.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView comfirmReceiptById(String orderNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Orders> order = ordersService.findOrderByOrderNumber(orderNumber);
			Date date = new Date();
			for (int i = 0; i < order.size(); i++) {
				order.get(i).setGoodsIsReceived(1);
				order.get(i).setGoodsReceivedTime(date);
				ordersService.comfirmReceipt(order.get(i));
				Goods goods = goodsService.findGoodById(order.get(i).getGoodId());
				order.get(i).setGoods(goods);
			}
			mv.addObject("order", order);
			mv.setViewName("jsp/comfirmReceiptResult");
		}
		return mv;
	}

	// 查看未评论订单
	@RequestMapping(value = "showNotCommentedOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showNotCommentedOrders(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Orders> notCommentedorders = ordersService.findNotCommentOrders(shopper.getShopperId());
			for (int i = 0; i < notCommentedorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notCommentedorders.get(i).getGoodId());
				notCommentedorders.get(i).setGoods(goods);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notCommentedorders.size(); i++) {
				if (resultMap.containsKey(notCommentedorders.get(i).getOrderNumber())) {
					resultMap.get(notCommentedorders.get(i).getOrderNumber()).add(notCommentedorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notCommentedorders.get(i));
					resultMap.put(notCommentedorders.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/showNotCommentedOrders");
		}
		return mv;
	}

	// 以下是卖家对订单的操作

	// 查看未确认订单
	@RequestMapping(value = "findNotComfirmedOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView findNotComfirmedOrders(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			List<Orders> notComfirmedorders = ordersService.getNotComfirmedOrders(shop.getShopId());
			for (int i = 0; i < notComfirmedorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notComfirmedorders.get(i).getGoodId());
				notComfirmedorders.get(i).setGoods(goods);
				Shopper shopper = shopperService.findShopperById(notComfirmedorders.get(i).getShopperId());
				notComfirmedorders.get(i).setShopper(shopper);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notComfirmedorders.size(); i++) {
				if (resultMap.containsKey(notComfirmedorders.get(i).getOrderNumber())) {
					resultMap.get(notComfirmedorders.get(i).getOrderNumber()).add(notComfirmedorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notComfirmedorders.get(i));
					resultMap.put(notComfirmedorders.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/seller_showNotConfirmedOrders");
		}
		return mv;
	}

	// 查看未发货订单
	@RequestMapping(value = "findNotSentOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView findNotSentOrders(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			List<Orders> notSentorders = ordersService.getNotSentOrders(shop.getShopId());
			for (int i = 0; i < notSentorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notSentorders.get(i).getGoodId());
				notSentorders.get(i).setGoods(goods);
				Shopper shopper = shopperService.findShopperById(notSentorders.get(i).getShopperId());
				notSentorders.get(i).setShopper(shopper);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notSentorders.size(); i++) {
				if (resultMap.containsKey(notSentorders.get(i).getOrderNumber())) {
					resultMap.get(notSentorders.get(i).getOrderNumber()).add(notSentorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notSentorders.get(i));
					resultMap.put(notSentorders.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/seller_showNotSentOrders");
		}
		return mv;
	}

	// 发货
	@RequestMapping(value = "SendGoods.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView SendGoods(String orderNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			List<Orders> order = ordersService.findOrderByOrderNumber(orderNumber);
			for (int i = 0; i < order.size(); i++) {
				order.get(i).setGoodsIsSent(1);
				ordersService.sendGoods(order.get(i));// 发货
				Goods goods = goodsService.findGoodById(order.get(i).getGoodId());
				order.get(i).setGoods(goods);
			}
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			List<Orders> notSentorders = ordersService.getNotSentOrders(shop.getShopId());
			for (int i = 0; i < notSentorders.size(); i++) {
				Goods goods = goodsService.findGoodById(notSentorders.get(i).getGoodId());
				notSentorders.get(i).setGoods(goods);
				Shopper shopper = shopperService.findShopperById(notSentorders.get(i).getShopperId());
				notSentorders.get(i).setShopper(shopper);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notSentorders.size(); i++) {
				if (resultMap.containsKey(notSentorders.get(i).getOrderNumber())) {
					resultMap.get(notSentorders.get(i).getOrderNumber()).add(notSentorders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notSentorders.get(i));
					resultMap.put(notSentorders.get(i).getOrderNumber(), tmpList);
				}
			}
			flag = 1;// 已发货
			mv.addObject("flag", flag);
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/seller_showNotSentOrders");
		}
		return mv;
	}

	// 查看未收货订单
	@RequestMapping(value = "findNotReceivedOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView findNotReceivedOrders(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			List<Orders> notReceivedOrder = ordersService.getNotReceivedOrders(shop.getShopId());
			for (int i = 0; i < notReceivedOrder.size(); i++) {
				Goods goods = goodsService.findGoodById(notReceivedOrder.get(i).getGoodId());
				notReceivedOrder.get(i).setGoods(goods);
				Shopper shopper = shopperService.findShopperById(notReceivedOrder.get(i).getShopperId());
				notReceivedOrder.get(i).setShopper(shopper);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < notReceivedOrder.size(); i++) {
				if (resultMap.containsKey(notReceivedOrder.get(i).getOrderNumber())) {
					resultMap.get(notReceivedOrder.get(i).getOrderNumber()).add(notReceivedOrder.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(notReceivedOrder.get(i));
					resultMap.put(notReceivedOrder.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/seller_showNotReceivedOrders");
		}
		return mv;
	}

	// 查看已完成订单
	@RequestMapping(value = "findCompletedOrders.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView findCompletedOrders(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller = (Seller) session.getAttribute("seller");
		if (seller == null) {
			mv.setViewName("jsp/seller_modifyPwd");
		} else {
			Shop shop = shopService.getShopBySellerId(seller.getSellerId());
			List<Orders> completedOrders = ordersService.getCompletedOrders(shop.getShopId());
			for (int i = 0; i < completedOrders.size(); i++) {
				Goods goods = goodsService.findGoodById(completedOrders.get(i).getGoodId());
				completedOrders.get(i).setGoods(goods);
				Shopper shopper = shopperService.findShopperById(completedOrders.get(i).getShopperId());
				completedOrders.get(i).setShopper(shopper);
			}
			Map<String, List<Orders>> resultMap = new HashMap<String, List<Orders>>();
			for (int i = 0; i < completedOrders.size(); i++) {
				if (resultMap.containsKey(completedOrders.get(i).getOrderNumber())) {
					resultMap.get(completedOrders.get(i).getOrderNumber()).add(completedOrders.get(i));
				} else {// map中不存在，新建key，用来存放数据
					List<Orders> tmpList = new ArrayList<Orders>();
					tmpList.add(completedOrders.get(i));
					resultMap.put(completedOrders.get(i).getOrderNumber(), tmpList);
				}
			}
			mv.addObject("resultMap", resultMap);
			mv.setViewName("jsp/seller_showCompletedOrders");
		}
		return mv;
	}
}