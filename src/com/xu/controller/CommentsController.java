package com.xu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xu.model.Comments;
import com.xu.model.Goods;
import com.xu.model.Orders;
import com.xu.model.Seller;
import com.xu.model.Shopper;
import com.xu.service.CommentsService;
import com.xu.service.GoodsService;
import com.xu.service.OrdersService;
import com.xu.utils.PagedResult;

/**
 * ��Ʒ���۵Ŀ�����
 * 
 * @author SA18225420_������
 * @date 2018��11��8��
 * @version 1.0
 * @remarks TODO
 */
@Controller
public class CommentsController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private OrdersService ordersService;

	// �鿴������Ʒ�б�
	@RequestMapping(value = "showCommentGoodsList.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showCommentGoodsList(String orderNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Orders> ordersList = ordersService.findOrderByOrderNumber(orderNumber);
		for (int i = 0; i < ordersList.size(); i++) {
			Goods goods = goodsService.findGoodById(ordersList.get(i).getGoodId());
			ordersList.get(i).setGoods(goods);
		}
		mv.addObject("ordersList", ordersList);
		mv.setViewName("jsp/commentGoods");
		return mv;
	}

	// ������Ʒ
	@RequestMapping(value = "commentGoods.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView commentGoods(Integer[] goodsId, String[] commentContent, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			Date date = new Date();
			for (int i = 0; i < goodsId.length; i++) {
				Comments comment = new Comments();
				comment.setGoodsId(goodsId[i]);
				comment.setShopperId(shopper.getShopperId());
				comment.setCommentTime(date);
				comment.setCommentContent(commentContent[i]);
				commentsService.insertComment(comment);
			}
			List<Orders> notCommentOrders = ordersService.findNotCommentOrders(shopper.getShopperId());
			for (int i = 0; i < notCommentOrders.size(); i++) {
				Goods goods = goodsService.findGoodById(notCommentOrders.get(i).getGoodId());
				notCommentOrders.get(i).setGoods(goods);
			}
			mv.addObject("notCommentOrders", notCommentOrders);
			mv.setViewName("jsp/commentResult");
		}
		return mv;
	}

	// �鿴���������б�
	@RequestMapping(value = "showAllCommentByShopperId.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showAllCommentByShopperId(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Shopper shopper = (Shopper) session.getAttribute("shopper");
		if (shopper == null) {
			mv.setViewName("jsp/modifyPwd");
		} else {
			List<Comments> comments = commentsService.findCommentByShopperId(shopper.getShopperId());
			for (int i = 0; i < comments.size(); i++) {
				Goods goods = goodsService.findGoodById(comments.get(i).getGoodsId());
				comments.get(i).setGoods(goods);
				System.out.println(comments.get(i).getCommentContent());

			}
			mv.addObject("comments", comments);
			mv.setViewName("jsp/shopperCommentList");
		}
		return mv;
	}

	// �鿴��Ʒ�����б�
	@RequestMapping(value = "showGoodsCommentById.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView showGoodsCommentById(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, Integer goodsId,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Seller seller=(Seller) session.getAttribute("seller");
		Goods goods = goodsService.findGoodById(goodsId);
		PagedResult<Comments> pageResult = commentsService.findCommentById(goodsId, pageNumber, pageSize);
		int count=goodsService.getCommentCountById(goodsId);
		mv.addObject("pageResult", pageResult);
		mv.addObject("goods", goods);
		mv.addObject("count", count);
		if(seller==null) {
			mv.setViewName("jsp/goodsCommentList");
		}else {
			mv.setViewName("jsp/seller_goods_detail");
		}
		
		return mv;
	}

}