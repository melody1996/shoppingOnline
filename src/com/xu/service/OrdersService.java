package com.xu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xu.dao.OrdersMapper;
import com.xu.model.Orders;

@Service
@Transactional
public class OrdersService {
	@Resource
	private OrdersMapper ordersMapper;

	public void addIntoOrders(Orders orders) {
		ordersMapper.addIntoOrders(orders);

	}

	public List<Orders> findNotComfirmedOrders(Integer shopperId) {
		List<Orders> orders = ordersMapper.findNotComfirmedOrders(shopperId);
		return orders;
	}

	public Orders findOrderById(Integer orderId) {
		return ordersMapper.findOrderById(orderId);
	}

	public void updateOrder(Orders order) {
		ordersMapper.updateOrder(order);
	}

	public Orders findOrderByIdAndNumber(Integer shopperId, Integer goodId, String orderNumber) {
		return ordersMapper.findOrderByIdAndNumber(shopperId, goodId, orderNumber);
	}

	public void cancelOrder(Orders order) {
		ordersMapper.cancelOrder(order);

	}

	public List<Orders> findNotSentOrders(Integer shopperId) {
		List<Orders> orders = ordersMapper.findNotSentOrders(shopperId);
		return orders;
	}

	public List<Orders> findNotReceivedOrders(Integer shopperId) {
		List<Orders> orders = ordersMapper.findNotReceivedOrders(shopperId);
		return orders;
	}

	public void comfirmReceipt(Orders order) {
		ordersMapper.comfirmReceipt(order);

	}

	public List<Orders> findOrderByOrderNumber(String orderNumber) {
		List<Orders> orders = ordersMapper.findOrderByOrderNumber(orderNumber);
		return orders;
	}

	public List<Orders> findNotCommentOrders(Integer shopperId) {
		List<Orders> orders = ordersMapper.findNotCommentOrders(shopperId);
		return orders;
	}

	// ���������ҶԶ����Ĳ���
	// �鿴δȷ�϶���
	public List<Orders> getNotComfirmedOrders(Integer shopId) {
		List<Orders> orders = ordersMapper.getNotComfirmedOrders(shopId);
		return orders;
	}

//	�鿴δ��������
	public List<Orders> getNotSentOrders(Integer shopId) {
		List<Orders> orders = ordersMapper.getNotSentOrders(shopId);
		return orders;
	}

//����
	public void sendGoods(Orders orders) {
		ordersMapper.sendGoods(orders);
	}
//	�鿴δ�ջ�����
	public List<Orders> getNotReceivedOrders(Integer shopId) {
		List<Orders> orders = ordersMapper.getNotReceivedOrders(shopId);
		return orders;
	}

	public List<Orders> getCompletedOrders(Integer shopId) {
		List<Orders> orders = ordersMapper.getCompletedOrders(shopId);
		return orders;
	}
}
