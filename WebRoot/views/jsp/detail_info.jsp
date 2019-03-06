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
<script>
	function judge(){		
		var shopper="<%=session.getAttribute("shopper")%>";
		if (shopper == "null" || shopper == "") {
			alert("您还未登录");
			document.location.href = "views/jsp/login.jsp";
		}
	}
</script>
</head>
<body onload="judge()" style="background-color: #EEEEEE">
	<jsp:include page="/pages/header.jsp" />
		<div>
			<div style="margin-left: 150px;">
				<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="font-size: 20px;">个人信息</span>
			</div>
			<div style="margin-left: 1100px">
				<a href="<%=request.getContextPath()%>/views/jsp/index.jsp">返回首页>></a>
			</div>
		</div>
		<div class="modify" style="margin-top: 40px">
			<form role="form" action="modifyInfo.do" method="post">
			<c:set var="shopper"  value="${sessionScope.shopper}"/>
				<input id="shopperName" required type="text" class="form-control"
					name="shopperName" style="height: 55px; margin-top: 10px;"
					value=${shopper.shopperName }>
									<c:if test="${errorFlag==1}">
						<span style="color: red">该用户名已存在，换一个吧！</span>
					</c:if>
				<input id="shopperPhone" required type="text"
					class="form-control" name="shopperPhone"
					style="height: 55px; margin-top: 30px;" value=${shopper.shopperPhone }>
				<c:if test="${errorFlag==2}">
						<span style="color: red">该手机号已绑定用户，请直接登录</span>
					</c:if>
					<c:if test="${errorFlag==3}">
						<span style="color: red">手机号码不合法</span>
					</c:if>
				<input id="shopperEmail" required type="text"
					class="form-control" name="shopperEmail"
					style="height: 55px; margin-top: 30px;" value=${shopper.shopperEmail }>
					<c:if test="${errorFlag==4}">
						<span style="color: red">邮箱不合法</span>
					</c:if>
				<div style="height: 100px; width: 100%; margin-top: 30px;">
					<div style="float: left; width: 50%; padding: 20px;">
						<input type="submit" class="btn btn-primary" value="修改"
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
