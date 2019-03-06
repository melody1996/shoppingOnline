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
	<form action="commentGoods.do" method="post">
		<div
			style="margin-top: 10px; width: 1535px; background-color: #EEEEEE">
			<div class="container">
				<div class="col-md-9">
					<div class="tab-pane active" id="home" style="margin-top: 30px;">
						<c:set value="${ordersList}" var="ordersList"></c:set>
						<span style="font-size: 18px; color: black;">${ordersList[0].goods.shopName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							style="font-size: 14px; color: black">进店 ></a></span>
						<section class="widget bg-white post-comments"
							style="background-color: #EEEEEE;height:170px;width:1200px;margin-left: -10px;">
						<c:forEach items="${ordersList}" var="ordersList">
							<div class="media">
								<a class="pull-left"> <img width="125px" height="125px"
									src="${ordersList.goods.goodsImageUrl}" alt="sjswc">
								</a>
								<div class="comment">
									<div class="comment-author h6 no-margin">
										<span style="font-size: 18px; color: black;">${ordersList.goods.goodsName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
									<br />
									<div class="comment-bt">
										<span style="color: grey; font-size: 16px">描述：</span><span
											style="font-size: 16px; color: black;">${ordersList.goods.goodsDescription}</span>
									</div>
								</div>
							</div>
							<input type="hidden" name="goodsId" value="${ordersList.goods.goodsId}">
							<textarea style="width: 1200px; height: 100px; margin-top: 30px"
								name="commentContent" placeholder="宝贝满足你的期待吗？说说它的优点和美中不足的地方吧"></textarea>
							<div class="media" style="height: 4px; background-color: white"></div>
						</c:forEach> </section>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-left: 1200px">
			<input type="submit" class="btn btn-primary"
				value="&nbsp;发布评价&nbsp&nbsp&nbsp;"
				style="margin-top: 10px; width: 170px; font-size: 18px; background-color: red" />

		</div>
	</form>
</body>
</html>
