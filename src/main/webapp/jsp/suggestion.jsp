<%--
  Created by IntelliJ IDEA.
  User: YHLS
  Date: 2017/4/11
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
    + request.getServerName() + ":" + request.getServerPort()
    + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>意见反馈</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width,user-scalable=0"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css">
</head>
<body>
	<!-- 底部菜单栏 -->
	<div class="tabBar">
		<a href="index" class="tabBar-home">
			<img src="<%=basePath%>/images/tabBar-home1.png">
		</a>
		<a href="message" class="tabBar-mail">
			<img src="<%=basePath%>/images/tabBar-mail1.png">
		</a>
		<a href="user" class="tabBar-user">
			<img src="<%=basePath%>/images/tabBar-me2.png">
		</a>
	</div>

	<!-- 意见反馈 -->
	<form class="suggestion">
		<textarea placeholder="写下你宝贵的建议"></textarea>
		<button type="submit">提交反馈</button>
	</form>

	<script src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
	<script>
		$(function(){
			document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
			$(window).resize(function() {
			document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
			});
		});
	</script>
</body>
</html>
