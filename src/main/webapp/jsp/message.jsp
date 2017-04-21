<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
  <title>邮筒</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
    <img src="<%=basePath%>/images/tabBar-mail2.png">
  </a>
  <a href="user" class="tabBar-user">
    <img src="<%=basePath%>/images/tabBar-me1.png">
  </a>
</div>

<div class="container" style="background: #F7F7F7;">
  <div class="message">
    <!-- 信息列表 -->
    <a href="" class="meg-list clearfix">
      <div class="head">
        <img src="<%=basePath%>/images/head1.jpg">
      </div>
      <div class=center-meg>
        <h3>走心君</h3>
        <p>本月活动通知</p>
      </div>
      <div class="secondary-meg">
        <p class="date">
          <%
            DateFormat sdf = new SimpleDateFormat("HH:mm");
            Date d = new Date();
            String s =sdf.format(d);
          %>
          <%= s %>
        </p>
      </div>
    </a>
    <a href="mainMessage" class="meg-list clearfix">
      <div class="head">
        <img src="<%=basePath%>/images/head1.jpg">
      </div>
      <div class=center-meg>
        <h3>主活动消息</h3>
        <p>您的信件被查看</p>
      </div>
      <div class="secondary-meg mainUnread">
        <p class="date"><%= s %></p>
      </div>
    </a>
    <a href="" class="meg-list clearfix">
      <div class="head">
        <img src="<%=basePath%>/images/head1.jpg">
      </div>
      <div class=center-meg>
        <h3>次活动消息</h3>
        <p>您的信件被查看</p>
      </div>
      <div class="secondary-meg">
        <p class="date"><%= s %>
        </p>
      </div>
    </a>
    <!-- 底部走心君文字 -->
    <img src="<%=basePath%>/images/zxj2.png" class="megZxj">
  </div>
</div>

<script
  src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
<script>
  $(function () {
    document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    $(window).resize(function () {
      document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    });

    var winHeight = window.innerHeight || document.body.clientHeight;
    $(".container").css("height", winHeight);

//    //点击底部菜单栏的信封按钮，如果有小红点提示信息就删除小红点
//    $(".tabBar-mail").on("click", function () {
//      var $tpr = $(this).find(".prompt");
//      if ($tpr) {
//        $tpr.remove();
//      }
//    });

    //点击信息列表，如果有小红点提示信息就删除小红点
    $(".meg-list").on("click", function () {
      var $mpr = $(this).find(".prompt");
      if ($mpr) {
        $mpr.remove();
      }
    });

    //如果未读信息不为0，则在相应位置插入小红点提示信息
    var countUnreadMessage = ${userRecord};
    console.log(countUnreadMessage);
    if(countUnreadMessage != 0){
      $(".mainUnread").append("<span class='prompt'>" + countUnreadMessage + "</span>");
    }

    // 禁止a标签跳转，测试删除小红点效果
//			$("a").on("click", function(){
//				return false;
//			});

    //tabBar-Mail图标小红点提示数为meg-list的总和
//    var sum = 0;
//    var $span = $(".meg-list span");
//    for (var i = 0; i < 3; i++) {
//      var num = $span[i].innerHTML;
//      sum += parseInt(num);
//    }
//    $(".tabBar-mail span").text(sum);
  });
</script>
</body>
</html>
