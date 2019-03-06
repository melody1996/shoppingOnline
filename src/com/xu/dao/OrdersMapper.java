package com.xu.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xu.model.Orders;

public interface OrdersMapper {

	void addIntoOrders(Orders orders);

	List<Orders> findNotComfirmedOrders(Integer shopperId);

	Orders findOrderById(Integer orderId);

	void updateOrder(Orders order);

	Orders findOrderByIdAndNumber(@Param("shopperId")Integer shopperId, @Param("goodId")Integer goodId,  @Param("orderNumber")String orderNumber);

	void cancelOrder(Orders order);

	List<Orders> findNotSentOrders(Integer shopperId);

	List<Orders> findNotReceivedOrders(Integer shopperId);

	void comfirmReceipt(Orders order);

	List<Orders> findOrderByOrderNumber(String orderNumber);

	List<Orders> findNotCommentOrders(Integer shopperId);

	List<Orders> getNotComfirmedOrders(Integer shopId);

	List<Orders> getNotSentOrders(Integer shopId);

	void sendGoods(Orders orders);

	List<Orders> getNotReceivedOrders(Integer shopId);

	List<Orders> getCompletedOrders(Integer shopId);
}