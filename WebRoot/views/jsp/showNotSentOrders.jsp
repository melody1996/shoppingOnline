<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/main.min.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/checkbox.js"></script>
</head>
<body>
	<jsp:include page="/pages/header.jsp" />
	<div>
		<div style="margin-left: 150px;">
			<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 20px;">待发货订单</span>
		</div>
	</div>
	<div class="container"
		style="margin-top: 20px; margin-left: 170px; width: 1600px">
		<div class="col-md-9">
			<div>
				<span style="font-size: 18px; color: black; margin-left: 50px">店铺宝贝</span>
				<span style="font-size: 18px; color: black; margin-left: 530px">单价</span>
				<span style="font-size: 18px; color: black; margin-left: 170px">数量</span>
				<span style="font-size: 18px; color: black; margin-left: 120px">小计</span>
			</div>
			<div class="media" style="height: 3px; background-color: #99CCFF"></div>
			<br />
			<c:forEach items="${resultMap}" var="map">
				<span style="font-size: 18px; color: black;">${map.value[0].goods.shopName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="showAllGoodsByShopId.do?shopId=${map.value[0].goods.shopId}"
					style="font-size: 14px; color: black">进店 ></a></span>
				<div style="background-color: #EEEEEE; margin-top: 20px">
					<div class="media" style="height: 5px;"></div>
					<c:forEach items="${map.value}" var="list">
						<input type="hidden" name="orderId" value="${list.orderId}">
						<!-- 订单编号 -->
						<div class="media">
							<a class="pull-left" style="margin-left: 10px"> <img
								width="100px" height="100px" src="${list.goods.goodsImageUrl}"
								alt="sjswc" />
							</a>
							<div class="comment">
								<div class="comment-author h6 no-margin">
									<div style="width: 400px; float: left; margin-top: 10px">
										<span style="font-size: 18px; color: black;">${list.goods.goodsName}
										</span> <br /> <br /> <span style="font-size: 14px; color: grey;">${list.goods.goodsDescription}</span>
									</div>
									<div
										style="width: 100px; float: left; margin-top: 20px; margin-left: 130px">
										<span style="color: red; font-size: 18px">￥&nbsp;&nbsp;${list.goods.goodsPrice}</span>
									</div>
									<div
										style="width: 80px; float: left; margin-top: 20px; margin-left: 120px">
										<span style="font-size: 18px">X${list.goodNumber }</span>
									</div>
									<div
										style="width: 80px; float: left; margin-top: 20px; margin-left: 60px">
										<span style="color: red; font-size: 18px">￥&nbsp;&nbsp;${list.orderTotalPrice }</span><br />
									</div>
								</div>
							</div>
						</div>
						<div class="media" style="height: 2px; background-color: white"></div>
					</c:forEach>
					<div class="media" style="height: 15px;"></div>
					<a
						href="cancelNotSentOrders.do?orderNumber=${map.value[0].orderNumber}"
						onclick="return confirm('是否取消该订单？')"
						style="font-size: 18px; margin-left: 20px;">取消订单</a>
					<div style="float: right; margin-right: 50px;">
						<span style="font-size: 18px">付款方式：&nbsp;&nbsp;<input
							type="radio" checked="checked" value="0">&nbsp;&nbsp;货到付款
						</span><br /> <br />
						<c:set var="totalPrice" value="0"></c:set>
						<c:forEach var="i" begin="0" end="${fn:length(map.value)}"
							step="1">
							<c:set var="totalPrice"
								value="${totalPrice + map.value[i].orderTotalPrice}" />
						</c:forEach>
						<span style="font-size: 18px">店铺合计：</span><strong
							style="font-size: 24px; color: red">￥&nbsp;&nbsp;<fmt:formatNumber
								type="number" value="${totalPrice}" pattern="0.00"
								maxFractionDigits="2" /></strong>
					</div>
					<div style="height: 40px"></div>
					<br />
				</div>
				<br />
			</c:forEach>
		</div>
	</div>
</body>
</html>
