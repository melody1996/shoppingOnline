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
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css">
</head>
<body onload="judge()" style="background-color: #EEEEEE">
	<jsp:include page="/pages/seller_header.jsp" />
	<div class="loginContain">
		<div class="image">
			<img src="image/login.jpg">
		</div>
		<div class="login">
			<form id="form1" role="form" action="seller_login.do" method="post">
				<input id="sellerPhone" required type="text" class="form-control"
					name="sellerPhone"
					style="height: 50px; margin-top: 30px; width: 100%"
					placeholder="请输入手机号码">
				<div id="alert1">
					<c:if test="${errorFlag==1}">
						<span style="color: red">用户名不存在！</span>
					</c:if>
				</div>
				<input type="password" required class="form-control"
					name="sellerPassword" style="height: 50px; margin-top: 30px;"
					placeholder="请输入密码">
				<c:if test="${errorFlag==2}">
					<span style="color: red">密码错误</span>
				</c:if>
				<div style="height: 100px; width: 100%; margin-top: 20px;">
					<div style="float: right;">
						<a href="forgetPass.jsp">忘记密码？</a>
					</div>
					<div
						style="float: left; width: 50%; padding: 20px; margin-top: 10px">
						<input type="submit" class="btn btn-primary"
							value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录"
							style="margin: auto; width: 275px; height: 50px; padding: 13px; font-size: 20">
						</input>
					</div>
				</div>
				<div style="float: right">
					<a href="<%=request.getContextPath()%>/views/jsp/login.jsp">买家登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a
						href="<%=request.getContextPath()%>/views/jsp/seller_register.jsp">立即注册</a>
				</div>
			</form>
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
<script>
	function judge(){
		var errorFlag="${errorFlag}"; 
			if(errorFlag==3){
				alert("修改成功，请重新登录");
		}
		
	}
</script>
</html>
