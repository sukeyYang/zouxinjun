<%--
  Created by IntelliJ IDEA.
  User: YHLS
  Date: 2017/5/17
  Time: 13:07
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>活动提醒</title>
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

<div class="sm-container">
  <div class="sactMessage">
    <!-- 次活动信息列表 -->
    <c:forEach var="item" items="${othersJoinList}">
      <div class="aboutMessage">
          <%--对方号码item.uphone--%>
        <img src="${item.headImage}">
        <span>你发起的活动 ${item.nickname} 报名参加<br/>
          对方号码：${item.phone}
        </span>
        <span class="s-time"><fmt:formatDate pattern="MM/dd"
                                             value="${item.createTime}"/></span>
        <input type="hidden" name="activityId" value="${item.activityId}">
        <input type="hidden" name="title" value="${item.title}">
        <input type="hidden" name="content" value="${item.content}">
        <input type="hidden" name="nickname" value="${item.nickname}">
        <input type="hidden" name="numOfPeople" value="${item.numOfPeople}">
        <input type="hidden" name="numOfCheck" value="${item.numOfCheck}">
        <input type="hidden" name="numOfComment" value="${item.numOfComment}">
        <input type="hidden" name="numOfLiked" value="${item.numOfLiked}">
      </div>
    </c:forEach>

    <c:forEach var="item" items="${joinList}">
      <div class="aboutMessage">
          <%--<img src="images/head1.jpg">--%>
        <img src="${item.headImage}">
        <span>你参加了${item.nickname}发起的活动<br/>
           对方号码：${item.phone}
        </span>
        <span class="s-time"><fmt:formatDate pattern="MM/dd"
                                             value="${item.createTime}"/></span>
        <input type="hidden" name="activityId" value="${item.activityId}">
        <input type="hidden" name="title" value="${item.title}">
        <input type="hidden" name="content" value="${item.content}">
        <input type="hidden" name="nickname" value="${item.nickname}">
        <input type="hidden" name="numOfPeople" value="${item.numOfPeople}">
        <input type="hidden" name="numOfCheck" value="${item.numOfCheck}">
        <input type="hidden" name="numOfComment" value="${item.numOfComment}">
        <input type="hidden" name="numOfLiked" value="${item.numOfLiked}">
      </div>
    </c:forEach>
  </div>

  <!-- 底部走心君文字 -->
  <img src="<%=basePath%>/images/zxj2.png" class="megZxj">

  <!-- 活动详情层（弹层222） -->
  <div class="actLayer">
    <h2>阿三大大</h2>
    <div class="originator">
      <img src="../images/head1.jpg" class="or-left">
      <div class="or-center">
        <span class="or-user">走心君</span>
        <span class="or-time">1/31</span>
      </div>
      <div class="or-right">
        <img src="../images/eye.png"><span>115</span>
      </div>
    </div>
    <p class="actContent">
      阿萨大斗法风格的观点和粉红粉红粉红阿萨大斗法风格的观点和粉红粉红粉红阿萨大斗法风格的观点和粉红粉红粉红阿萨大斗法风格的观点和粉红粉红粉红阿萨大斗法风格的观点和粉红粉红粉红阿萨大斗法风格的观点和粉红粉红粉红阿萨大斗法风格的观点和粉红粉红粉红</p>
    <p class="numOfPeople">人数：<span>3</span>人</p>
    <div class="state">
      <div class="evaluate">
        <img src="../images/heart.png" class="icon-heart">
        <span class="sact-liked">5</span>
        <img src="../images/momentComment.png" class="icon-comment">
        <span class="sact-comment">5</span>
      </div>
      <button type="button" class="btn-joinin" btn="1">参加</button>
    </div>

    <!--评论列表，详细数据通过js异步加载填充-->
    <ul class="aboutComment"></ul>

    <!--底部的点赞和评论按钮-->
    <div class="state-btn">
      <input type="hidden" name="activityId" value="">
      <span class="btn-praise">
            <img src="../images/heart.png">
        </span>
      <span class="btn-comment">
            <img src="../images/momentComment.png">
        </span>
    </div>
  </div>

  <!-- 确认是否参加活动(弹层255) -->
  <div class="confirmLayer" style="z-index: 255;">
    <div class="confirm">
      是否确认参加该活动
      <div class="noBtn">
        <img src="../images/noBtn.png">
      </div>
      <div class="okBtn">
        <img src="../images/okBtn.png">
      </div>
      <input type="hidden" name="activityId" value="">
    </div>
  </div>

  <!-- 评论层(弹层275) -->
  <div class="commentLayer">
    <form>
        <textarea name="comment" placeholder="评论内容"
                  class="comment-textarea"></textarea>
      <button type="button" class="btn btn-submit" id="comment-submit">提交
      </button>
      <button type="button" class="btn btn-leave">退出</button>
    </form>
  </div>
</div>

<script
  src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
<script src="../js/sactMessage.js"></script>
</body>
</html>
