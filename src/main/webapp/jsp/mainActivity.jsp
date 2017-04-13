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
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width,user-scalable=0"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css">
</head>
<body>
	<!-- 底部菜单栏 -->
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

	<!-- 加号按钮 -->
	<div class="addBtn">
		<span></span>
		<span></span>
	</div>

	<div class="container">
		<!-- 信件浏览页面(底层111) -->
		<div class="mailBox">
			<!-- 拆信机会为0提示页面 -->
			<div class="chance0">您的拆信机会为0<br>请先写信</div>
			<ul>
				<li>
					<h2>阿斯蒂芬</h2>
					<p>哪里哪里</p>
				</li>
				<li>
					<h2>阿斯蒂芬</h2>
					<p>哪里哪里</p>
				</li>
				<li>
					<h2>阿斯蒂芬</h2>
					<p>哪里哪里</p>
				</li>
				<li>
					<h2>阿斯蒂芬</h2>
					<p>哪里哪里</p>
				</li>
				<li>
					<h2>阿斯蒂芬</h2>
					<p>哪里哪里</p>
				</li>
				<li>
					<h2>阿斯蒂芬</h2>
					<p>哪里哪里</p>
				</li>
			</ul>
		</div>

		<!-- 确认是否领取信件(弹层222) -->
		<div class="confirmLayer">
			<div class="confirm">
				是否确认领取Ta的心愿
				<div class="noBtn">
					<span></span>
					<span></span>
				</div>
				<div class="yesBtn">
					<span></span>
					<span></span>
				</div>
			</div>
		</div>

		<!-- 信件内容(弹层333) -->
		<div class="mailLayer">
			<div class="mailContent">
				<h2>标题</h2>
				<p>正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文</p>
				<p class="contactWay">
					联系手机<br />
					13627666698
				</p>
				<button>完成</button>
				<div class="chance">拆信机会-1</div>
			</div>
		</div>

		<!-- 发布信息并提示关注层(弹层444) -->
		<div class="postLayer">
			<div class="postMessage">
				<!-- 发布信息 -->
				<form method="post" action="">
					<!-- 关闭按钮 -->
					<div class="endBtn">
						<span></span>
						<span></span>
					</div>
					<input type="text" name="title" placeholder="标题">
					<textarea placeholder="详情内容"></textarea>
					<%--<input type="number" name="phonenumber" placeholder="联系手机">--%>
					<%--<input type="text" name="address" placeholder="寄信地址">--%>
					<p class="tip"></p>
					<button type="button">发布</button>
				</form>
				<!-- 提示关注 -->
				<div class="payAttention">
					<h2>发布成功<br />拆信机会+1</h2>
					<p>关注<br />走心君服务号<br />第一时间收到匹配通知</p>
					<img src="<%=basePath%>/images/ewm.png">
					<button>确定</button>
				</div>
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

			// 点击信件，确认层弹出
			$(".mailBox li").on("click", function(){
				$(".confirmLayer").show();
				// $(".addBtn").hide();
			});

			// 点击X按钮关闭确认层
			$(".noBtn").on("click", function(){
				$(".confirmLayer").hide();
			});

			// 点击勾按钮关闭确认层，打开信件内容层
			$(".yesBtn").on("click", function(){
				$(".confirmLayer").hide();
				$(".mailLayer").show();
				$(".mailBox").addClass("blur");
				// $(".addBtn").hide();
			});

			// 第一次点击勾按钮，拆信机会-1提示层淡出
			$(".yesBtn").one("click", function(){
				$(".chance").fadeOut(2000);
			});

			// 点击信件内容层的完成按钮关闭弹层
			$(".mailLayer button").on("click", function(){
				$(".mailLayer").hide();
				$(".mailBox").removeClass("blur");
				// $(".addBtn").show();
			});

			// 点击+号按钮打开发布信息及提示关注层
			$(".addBtn").on("click", function(){
				$(".postLayer").show();
				$(".mailBox").addClass("blur");
			});

			// 点击X号按钮关闭发布信息及提示关注层,清空表单数据
			$(".postLayer .endBtn").on("click", function(){
				$(".postLayer").hide();
				$(".mailBox").removeClass("blur");
				$(this).parent().get(0).reset();
			});

			// 点击表单的发布按钮异步提交数据并执行回调函数
			$(".postLayer form button").on("click", function(){
				var $title = $(".postLayer form input[name='title']").val(),
					$content = $(".postLayer form textarea").val();
//					$phonenumber = $(".postLayer form input[name='phonenumber']").val(),
//					$address = $(".postLayer form input[name='address']").val();
				if($title == "" || $title == null || $content == "" || $content == null) {
					$(".tip").text("输入内容不能为空");
					return false;
				}
//				else if($phonenumber.length != 11) {
//					$(".tip").text("提示：请输入正确的手机号码");
//					return false;
//				}

				/*$.ajax({
					type: "post",
					url: "",
					datatype: "jason",
					data: {
						"title": $(".postLayer form input[name='title']").val(),
						"content": $(".postLayer form textarea").val(),
						"phonenumber": $(".postLayer form input[name='phonenumber']").val(),
						"address": $(".postLayer form input[name='address']").val()
					},
					success: function(result){
						if(result) {
							$(".postLayer form ").hide();
						}
					}
				});*/
				$(".postLayer form").hide();
			});

			// 点击提示关注页的确定按钮关闭该层
			$(".payAttention button").on("click", function(){
				$(".postLayer form").show();
				$(".postLayer").hide();
				$(".mailBox").removeClass("blur");
			});
		});
	</script>
</body>
</html>
