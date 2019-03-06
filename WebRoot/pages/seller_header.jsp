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
<title>导航栏</title>
<!-- 1. 兼容问题：在IE中运行最新的渲染模式 -->
<meta http-equiv="X-UA-Comatible" content="IE=edge">
<!-- 2. 导入相关的css样式文件 -->
<link rel="stylesheet"
	href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap.min.css">
<!-- 3. 导入相关的js文件 -->
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>views/jsp/manageGoods.jsp">网上购物系统</a>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a
				href="<%=basePath%>views/jsp/manageGoods.jsp"
				class="dropdown-toggle" data-toggle="dropdown">个人中心 </a>
				<ul class="dropdown-menu">
					<li><a href="<%=basePath%>views/jsp/seller_detail_info.jsp">账户信息</a></li>
					<li class="divider"></li>
					<li><a href="<%=basePath%>views/jsp/seller_modifyPwd.jsp">修改密码</a></li>
				</ul></li>
			<li class="dropdown"><a
				href="<%=basePath%>views/jsp/manageGoods.jsp"
				class="dropdown-toggle" data-toggle="dropdown">我的店铺 </a>
				<ul class="dropdown-menu">
					<li><a href="showShopInfo.do">店铺信息</a></li>
				</ul></li>
			<li class="dropdown"><a
				href="<%=basePath%>views/jsp/manageGoods.jsp"
				class="dropdown-toggle" data-toggle="dropdown">商品管理 </a>
				<ul class="dropdown-menu">
					<li><a href="showShopAllGoods.do">商品列表</a></li>
					<li class="divider"></li>
					<li><a href="<%=basePath%>views/jsp/putOnGoods.jsp"">上架商品</a></li>
				</ul></li>
			<li class="dropdown"><a
				href="<%=basePath%>views/jsp/manageGoods.jsp"
				class="dropdown-toggle" data-toggle="dropdown">订单管理 </a>
				<ul class="dropdown-menu">
					<li><a href="findNotComfirmedOrders.do">未确认订单</a></li>
					<li class="divider"></li>
					<li><a href="findNotSentOrders.do">未发货订单</a></li>
					<li class="divider"></li>
					<li><a href="findNotReceivedOrders.do">未收货订单</a></li>
					<li class="divider"></li>
					<li><a href="findCompletedOrders.do">已完成订单</a></li>
				</ul></li>
		</ul>
	</div>
	<c:if test="${sessionScope.seller==null}">
		<ul class="nav navbar-nav navbar-right user">
			<li><a href="<%=request.getContextPath()%>/views/jsp/login.jsp">你好，请登录</a></li>
			<li><a
				href="<%=request.getContextPath()%>/views/jsp/register.jsp">免费注册</a></li>
		</ul>
		<p class="navbar-text navbar-right">尊敬的游客</p>
	</c:if> <c:if test="${sessionScope.seller!=null}">
		<c:set var="sellerRealname"
			value="${sessionScope.seller.sellerRealname}" />
		<ul class="navbar-text pull-right">
			<li class="nav navbar-nav"><a
				href="<%=path + "/seller_logout.do"%>">退出</a></li>
		</ul>
		<p class="navbar-text pull-right">尊敬的卖家，${sellerRealname}&nbsp;&nbsp;&nbsp;&nbsp;您好！</p>
	</c:if> </nav>
</body>
<script>
	$('li.dropdown').mouseover(function() {
		$(this).addClass('open');
	}).mouseout(function() {
		$(this).removeClass('open');
	});
</script>
</html>
