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
	<div style="margin-top: 10px; width: 1535px; background-color: #EEEEEE">
		<div class="container">
			<div class="col-md-9" style="margin-top: 30px">
				<strong style="font-size: 20px">全部评价</strong>
				<div class="media"
					style="height: 3px; width: 1200px; background-color: grey"></div>
				<section class="widget bg-white post-comments"
					style="background-color: #EEEEEE;height:170px;width:1200px;">
				<c:set var="shopperName" value="${sessionScope.shopper.shopperName}"></c:set>
				<c:forEach items="${comments}" var="comment">
					<div class="media">
						<div style="float: left">
							<span style="font-size: 18px; color: black" id="shopperName">
							</span>
						</div>
						<div style="float: left; margin-left: 50px; margin-top: 3px">
							<span style="font-size: 14px;">评价时间： <fmt:formatDate
									value="${comment.commentTime}" pattern="yyyy-MM-dd  HH:mm" />
							</span>
						</div>
					</div>
					<br />
					<div style="margin-left: 150px">
						<span style="font-size: 14px; color: black">${comment.commentContent}
						</span>
					</div>
					<br />
					<div class="media">
						<a class="pull-left"> <img width="125px" height="125px"
							src="${comment.goods.goodsImageUrl}" alt="sjswc">
						</a>
						<div class="comment">
							<div class="comment-author h6 no-margin">
								<span style="font-size: 18px; color: black;">${comment.goods.goodsName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<br />
							<div class="comment-bt">
								<span style="color: grey; font-size: 16px">描述：</span><span
									style="font-size: 14px; color: black;">${comment.goods.goodsDescription}</span>
							</div>
							<div style="margin-top: 20px;">
								<span style="color: red; font-size: 18px">￥&nbsp;&nbsp;${comment.goods.goodsPrice}</span>
							</div>
						</div>
					</div>
					<div class="media" style="height: 4px; background-color: white"></div>
				</c:forEach> </section>
			</div>
		</div>
	</div>
	<div style="height: 40px"></div>
</body>
<script>
	var shopperName = "${shopperName}";
	var _shopperName = "";
	var length = shopperName.length
	if (length > 2) {
		var length = 3;
		while (length > 0) {
			_shopperName += "*";
			length--;
		}
		shopperName = shopperName.substr(0, 1)
				+ _shopperName
				+ shopperName
						.substr(shopperName.length - 1, shopperName.length);
		
		$("span#shopperName").append(shopperName);
	}
</script>
</html>
