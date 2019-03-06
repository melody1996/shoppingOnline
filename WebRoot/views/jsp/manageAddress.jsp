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
	href="<%=basePath%>js/kkpager/jpager.css"></link>
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/main.min.css">
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/listPage.js"></script>
<script>
	function judge(){		
		var shopper="<%=session.getAttribute("shopper")%>";
		if (shopper == "null" || shopper == "") {
			alert("您还未登录");
			document.location.href = "views/jsp/login.jsp";
		}else{
			addressPage(${pageResult.pages},${pageResult.total});
		}
	}
</script>
</head>
<body onload="judge()" style="background-color: #EEEEEE">
	<jsp:include page="/pages/header.jsp" />
	<div>
		<div style="margin-left: 150px;">
			<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 20px;">收货地址</span>
		</div>
		<div style="margin-left: 1100px">
			<a href="<%=request.getContextPath()%>/views/jsp/index.jsp">返回首页>></a>
		</div>
	</div>
	<div class="container" style="margin-top: 10px; margin-left: 330px;">
		<div class="col-md-9">
			<div class="list-group-item active">
				我的收货地址<a
					href="<%=request.getContextPath()%>/views/jsp/add_address.jsp"
					style="float: right; color: white">添加新地址</a>
			</div>
			<div class="tab-pane active" id="home">
				<section class="widget bg-white post-comments"
					style="border-style:solid; border-width:2px; border-color:blue">
				<c:forEach items="${pageResult.dataList}" var="s">
					<div class="media">
						<a style="font-size: 24px;" class="pull-left">
							${s.consigneeName} </a>
						<div class="comment">
							<div class="comment-author h6 no-margin">
								<div class="comment-meta small">
									<a href="findAddressById.do?addressId=${s.addressId}"
										class="badge-comment">编辑</a> <a
										href="deleteAddressById.do?addressId=${s.addressId}"
										onclick="return confirm('是否删除该地址？')" class="badge-comment">删除</a>
								</div>
								<span style="font-size: 18px; color: black;">${s.consigneeName}</span>
								<a>${s.consigneePhone}</a>
							</div>
							<div class="comment-bt">
								<span style="font-size: 16px; color: black;">${s.consigneeAddress}</span>
								&nbsp;•&nbsp; <span style="font-size: 18px; color: black;">${s.consigneePostalCode}</span>
							</div>
						</div>
					</div>
					<div class="media" style="height: 10px;"></div>
				</c:forEach> </section>
			</div>
		</div>
	</div>
	<div id="jpager" style="margin-right: 400px; margin-left: 550px;"></div>
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
