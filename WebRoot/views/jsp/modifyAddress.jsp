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
</head>

<body onload="show()" style="background-color: #EEEEEE">
	<jsp:include page="/pages/header.jsp" />
	<div>
		<div style="margin-left: 150px;">
			<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 20px;">编辑收货地址</span>
		</div>
		<div style="margin-left: 1100px">
			<a href="showAddress.do">返回>></a>
		</div>
	</div>
 		<div class="modifyAddress">
			<form role="form" action="modifyAddress.do" method="post">
			<c:set var="address"  value="${address}"/>
			<input type="hidden" name="addressId" value=${address.addressId} />
				<input id="consigneeName" required type="text" class="form-control"
					name="consigneeName" style="height: 55px; margin-top: 10px;"
					value=${address.consigneeName}>
				<input id="consigneeAddress" required type="text"
					class="form-control" name="consigneeAddress"
					style="height: 55px; margin-top: 30px;" value=${address.consigneeAddress}>
				<input id="consigneePhone" required type="text"
					class="form-control" name="consigneePhone"
					style="height: 55px; margin-top: 30px;" value=${address.consigneePhone}>
				<c:if test="${addressErrorFlag==1}">
						<span style="color: red">手机号不合法！</span>
					</c:if>
				<input id="consigneePostalCode" required type="text"
					class="form-control" name="consigneePostalCode"
					style="height: 55px; margin-top: 30px;" value=${address.consigneePostalCode}>
							<c:if test="${addressErrorFlag==2}">
						<span style="color: red">邮编不合法！</span>
					</c:if>
				<div style="height: 100px; width: 100%; margin-top: 30px;">
					<div style="float: left; width: 50%; padding: 20px;">
						<input type="submit" class="btn btn-success infos" value="确认"
							style="margin: auto; width: 100%; height: 50px; padding: 13px;"></input>
					</div>
					<div style="float: right; width: 50%; padding: 20px;">
						<input type="reset" class="btn btn-primary" value="重置"
							style="margin: auto; width: 100%; height: 50px; padding: 13px;"></input>
					</div>
				</div>
			</form>
		</div>
		<div style="position: absolute; bottom: 0; margin-top: 20px; width: 100%; background-color: rgba(0, 0, 0, 0.8); height: 60px; color: darkgray">
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
	function show(){	
		var addressErrorFlag=${addressErrorFlag};
		if(addressErrorFlag==3){
			alert("修改成功");
		}
	}
</script>
</html>
