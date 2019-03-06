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
	function load(){		
		searchGoodsPage(${pageResult.pages},${pageResult.total});
	}
</script>
</head>
<body onload="load()" style="background-color: #EEEEEE">
	<jsp:include page="/pages/header.jsp" />
	<div class="container" style="margin-top: 20px; margin-left: 170px; width: 1515px">
			<div class="col-md-9">	
				<div class="list-group-item active">
						搜索结果<a href="" style="float: right; color: white"></a>
					</div>
					<div class="tab-pane active" id="home">
						<section class="widget bg-white post-comments"
							style="border-style:solid; border-width:2px; border-color:blue;width:1000px">
						<c:forEach items="${pageResult.dataList}" var="s">
							<div class="media">
								<a class="pull-left"> <img width="100px" height="100px"
									src="${s.goodsImageUrl}" alt="sjswc">
								</a>
								<div class="comment">
									<div class="comment-author h6 no-margin">
										<div class="comment-meta small">
											<a href="findAddressById.do?addressId=${s.goodsName}"
												class="badge-comment">查看详情</a>
										</div>
										<span style="font-size: 18px; color: black;">${s.goodsName}</span>&nbsp;&nbsp;&nbsp;&nbsp;
										<a style="color: red">￥&nbsp;&nbsp;${s.goodsPrice}</a>
									</div>
									<div class="comment-bt">
										<span style="font-size: 16px; color: black;">${s.goodsDescription}</span>
										</p>
										<a>${s.goodsStock}条评论</a>
										</p>
										<a style="font-size: 14px; color: black;">${s.shopName}</a>
									</div>
								</div>
							</div>
						</c:forEach> </section>
					</div>
			</div>
		</div>
	<div id="jpager" style="margin-right: 400px; margin-left: 550px;"></div>

</body>
</html>
