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
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/main.min.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/num-alignment.js"></script>
<script type="text/javascript" src="<%=basePath%>js/checkbox.js"></script>
</head>
<body onload="flush()">
	<jsp:include page="/pages/header.jsp" />
	<form action="addIntoOrder.do" method="post">
		<div>
			<div style="margin-left: 150px;">
				<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="font-size: 20px;">我的购物车</span>
			</div>
		</div>
		<div class="container"
			style="margin-top: 20px; margin-left: 170px; width: 1600px">
			<div class="col-md-9" id="cartDiv">
				<div class="list-group-item active"
					style="background-color: #EEEEEE">
					<input id="checkboxall" type="checkbox" name="checkboxbutton"
						onclick="funcCheckAll()" checked="checked"
						style="margin-left: 10px;"><span
						style="font-size: 18px; color: black;">&nbsp;&nbsp;&nbsp;&nbsp;全选</span>
					<span style="font-size: 18px; color: black; margin-left: 50px">商品</span>
					<span style="font-size: 18px; color: black; margin-left: 450px">单价</span>
					<span style="font-size: 18px; color: black; margin-left: 100px">数量</span>
					<span style="font-size: 18px; color: black; margin-left: 110px">小计</span>
					<span
						style="font-size: 18px; float: right; margin-right: 20px; color: black">操作</span>
				</div>
				<div class="tab-pane active" id="home">
					<section class="widget bg-white post-comments"
						style="border-style:solid; border-width:1px; border-color:blue;">
					<c:forEach items="${cart}" var="cart">
						<div class="media">
							<input type="hidden" id="subcheck" name="ids" value="0" /> <input
								id="subcheck" type="checkbox" name="ids" checked="checked"
								onclick="checkReturn(this)" class="pull-left"
								style="margin-left: 10px; margin-top: 40px"
								value="${cart.goodsId }"></input> <input type="hidden"
								value="${cart.goodsNumber }" /> <input type="hidden"
								value="${cart.goodsTotalPrice }" /><a class="pull-left"
								style="margin-left: 10px"> <img width="100px" height="100px"
								src="${cart.goodsImageUrl}" alt="sjswc" />
							</a>
							<div class="comment">
								<div class="comment-author h6 no-margin">
									<div class="comment-meta small">
										<a href="deleteCartById.do?goodsId=${cart.goodsId}"
											style="font-size: 13px; margin-right: 20px; margin-top: 40px"
											class="badge-comment" onclick="return confirm('删除商品？')">删除</a>
									</div>
									<div style="width: 400px; float: left; margin-top: 10px">
										<span style="font-size: 18px; color: black;">${cart.goodsName}
											<br />
										</span>
									</div>
									<div
										style="width: 100px; float: left; margin-top: 40px; margin-left: 60px">
										<span style="color: red; font-size: 18px">￥&nbsp;&nbsp;${cart.goodsPrice}</span>
									</div>
									<input type="hidden" name="goodsId" value="${cart.goodsId }" />
									<div class="sumGoods"
										style="width: 80px; float: left; margin-top: 35px; margin-left: 60px">
										<input type="tel" class="form-control" id="goodsNumber"
											name="goodsNumber" onblur="modifyNumber(this)"
											value=${cart.goodsNumber }
											onkeyup="this.value=this.value.replace(/\D|^0/g,'')"
											onafterpaste="this.value=this.value.replace(/\D|^0/g,'')" />
									</div>
									<div class="goodsTotalPrice"
										style="width: 100px; float: left; margin-top: 40px; margin-left: 80px">
										<span class="totalPrice" style="font-size: 18px">${cart.goodsTotalPrice}</span>
									</div>
								</div>
								<div class="comment-bt" style="width: 400px">
									<span style="font-size: 16px; color: grey;">${cart.goodsDescription}</span>
								</div>
							</div>
						</div>
					</c:forEach> </section>
				</div>
				<div class="list-group-item active"
					style="background-color: white; margin-top: -20px">
					<span style="font-size: 16px; color: grey; margin-left: 650px">已选择了</span><span
						style="font-size: 16px; color: red; margin-left: 10px" id="sum"></span><span
						style="font-size: 16px; color: grey; margin-left: 10px">件商品</span>
					<span style="font-size: 16px; color: grey; margin-left: 30px">总价</span><strong
						style="font-size: 18px; color: black; margin-left: 20px; color: red;">￥&nbsp;</strong><strong
						style="font-size: 18px; color: black; color: red;" id="totalPrice"></strong>
					<input type="submit" class="btn btn-primary" id="balanceButton"
						style="font-size: 18px; float: right; margin-top: -10px; margin-right: -16px; height: 48px; width: 150px; background-color: red"
						value="去结算"></input>
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	$(document).ready(function() {
		var cart = ${cart};
		if (cart == "") {
			$("#cartDiv").css("display", "none");
			alert("购物车空空如也");
			document.location.href = "views/jsp/index.jsp";
		}
	});
</script>
</html>
