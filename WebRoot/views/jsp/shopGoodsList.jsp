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
<script>
	function show() {
		var flag = "${goodsFlag}"
		if (flag == 1) {
			alert("已下架");
		}else if(flag == 1){
			alert("已上架");
		}
		var pageResult = "${pageResult}";
		if (pageResult == "null" || pageResult == "") {
			$("#noneGoods").text("暂无商品  ＞﹏＜");
		} else {
			var pages = "${pageResult.pages}";
			var total = "${pageResult.total}";
			seller_ShopGoodsPage(pages, total);
		}
	}
</script>
</head>
<body onload="show()">
	<jsp:include page="/pages/seller_header.jsp"></jsp:include>
	<div>
		<div style="margin-left: 250px; margin-top: 20px">
			<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 20px;">商品列表</span>
		</div>
	</div>
	<div class="container"
		style="margin-top: 20px; width: 1515px; background-color: #EEEEEE;">
		<div class="col-md-9" style="margin-left: 200px;">
			<section class="widget bg-white post-comments"
				style="background-color: #EEEEEE; width:1000px">
			<div style="margin-left: 350px; margin-top: 20px">
				<span id="noneGoods" style="font-size: 16px; color: black"></span>
			</div>
			<input type="hidden" id="shopId" value="${shop.shopId}" />
			<c:forEach items="${pageResult.dataList}" var="s">
				<div class="media" style="height: 150px">
					<a class="pull-left"
						href="showGoodsCommentById.do?goodsId=${s.goodsId}"> <img
						width="110px" height="110px" src="${s.goodsImageUrl}" alt="sjswc">
					</a>
					<div class="comment">
						<div class="comment-author h6 no-margin">
							<div class="comment-meta small" name="button">
								<input type="hidden" value="${s.goodsStatus}"> <a
									href="findGoodsById.do?goodsId=${s.goodsId}"
									class="badge-comment">修改</a> <a
									href="putOffGoodsById.do?goodsId=${s.goodsId}"
									onclick="return confirm('是否下架该商品？')" class="badge-comment">下架</a>
								<a style="display: none;float:right;"
									href="reputOnGoodsById.do?goodsId=${s.goodsId}"
									onclick="return confirm('是否上架该商品？')" class="badge-comment">上架</a>

							</div>
							<div>
								<a href="showGoodsCommentById.do?goodsId=${s.goodsId}"
									style="font-size: 18px; color: black;">${s.goodsName}</a> <span
									style="color: red; font-size: 18px; float: right; margin-right: 50px">￥&nbsp;&nbsp;${s.goodsPrice}</span>
							</div>
						</div>
						<br />
						<div class="comment-bt" style="height: 120px;">
							<div>
								<span style="font-size: 14px; color: black;">${s.goodsDescription}</span>
							</div>
							<div class="media"
								style="height: 2px; background-color: white; margin-top: 50px"></div>
						</div>
					</div>
				</div>
			</c:forEach> </section>
		</div>
	</div>
	<div id="jpager" style="margin-right: 400px; margin-left: 550px;"></div>
	<br />
</body>
<script>
	$("div[name='button']").each(function() {
		var status = $(this).find("input").eq(0).val();
		if (status == 1) {
			$(this).find("a").eq(1).css("display", "none");
			$(this).find("a").eq(2).css("display", "block");
		}
	});
</script>
</html>
