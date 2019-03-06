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
	<div style="margin-top: 10px; width: 1535px; background-color: #EEEEEE">
		<div class="container">
			<div class="col-md-9">
				<div style="color: green; font-size: 20px; margin-top: 30px;">
					(๑>؂<๑）&nbsp;&nbsp;&nbsp;评价成功！</div>
				<div style="margin-left: 320px">		
					<a href="showAllGoods.do" class="btn btn-primary"
						style="margin-top: 50px; width: 170px; height: 40px; font-size: 18px; background-color: white; color: red" >&nbsp;返回首页&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="showAllCommentByShopperId.do" class="btn btn-primary"
						style="margin-top: 50px; width: 170px; height: 40px; font-size: 18px; background-color: red" >&nbsp;查看评价&nbsp&nbsp&nbsp;</a>
				</div>
				<div class="tab-pane active" id="home" style="margin-top: 50px;">
					<strong style="font-size: 20px">这些宝贝还有机会评论一下</strong>
					<div class="media"
						style="height: 3px; width: 1200px; background-color: grey"></div>
					<div class="media" style="height: 30px; width: 1200px;"></div>
					<div class="media"
						style="height: 4px; width: 1200px; background-color: white"></div>
					<section class="widget bg-white post-comments"
						style="background-color: #EEEEEE;height:170px;width:1200px;">
					<c:forEach items="${notCommentOrders}" var="order">
						<div class="media">
							<a class="pull-left"> <img width="125px" height="125px"
								src="${order.goods.goodsImageUrl}" alt="sjswc">
							</a>
							<div class="comment">
								<div class="comment-author h6 no-margin">
									<div class="comment-meta small">
										<a href="showGoodsDetailInfo.do?goodsId=${s.goodsId}"
											class="badge-comment">去评价</a>
									</div>
									<span style="font-size: 18px; color: black;">${order.goods.goodsName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
								<br />
								<div class="comment-bt">
									<span style="color: grey; font-size: 16px">描述：</span><span
										style="font-size: 16px; color: black;">${order.goods.goodsDescription}</span>
								</div>
							</div>
						</div>
						<div class="media" style="height: 4px; background-color: white"></div>
					</c:forEach> </section>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
