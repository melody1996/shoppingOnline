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
<script type="text/javascript" src="<%=basePath%>js/checkbox.js"></script>
</head>
<script>
function checkStatus(){
	var status="${goods.goodsStatus}";
	if(status==1){
		$("#addIntoCart").attr("disabled",true);
		$("#addIntoCart").css("background-color","grey");
		$("#addIntoCart").val("已下架");
	}
}
</script>
<body onload="checkStatus()">
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
							<a href="showGoodsCommentById.do?goodsId=${goods.goodsId}"
								class="badge-comment">${count}条评论</a>
						</div>
						<span style="font-size: 18px; color: black;">${goods.goodsName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="comment-bt">
						<span style="color: grey; font-size: 16px">价格：</span><span
							style="color: red; font-size: 24px">￥&nbsp;${goods.goodsPrice}</span><br />
						<span style="color: grey; font-size: 16px">描述：</span><span
							style="font-size: 16px; color: black;">${goods.goodsDescription}</span>
						</p>
						<span style="color: grey; font-size: 16px">库存：</span><span
							style="font-size: 16px; color: black;">${goods.goodsStock}</span>
						</p>

						<br /> <span style="font-size: 14px; color: grey;">${goods.shopName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="showAllGoodsByShopId.do?shopId=${goods.shopId}"
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
							<div style="position: absolute; margin-top: 20px">
								<input type="submit" class="btn btn-primary" id="addIntoCart"
									value="&nbsp;&nbsp;加入购物车&nbsp;&nbsp;"
									style="margin-top: 30px; width: 150px; height: 50px; font-size: 20; background-color: red" />
							</div>
						</form>
					</div>
				</div>
			</div>
			</section>
		</div>
	</div>
	<div
		style="position: absolute; bottom: 0; margin-top: 20px; width: 100%; background-color: rgba(0, 0, 0, 0.8); height: 60px; color: darkgray">
		<div
			style="width: 400px; padding-top: 18px; padding-left: 40px; padding-right: 40px; margin: auto;">
			<div>
				友情链接： <a href="" style="color: darkgray">&nbsp;github&nbsp;|&nbsp;</a>
				<a href="http://www.csdn.net/" style="color: darkgray">csdn&nbsp;|&nbsp;</a>
				<a href="http://www.oschina.net/" style="color: darkgray">开源中国&nbsp;|&nbsp;</a>
				<a href="http://stackoverflow.com/" style="color: darkgray">stackflow</a><br>
			</div>
		</div>
	</div>
</body>
</html>
