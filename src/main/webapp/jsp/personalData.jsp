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
	<title>个人资料</title>
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

	<!-- 个人资料 -->
	<div class="container" style="background: #F7F7F7;">
		<div class="personalData">
			<div class="headPortrait clearfix">
				<span>头像</span>
				<img src="<%=basePath%>/images/head1.jpg">
			</div>
			<div class="dataDetial nickname clearfix">
				<span>昵称</span>
				<span>走心君</span>
			</div>
			<div class="dataDetial clearfix">
				<span>学校</span>
				<span>华东师范大学</span>
			</div>
			<div class="dataDetial clearfix">
				<span>手机号</span>
				<span>13621766694</span>
			</div>
		</div>
		<!-- 修改信息弹层 -->
		<div class="changeInfo">
			<form action="">
				<div class="changeCollege">
					修改学校：<input type="text">
				</div>
				<div class="changeNumber">
					修改号码：<input type="text">
				</div>
				<button type="button">确定</button>
			</form>
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
