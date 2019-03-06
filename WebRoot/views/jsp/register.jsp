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
			<span style="font-size: 20px;">欢迎注册</span>

		</div>
		<div style="margin-left: 1100px">
			<a href="<%=request.getContextPath()%>/views/jsp/login.jsp">已有账号？请登录>></a>
		</div>
	</div>
	<div class="register">
		<form id="form1" role="form" action="register.do" method="post">
			<input id="shopperPhone" required type="text" class="form-control"
				name="shopperPhone"
				style="height: 50px; margin-top: 10px; width: 100%"
				placeholder="请输入手机号码" />
			<c:if test="${errorFlag==3}">
				<span style="color: red">用户名已存在！</span>
			</c:if>
			<input id="shopperEmail" required type="text" class="form-control"
				name="shopperEmail"
				style="height: 50px; margin-top: 30px; width: 100%"
				placeholder="请输入邮箱" />
			<c:if test="${errorFlag==4}">
				<span style="color: red">邮箱不合法！</span>
			</c:if>
			<input id="shopperPassword" type="password" required
				class="form-control" name="shopperPassword"
				style="height: 50px; margin-top: 30px;" placeholder="请输入密码" /> <input
				id="ConfirmPassword" type="password" required class="form-control"
				name="ConfirmPassword" style="height: 50px; margin-top: 30px;"
				placeholder="确认密码" />
			<c:if test="${errorFlag==5}">
				<span style="color: red">两次输入的密码不一致！</span>
			</c:if>
			<div style="height: 100px; width: 100%; margin-top: 10px;">
				<div style="float: left; width: 50%; padding: 20px;">
					<input type="submit" class="btn btn-primary"
						value="注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册"
						style="margin: auto; width: 275px; height: 50px; padding: 13px; font-size: 20">
					</input>
				</div>
				<div style="float: left; margin-left: -10px;width: 100%; margin-top: 30px;">
					<a href="<%=request.getContextPath()%>/views/jsp/seller_register.jsp">个体商户注册></a>
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
