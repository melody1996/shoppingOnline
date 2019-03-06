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
	<div
		style="margin-top: 30px; margin-left: 0px; width: 2200px; background-color: #EEEEEE">
		<div class="container" style="margin-left: 170px; width: 1600px">
			<div class="row">
				<div class="col-md-9">
					<ul class="list-group">
						<div
							style="color: green; font-size: 20px; margin-top: 30px; margin-left: 20px">
							(๑>؂<๑）&nbsp;&nbsp;&nbsp;商品已成功加入购物车！</div>
						<div class="tab-pane active" id="home">
							<section class="widget bg-white post-comments"
								style="background-color: #EEEEEE;height:170px"> <c:set
								value="${goods}" var="goods"></c:set> <c:set value="${goodsNum}"
								var="goodsNum"></c:set>
							<div class="media">
								<a class="pull-left"> <img width="100px" height="100px"
									src="${goods.goodsImageUrl}" alt="sjswc">
								</a>
								<div class="comment">
									<div class="comment-author h6 no-margin">
										<span style="font-size: 18px; color: black;">${goods.goodsName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
										<span style="color: grey; font-size: 16px">价格：</span><span
											style="color: red; font-size: 24px">￥&nbsp;${goods.goodsPrice}</span><br />
									</div>
									<div class="comment-bt">
										<span style="color: grey; font-size: 16px">描述：</span><span
											style="font-size: 16px; color: black;">${goods.goodsDescription}</span>
										<p></p>
										<span style="color: grey; font-size: 16px">数量：</span><span
											style="font-size: 16px; color: black;">${goodsNum}</span>
										<div style="float: right; margin-top: 0px">
											<form action="showCart.do" method="post">
												<input type="submit" class="btn btn-primary"
													value="&nbsp;去购物车结算&nbsp&nbsp>&nbsp;"
													style="margin-top: 10px; width: 170px; height: 40px; font-size: 18px; background-color: red" />
											</form>
										</div>
										<div style="float: right; margin-right: 20px">
											<form action="showGoodsDetailInfo.do" method="post">
												<input type="hidden" value=${goods.goodsId } name="goodsId" />
												<input type="submit" class="btn btn-primary"
													value="&nbsp;查看商品详情&nbsp;"
													style="margin-top: 10px; width: 170px; height: 40px; font-size: 18px; background-color: white; color: red;">
											</form>
										</div>

									</div>
								</div>
							</div>
							</section>
						</div>
				</div>
				</ul>
			</div>
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
