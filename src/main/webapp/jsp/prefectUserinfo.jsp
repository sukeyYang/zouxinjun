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
	<div class="container" style="background: rgba(180, 180, 180, 0.5);overflow: hidden;">
		<!-- 完善信息 -->
		<div class="prefectUserinfo">
			<h2>请完善下列信息</h2>
			<form action="">
				<div class="input-item">
					学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：<input type="text" name="college">
				</div>
				<div class="input-item">
					手机号码：<input type="number" name="phonenumber">
				</div>
				<button type="submit">确定</button>
			</form>
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

			//提交表单并跳转页面
			var $pform = $(".prefectUserinfo form");
			$pform.find("button").on("click", function(){
				$.ajax({
					type: "post",
					url: "",
					datatype: "jason",
					data: {
						"college": $pform.find("input[name='college']").val(),
						"phonenumber": $pform.find("input[name='phonenumber']").val()
					},
					success: function(result){
						if(result) {
							window.location.href = "index";
						}
					}
				});
			});
		});
	</script>
</body>
</html>
