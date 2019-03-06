<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/kkpager/jpager.css"></link>
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/main.min.css">
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/listPage.js"></script>
<title>导航栏</title>
<script>
	function show(){
		var flag="<%=session.getAttribute("pageResult")%>";
		if (flag == "null" || flag == "") {
			document.location.href = "showAllGoods.do";
		} else {
			var pages = "${pageResult.pages}";
			var total = "${pageResult.total}";
			showAllGoodsPage(pages, total);
		}
	}
</script>
</head>
<body onload="show()" style="background-color: #EEEEEE">
	<c:if test="${sessionScope.seller==null}">
		<jsp:include page="/pages/header.jsp"></jsp:include>
	</c:if>
	<c:if test="${sessionScope.seller!=null}">
		<jsp:include page="/pages/seller_header.jsp"></jsp:include>
	</c:if>
	<jsp:include page="/pages/search.jsp"></jsp:include>
	<div class="container"
		style="margin-top: 10px; width: 1515px; background-color: white;">
		<div class="col-md-9" style="margin-left: 200px;">
			<section class="widget bg-white post-comments"
				style="background-color: white; width:1000px"> <c:forEach
				items="${pageResult.dataList}" var="s">
				<div class="media" style="height: 150px">
					<a class="pull-left"
						href="showGoodsDetailInfo.do?goodsId=${s.goodsId}"> <img
						width="110px" height="110px" src="${s.goodsImageUrl}" alt="sjswc">
					</a>
					<div class="comment">
						<div class="comment-author h6 no-margin">
							<div class="comment-meta small">
								<a href="showGoodsDetailInfo.do?goodsId=${s.goodsId}"
									class="badge-comment">查看详情</a>
							</div>
							<a href="showGoodsDetailInfo.do?goodsId=${s.goodsId}"
								style="font-size: 18px; color: black;">${s.goodsName}</a> <span
								style="color: red; font-size: 18px; float: right; margin-right: 20px">￥&nbsp;&nbsp;${s.goodsPrice}</span>
						</div>
						<div class="comment-bt" style="height: 120px;">
							<span style="font-size: 14px; color: black;">${s.goodsDescription}</span>
							</p>
							<br /> <span style="font-size: 14px; color: grey;">${s.shopName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="showAllGoodsByShopId.do?shopId=${s.shopId}"
								style="font-size: 12px; color: black">进店 ></a></span>
							<div class="media" style="height: 2px; background-color: #EEEEEE"></div>
						</div>
					</div>
				</div>
			</c:forEach> </section>
		</div>
	</div>
	<div id="jpager" style="margin-right: 400px; margin-left: 550px;"></div>
	<br />
</body>
</html>
