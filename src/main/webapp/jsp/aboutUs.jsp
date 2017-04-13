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
	<title>关于我们</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width,user-scalable=0"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css">
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

	<!-- 关于我们 -->
	<div class="container">
		<div class="aboutUs">
			<img src="<%=basePath%>/images/logo.png">
			<h1>版本：0.1.0<br>上海楷赢网络科技有限公司</h1>
		</div>
		<!-- 底部走心君文字 -->
		<img src="<%=basePath%>/images/zxj2.png" class="megZxj">
	</div>

	<script src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
	<script>
		$(function(){
			document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
			$(window).resize(function() {
			document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
			});

			var winHeight = window.innerHeight || document.body.clientHeight;
			$(".container").css("height", winHeight);
		});
	</script>
</body>
</html>
