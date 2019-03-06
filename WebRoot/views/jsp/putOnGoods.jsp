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
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/modify.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/modify.js"></script>
<script>
	function judge(){		
		var seller="<%=session.getAttribute("seller")%>";
		if (seller == "null" || seller == "") {
			alert("您还未登录");
			document.location.href = "views/jsp/seller_login.jsp";
		} 
	}
</script>
</head>
<body onload="judge()" style="background-color: #EEEEEE">
	<jsp:include page="/pages/seller_header.jsp" />
	<div>
		<div style="margin-left: 150px;">
			<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 20px;">上架商品</span>
		</div>
		<div style="margin-left: 1100px">
			<a href="<%=request.getContextPath()%>/views/jsp/manageGoods.jsp">返回首页>></a>
		</div>
	</div>
	<div class="modify"
		style="margin-top: 20px; width: 400px; height: 460px">
		<form action="putOnGoods.do" method="post" enctype="multipart/form-data">
			<input id="goodsName" required type="text" class="form-control"
				name="goodsName" style="height: 40px; margin-top: 10px;"
				placeholder="请输入商品名"> <input id="goodsPrice" required
				type="text" class="form-control" name="goodsPrice"
				style="height: 40px; margin-top: 20px;" placeholder="请输入单价">
			<input id="goodsStock" required type="text" class="form-control"
				name="goodsStock" style="height: 40px; margin-top: 20px;"
				placeholder="请输入库存量"> <input id="goodsAddress" required
				type="text" class="form-control" name="goodsAddress"
				style="height: 40px; margin-top: 20px;" placeholder="请输入产地">
			<textarea id="goodsDescription" required type="text"
				class="form-control" name="goodsDescription"
				style="height: 40px; margin-top: 20px;" placeholder="商品描述" ></textarea>
			<input type="file" class="form-control" style="height: 40px; margin-top: 20px;padding-top: 0px;padding-left: 0px;" name="file">
			<div style="height: 100px; width: 100%; margin-top: 10px;">
				<div style="float: left; width: 50%; padding: 20px;">
					<input type="submit" class="btn btn-primary" value="上架"
						style="margin: auto; width: 100%; height: 40px; padding: 10px;"></input>
				</div>
				<div style="float: right; width: 50%; padding: 20px;">
					<input type="reset" class="btn btn-primary" value="重置"
						style="margin: auto; width: 100%; height: 40px; padding: 10px;"></input>
				</div>
			</div>
		</form>
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
