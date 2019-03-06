<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta http-equiv="X-UA-Comatible" content="IE=edge">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/kkpager/jpager.css"></link>
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/main.min.css">
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/listPage.js"></script>
<script type="text/javascript" src="<%=basePath%>js/register.js"></script>
</head>
<body>
	<jsp:include page="/pages/header.jsp" />
	<jsp:include page="/pages/search.jsp"></jsp:include>
	<div style="margin-top: 10px; width: 1525px;">
		<c:forEach items="${resultMap}" var="map">
			<div class="container">
				<div class="col-md-9">
					<div class="media" style="height: 30px;"></div>
					<section class="widget bg-white post-comments"
						style="background-color: #EEEEEE;height:170px;width:1200px;">
					<span style="font-size: 18px; color: black;">${map.value[0].goods.shopName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
						style="font-size: 14px; color: black">进店 ></a></span> <c:forEach
						items="${map.value}" var="order">
						<div class="media">
							<a class="pull-left"> <img width="125px" height="125px"
								src="${order.goods.goodsImageUrl}" alt="sjswc">
							</a>
							<div class="comment">
								<div class="comment-author h6 no-margin">
									<span style="font-size: 18px; color: black;">${order.goods.goodsName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<span style="color: grey; font-size: 16px">价格：</span><span
										style="color: red; font-size: 24px">￥&nbsp;${order.goods.goodsPrice}</span><br />
								</div>
								<div class="comment-bt">
									<span style="color: grey; font-size: 16px">描述：</span><span
										style="font-size: 16px; color: black;">${order.goods.goodsDescription}</span>
									</p>
									<br /> <span style="color: grey; font-size: 16px">数量：</span><span
										style="font-size: 14px; color: black;">${order.goodNumber}&nbsp;件</span>
								</div>
							</div>
						</div>
						<div class="media" style="height: 2px; background-color: white"></div>
					</c:forEach>
					<div style="margin-left: 1000px;">
						<form action="showCommentGoodsList.do">
							<input type="hidden" value="${map.value[0].orderNumber}"
								name="orderNumber" /> <input type="submit"
								class="btn btn-primary" value="&nbsp;评价商品&nbsp&nbsp>&nbsp;"
								style="margin-top: 10px; width: 170px; height: 40px; font-size: 18px; background-color: red" />
						</form>
					</div>
					</section>
				</div>
			</div>
			<div class="media" style="height: 4px; background-color: #EEEEEE"></div>
		</c:forEach>
	</div>
	<div class="media" style="height: 50px;"></div>
</body>
</html>
