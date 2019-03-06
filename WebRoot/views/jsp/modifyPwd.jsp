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
<body onload="judge()" style="background-color: #EEEEEE"> 
	<jsp:include page="/pages/header.jsp" />
<c:if test="${sessionScope.shopper!=null}">
	<div>
		<div style="margin-left: 150px;">
			<span style="font-size: 30px;">网上购物系统</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 20px;">修改密码</span>
		</div>
		<div style="margin-left: 1100px">
			<a href="<%=request.getContextPath()%>/views/jsp/index.jsp">返回首页>></a>
		</div>
	</div>
  <div class="modify">
    <form  role="form" action="modifyPwd.do" method="post">
         <input id="password" required type="password" class="form-control" name="password" style="height: 55px; margin-top: 10px;"
                   placeholder="请输入原始密码">
         <c:if test="${errorFlag==1}">
						<span style="color: red">原密码不正确</span>
					</c:if>
        <input id="shopperNewPassword" required type="password" class="form-control" name="shopperNewPassword" style="height: 55px; margin-top: 30px;"
                   placeholder="请输入新的密码">
          <input id="shopperConfirmPassword" required type="password" class="form-control" name="shopperConfirmPassword" style="height: 55px; margin-top: 30px;"
                  placeholder="确认密码">  
                  <c:if test="${errorFlag==2}">
						<span style="color: red">两次密码不一致</span>
					</c:if>     
        <div style="height: 100px;width: 100%;margin-top: 30px;">
				<div style="float:left;width: 50%;padding: 20px;">
					<input type="submit" class="btn btn-primary" value="确认"
						style="margin:auto;width: 100%;height: 50px;padding: 13px;"></input>
				</div>
				<div style="float:right;width: 50%;padding: 20px;">
					<input type="reset" class="btn btn-primary" value="重置"
						style="margin:auto;width: 100%;height: 50px;padding: 13px;"></input>
				</div>
		</div>
    </form>
</div>
</c:if>
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
	function judge(){		
		var shopper="<%=session.getAttribute("shopper")%>"; 
		if(shopper=="null"||shopper==""){
			alert("您还未登录");
			document.location.href="views/jsp/login.jsp";
		}	
	}
	</script>
</html>
