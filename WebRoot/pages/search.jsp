<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 1. 兼容问题：在IE中运行最新的渲染模式 -->
<meta http-equiv="X-UA-Comatible" content="IE=edge">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="js/search.js"></script>
<link rel="stylesheet" type="text/css" href="css/search.css">
    <title>搜索框</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
   <div class="searchbox">
   	<ul class="border1">
		<li><a class="style1" onmouseover="this.style.cursor='pointer'">商品</a></li>
		<li><a onmouseover="this.style.cursor='pointer'">店铺</a></li>
	</ul>
	<div class="bodys">
		<form id="commonSearch" action="searchGoods.do" method="post">	
			<input type="hidden" name="searchFlag" value="0">
			<p><input type="text" id="keywords" class="keywords" name="keywords" placeholder="输入关键字" /><button  type="submit"  class="button1">搜索</button>
			<p><input type="text"  id="shopname" class="shopname" name="shopname" placeholder="输入店铺名" /><button  type="submit"  class="button2">搜索</button>
		</form>
	</div>
   </div> 

  </body>
  
</html>
