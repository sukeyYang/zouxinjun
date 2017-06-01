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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>邮筒</title>
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
    <img src="<%=basePath%>/images/tabBar-mail2.png">
  </a>
  <a href="user" class="tabBar-user">
    <img src="<%=basePath%>/images/tabBar-me1.png">
  </a>
</div>

<div class="container" style="background: #F7F7F7;overflow: auto;">
  <div class="mainMessage">
    <!-- 主活动信息列表 -->
    <c:forEach var="item" items="${takeAwayLetterList}">
      <div class="aboutMessage">
          <%--对方号码item.uphone--%>
        <img src="${item.headimgurl}">
        <span>你的信件被 ${item.nickname} 领取<br/>
          对方号码：${item.uphone}
        </span>
        <span>${item.createtime}</span>
        <c:if test="${item.senderRead == 0}">
          <span class="prompt"></span>
        </c:if>
        <input type="hidden" name="title" value="${item.title}">
        <input type="hidden" name="content" value="${item.content}">
        <input type="hidden" name="phone" value="${item.phone}">
      </div>
    </c:forEach>

    <c:forEach var="item" items="${openLetterList}">
      <div class="aboutMessage">
          <%--<img src="images/head1.jpg">--%>
        <img src="${item.headimgurl}">
        <span>你领取了${item.nickname}的信件<br/>
           对方号码：${item.phone}
        </span>
        <span>${item.createtime}</span>
        <c:if test="${item.receiverRead == 0}">
          <span class="prompt sPrompt"></span>
        </c:if>
        <input type="hidden" name="title" value="${item.title}">
        <input type="hidden" name="content" value="${item.content}">
        <input type="hidden" name="phone" value="${item.phone}">
      </div>
    </c:forEach>

    <!-- 底部走心君文字 -->
    <img src="<%=basePath%>/images/zxj2.png" class="megZxj">
  </div>

  <div class="mailLayer">
    <div class="mailContent">
      <h2>标题</h2>
      <p class="textcontent">正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文</p>
      <p class="contactWay">
        联系手机<br/>
        <span>13627666698</span>
      </p>
      <button type="button" class="btn btn-pos">完成</button>
      <div class="bg84"></div>
    </div>
  </div>
</div>

<script
  src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
<script>
  $(function () {

    //点击信息列表，如果有小红点提示信息就隐藏小红点
    $(".aboutMessage").on("click", function () {
      var $mpr = $(this).find(".prompt");
      if ($mpr.is(":visible")) {
        $mpr.hide();
      }
      //填充对应的信件内容并显示信件弹层
      var title = $(this).find("input[name='title']").val();
      var content = $(this).find("input[name='content']").val();
      var phone = $(this).find("input[name='phone']").val();
      $(".mailContent h2").text(title);
      $(".textcontent").text(content);
      $(".contactWay span").text(phone);
      $(".mailLayer").show();
    });

    //点击确定关闭弹层
    $(".mailContent button").on("click", function () {
      $(".mailLayer").hide();
    });
  });
</script>
</body>
</html>
