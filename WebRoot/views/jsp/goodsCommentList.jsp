<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
<script>
	function show() {
			var status="${goods.goodsStatus}";
			if(status==1){
				$("#addIntoCart").attr("disabled",true);
				$("#addIntoCart").css("background-color","grey");
				$("#addIntoCart").val("已下架");	
		}
		var count = "${count}";
		if (count == 0) {
			$("#noneComment").text("暂无评论  ＞﹏＜");
		} else {
			var pages = "${pageResult.pages}";
			var total = "${pageResult.total}";
			commentPage(pages, total);
		}
	}
</script>
</head>
<body onload="show()">
	<jsp:include page="/pages/header.jsp" />
	<div>
		<div style="margin-left: 150px;">
			<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 20px;">商品详情</span>
		</div>
	</div>
	<div class="container" style="margin-top: 30px; margin-left: 330px;">
		<div class="col-md-9">
			<div class="list-group-item active"
				style="background-color: #EEEEEE; color: black">
				<strong>商品详情</strong>
			</div>
			<section class="widget bg-white post-comments"
				style="border-style:solid; border-width:2px; border-color:#EEEEEE;height:400px">
			<c:set value="${goods}" var="goods"></c:set> <c:set value="${count}"
				var="count"></c:set>
			<div class="media">
				<a class="pull-left"> <img width="300px" height="300px"
					src="${goods.goodsImageUrl}" alt="sjswc">
				</a>
				<div class="comment">
					<div class="comment-author h6 no-margin">
						<div class="comment-meta small">
							<input id="goodsId" name="goodsId" type="hidden"
								value="${goods.goodsId}" /> <a
								href="showGoodsCommentById.do?goodsId=${goods.goodsId}"
								class="badge-comment">${count}条评论</a>
						</div>
						<span style="font-size: 18px; color: black;">${goods.goodsName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="comment-bt">
						<span style="color: grey; font-size: 16px">价格：</span><span
							style="color: red; font-size: 24px">￥&nbsp;${goods.goodsPrice}</span><br />
						<span style="color: grey; font-size: 16px">描述：</span><span
							style="font-size: 16px; color: black;">${goods.goodsDescription}</span>
						<br /> <span style="color: grey; font-size: 16px">库存：</span><span
							style="font-size: 16px; color: black;">${goods.goodsStock}件</span>
						<br /> <br /> <span style="font-size: 14px; color: grey;">${goods.shopName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="showAllGoodsByShopId.do?shopId=${goods.shopId}"
							style="font-size: 14px; color: black">进店 ></a></span> <br />
						<form action="addIntoCart.do" method="post">
							<input type="hidden" name="goodsId" value=${goods.goodsId } />
							<div>
								<input
									style="height: 40px; margin-top: 10px; width: 20%; float: left"
									id="goodsNumber" required type="text" class="form-control"
									name="goodsNumber" value="1" onblur="checkNumber(this)"
									onkeyup="this.value=this.value.replace(/\D|^0/g,'')"
									onafterpaste="this.value=this.value.replace(/\D|^0/g,'')" />
							</div>
							<br />
							<div style="position: absolute; margin-top: 30px">
								<input type="submit" class="btn btn-primary"
									value="&nbsp;&nbsp;加入购物车&nbsp;&nbsp;" id="addIntoCart"
									style="margin-top: 30px; width: 150px; height: 50px; font-size: 20; background-color: red" />
							</div>
						</form>
					</div>
				</div>
			</div>
			</section>
			<div class="list-group-item active"
				style="background-color: #EEEEEE; color: black">
				<strong>商品评价</strong>
			</div>
			<section class="widget bg-white post-comments"
				style="background-color: white; width:825px;border-style:solid; border-width:2px; border-color:#EEEEEE;">
			<div style="margin-left: 350px; margin-top: 20px">
				<span id="noneComment" style="font-size: 16px; color: black"></span>
			</div>
			<c:forEach items="${pageResult.dataList}" var="comment">
				<div class="media">
					<div style="float: left" name="shopperName">
						<span style="font-size: 18px; color: black">${comment.shopper.shopperName}</span>
					</div>
					<div style="float: left; margin-left: 50px; margin-top: 4px">
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
				<div class="media" style="height: 2px; background-color: #EEEEEE"></div>
			</c:forEach>
			<div id="jpager" style="margin-left: 300px"></div>
			</section>
		</div>
	</div>
	<jsp:include page="/pages/buttom.jsp" />
</body>
<script>
	function trim(str) {
		return str.replace(/^(\s|\u00A0)+/, '').replace(/(\s|\u00A0)+$/, '');
	}
	$("div[name='shopperName']").each(
			function() {
				shopperName = $.trim($(this).text())
				var _shopperName = "";
				var length = shopperName.length;
				if (length > 2) {
					var length = 3;
					while (length > 0) {
						_shopperName += "*";
						length--;
					}
					shopperName = shopperName.substr(0, 1)
							+ _shopperName
							+ shopperName.substr(shopperName.length - 1,
									shopperName.length);
					$(this).text(shopperName);
				}
			});
</script>
</html>
