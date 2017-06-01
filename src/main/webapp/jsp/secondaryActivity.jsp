<%--
  Created by IntelliJ IDEA.
  User: YHLS
  Date: 2017/5/5
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--添加该标签才能使用jsp表达式--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width,user-scalable=0"/>
  <script type="text/javascript">
    document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    window.onresize = function () {
      document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    };
  </script>
  <link rel="stylesheet" type="text/css" href="../css/public.css">
  <link rel="stylesheet" type="text/css" href="../css/school.css">
</head>
<body>
<!-- 底部菜单栏 -->
<div class="tabBar">
  <a href="index" class="tabBar-home">
    <img src="../images/tabBar-home2.png">
  </a>
  <a href="message" class="tabBar-mail">
    <img src="../images/tabBar-mail1.png">
  </a>
  <a href="user" class="tabBar-user">
    <img src="../images/tabBar-me1.png">
  </a>
</div>

<!-- 加号按钮 -->
<div class="addBtn">
  <span></span>
  <span></span>
</div>

<div class="sa-container">
  <!-- 活动列表页面(底层111) -->
  <div class="actBox">
    <ul class="sactList">
      <c:forEach var="item" items="${sactList}">
        <li class="oneSact">
          <h2 class="actTitle">${item.title}</h2>
          <p class="aboutAct">${item.content}</p>
          <div class="evaluate">
            <img src="../images/heart.png" class="icon-heart">
            <span class="list-liked">${item.numOfLiked}</span>
            <img src="../images/momentComment.png" class="icon-comment">
            <span class="list-comment">${item.numOfComment}</span>
          </div>
          <input type="hidden" name="activityId" value="${item.id}">
          <input type="hidden" name="nickname" value="${item.nickname }">
          <input type="hidden" name="headImage" value="${item.headImage}">
          <input type="hidden" name="numOfPeople" value="${item.numOfPeople}">
          <input type="hidden" name="numOfCheck" value="${item.numOfCheck}">
          <input type="hidden" name="createTime" value='<fmt:formatDate pattern="MM/dd"
                      value="${item.createTime}" />'>
        </li>
      </c:forEach>
    </ul>
  </div>

  <!-- 活动详情层（弹层222） -->
  <div class="actLayer" a="0">
    <h2>阿三大大</h2>
    <div class="originator">
      <img src="../images/head1.jpg" class="or-left">
      <div class="or-center">
        <span class="or-user">走心君</span>
        <span class="or-time">1/31</span>
      </div>
      <div class="or-right">
        <img src="../images/eye.png"><span>1</span>
      </div>
    </div>
    <p class="actContent"></p>
    <p class="numOfPeople">人数：<span>1</span>人</p>
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

  <!-- 发布信息并提示关注层（弹层333） -->
  <div class="postLayer">
    <div class="postMessage">
      <!-- 发布信息 -->
      <form>
        <!-- 关闭按钮 -->
        <div class="closeBtn cbPos">
          <span class="cSpan rz45"></span>
          <span class="cSpan rz-45"></span>
        </div>
        <input type="text" name="title" placeholder="标题" class="sactTitle">
        <textarea name="content" placeholder="详情内容"
                  class="sactContent"></textarea>
        <div class="people">
          <input type="text" placeholder="1"><span>人</span>
        </div>
        <p class="tip"></p>
        <button type="button" class="btn bPos">发布</button>
      </form>
      <!-- 提示关注 -->
      <div class="payAttention">
        <h2>发布成功<br/>拆信机会+1</h2>
        <p>关注<br/>走心君服务号<br/>第一时间收到匹配通知</p>
        <img src="../images/ewm.png">
        <button type="button" class="btn">确定</button>
      </div>
    </div>
  </div>

  <c:if test="${isNew == 1}">
    <!-- 用户验证 -->
    <div class="prefectLayer">
      <!-- 完善信息 -->
      <div class="prefectUserinfo">
        <h2>请完善下列信息</h2>
        <form>
          <div class="input-item">
            学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：
            <input type="text" name="college" placeholder="--请选择--" readonly
                   id="school-name" onclick="pop()">
          </div>
          <div class="input-item">
            手机号码：<input type="number" name="phonenumber">
          </div>
            <%--<div class="input-item">--%>
            <%--微&nbsp;&nbsp;信&nbsp;&nbsp;号：<input type="text" name="wechatuser">--%>
            <%--</div>--%>
          <p class="tip"></p>
          <button type="button" class="btn" style="margin-top: 0.1rem;">确定
          </button>
        </form>
      </div>

      <!-- 选择学校插件-->
      <div id="choose-box-wrapper" style="z-index: 777;">
        <div id="choose-box">
          <div id="choose-box-title">
            <span>选择学校</span>
          </div>
          <div id="choose-a-province" style="font-size: 0;">
          </div>
          <div id="choose-a-school">
          </div>
          <div id="choose-box-bottom" style="font-size: 9pt;">
            <input type="button" onclick="hide()" value="关闭"/>
          </div>
        </div>
      </div>
    </div>
  </c:if>

</div>

<script src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
<script src="../js/sact.js"></script>
<script src="../js/school.js"></script>
<script src="../js/school2.js"></script>
</body>
</html>
