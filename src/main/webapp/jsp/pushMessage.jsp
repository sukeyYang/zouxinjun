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
  <title>推送设置</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width,user-scalable=0"/>
  <script type="text/javascript">
    document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    window.onresize = function () {
      document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    };
  </script>
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

<!-- 推送设置 -->
<div class="pushMessage">
  <h2>关注<br><img src="<%=basePath%>/images/zxj3.png"><br>第一时间收到匹配通知</h2>
  <img src="<%=basePath%>/images/ewm.png">
</div>

</body>
</html>
