<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 1. 兼容问题：在IE中运行最新的渲染模式 -->
<meta http-equiv="X-UA-Comatible" content="IE=edge">
<!-- 3. 导入相关的js文件 -->
<link rel="stylesheet" href="spinner/jquery.spinner.css" />
<script type="text/javascript" src="http://libs.useso.com/js/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="spinner/jquery.spinner.js"></script>
<style type="text/css">
.demo{width:560px; margin:20px auto 0 auto; }
.demo h4{padding:10px 2px; font-size:14px; font-weight:bold}
.demo p{line-height:32px}
@media screen and (max-width: 360px) {.demo {width:340px}}
</style>
<title>注册页面</title>
</head>
<body>
<div id="header">
   <div id="logo"><h1><a href="http://www.helloweba.com" title="返回helloweba首页">helloweba</a></h1></div>
</div>

<div id="main">
   <h2 class="top_title"><a href="http://www.helloweba.com/view-blog-282.html">jQuery数字加减插件</a></h2>
   <div class="demo">
		<h4>示例1：左右加减。</h4>
		<p>最小0，默认1，每次加减1</p>
       <input type="text" id="spinner"/> 
   </div>
  
  <br/>
</div>
<script type="text/javascript">
$("#spinner").spinner({
    max:10,
    min:0,
    step:2
}); 
</script>

<div id="footer">
    <p>Powered by helloweba.com  允许转载、修改和使用本站的DEMO，但请注明出处：<a href="http://www.helloweba.com">www.helloweba.com</a></p>
</div>
</body>
</html>