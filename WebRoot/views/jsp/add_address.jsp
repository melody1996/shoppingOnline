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
	href="<%=basePath%>css/register.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/register.js"></script>
</head>
<body style="background-color: #EEEEEE">
	<jsp:include page="/pages/header.jsp" />
	<div>
		<div style="margin-left: 150px;">
			<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 20px;">添加收货地址</span>

		</div>
		<div style="margin-left: 1100px">
			<a href="showAddress.do">返回>></a>
		</div>
	</div>
	<div class="register">
		<form id="form1" role="form" action="addAddress.do" method="post">
			<input id="consigneeName" required type="text" class="form-control"
				name="consigneeName"
				style="height: 50px; margin-top: 10px; width: 100%"
				placeholder="请输入收货人姓名" /> 
				<input id="consigneeAddress" required
				type="text" class="form-control" name="consigneeAddress"
				style="height: 50px; margin-top: 30px; width: 100%"
				placeholder="请输入收货地址" /> <input id="consigneePhone" type="text"
				required class="form-control" name="consigneePhone"
				style="height: 50px; margin-top: 30px;" placeholder="请输入手机号码" />
			<c:if test="${addressErrorFlag==1}">
				<span style="color: red">手机号码不合法！</span>
			</c:if>
			<input id="consigneePostalCode" type="text" required
				class="form-control" name="consigneePostalCode"
				style="height: 50px; margin-top: 30px;" placeholder="请输入邮政编码" />
			<c:if test="${addressErrorFlag==2}">
				<span style="color: red">邮政编码不合法！</span>
			</c:if>
			<div style="height: 100px; width: 100%; margin-top: 10px;">
				<div style="float: left; width: 50%; padding: 20px;">
					<input type="submit" class="btn btn-primary"
						value="添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加"
						style="margin: auto; width: 275px; height: 50px; padding: 13px; font-size: 20">
					</input>
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
