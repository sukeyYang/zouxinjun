<%--
  Created by IntelliJ IDEA.
  User: YHLS
  Date: 2017/4/12
  Time: 19:33
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
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width,user-scalable=0"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css">
</head>
<body>
	<!-- tabBar -->
	<div class="tabBar">
		<a href="index" class="tabBar-home">
			<img src="<%=basePath%>/images/tabBar-home2.png">
		</a>
		<a href="message" class="tabBar-mail">
			<img src="<%=basePath%>/images/tabBar-mail1.png">
		</a>
		<a href="user" class="tabBar-user">
			<img src="<%=basePath%>/images/tabBar-me1.png">
		</a>
	</div>

	<!-- content -->
	<div class="container">
		<!-- 首页 -->
		<div class="index">
			<div href="" class="indexEntry1">
				<p class="activityTitle">查令十字街84号</p>
				<p class="activityDesc">流至此的信里，是否有着一个有趣的灵魂。</p>
			</div>
			<div href="" class="indexEntry2">
				<p class="activityTitle">青春就是要搞事</p>
				<p class="activityDesc">青春君们，睡什么，起来搞事？</p>
			</div>
			<img src="<%=basePath%>/images/zxj2.png" class="indexZxj">
		</div>

		<!-- 活动详情层 -->
		<div class="indexLayer">
			<div class="activity1">
				<h2>活动详情</h2>
				<div class="endBtn">
					<span></span>
					<span></span>
				</div>
				<img src="<%=basePath%>/images/index-img1.jpg" align="center">
				<p class="activityDetail">千万千万群无群无群无群无多撒奥奥奥奥奥奥多千万千万群无群无群无群无多撒奥奥奥奥奥奥多</p>
				<p>活动规则：<span>ASD</span></p>
				<p>活动时间：<span>2017/4/1</span></p>
				<a href="mainActivity">立即参加</a>
			</div>
			<div class="activity2" style="display:none">
				<h2>活动详情</h2>
				<div class="endBtn">
					<span></span>
					<span></span>
				</div>
				<img src="<%=basePath%>/images/index-img2.jpg">
				<p class="activityDetail">千万千万群无群无群无群无多撒奥奥奥奥奥奥多千万千万群无群无群无群无多撒奥奥奥奥奥奥多</p>
				<p>活动规则：<span>ASD</span></p>
				<p>活动时间：<span>2017/4/1</span></p>
				<a>暂未开放</a>
			</div>
		</div>
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

			// 点击页面上的图片入口，分别显示活动详情层
			$(".indexEntry1").on("click", function(){
				$(".indexLayer").show();
				$(".activity1").show();
				$(".activity2").hide();
				$(".index").addClass("blur");
			});

			$(".indexEntry2").on("click", function(){
				$(".indexLayer").show();
				$(".activity2").show();
				$(".activity1").hide();
				$(".index").addClass("blur");
			});

			//点击X按钮关闭活动详情层
			$(".indexLayer .endBtn").on("click", function(){
				$(".indexLayer").hide();
				$(".index").removeClass("blur");
			});
		});
	</script>
</body>
</html>
