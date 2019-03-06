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
	<div class="container"
		style="margin-top: 20px; margin-left: 170px; width: 1600px">
		<div class="col-md-9">
			<div
				style="color: green; font-size: 20px; margin-top: 30px; margin-left: 20px">
				(๑>؂<๑）&nbsp;&nbsp;&nbsp;下单成功！</div>
			<div class="media" style="height: 30px; background-color: white"></div>
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
									<div style="width: 500px; float: left; margin-top: 0px">
										<span style="font-size: 18px; color: black;">${list.goods.goodsName}<br />
										<br /> <span style="font-size: 16px; color: grey;">${list.goods.goodsDescription}
												<br />
										</span>
									</div>
									<div
										style="width: 100px; float: left; margin-top: 20px; margin-left: 30px">
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

					</c:forEach>
					<div class="media" style="height: 10px;"></div>
					<div style="margin-left: 30px;">
						<strong style="font-size: 20px">订单信息</strong><br />
						<div style="background-color: black; height: 2px; width: 300px"></div>
						<div style="height: 10px; width: 300px"></div>
						<span style="font-size: 18px">订单号：${map.value[0].orderNumber }</span>
						<div style="height: 0px; width: 300px"></div>
						<br /> <span style="font-size: 18px">下单时间：<fmt:formatDate
								value='${map.value[0].orderTime }' type="both" /></span>
					</div>
					<br />
				</div>
				<br />
			</c:forEach>
		</div>
	</div>
</body>
</html>
