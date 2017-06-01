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
  <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width,user-scalable=0"/>
  <script type="text/javascript">
    document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    window.onresize = function () {
      document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    };
  </script>
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/school.css">
</head>
<body>
<!-- 底部菜单栏 -->
<div class="tabBar">
  <a href="index" class="tabBar-home">
    <img src="<%=basePath%>/images/tabBar-home2.png">
  </a>
  <a href="javascript:void(0);" class="tabBar-mail">
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
    <ul class="letterList">
      <c:forEach var="item" items="${letterList}">
        <li takeaway="0" class="oneLetter">
          <h2>${item.title}</h2>
          <p>${item.school}</p>
          <input type="hidden" name="content" value="${item.content}">
          <input type="hidden" name="phonenumber" value="${item.phone}">
          <input type="hidden" name="sender" value="${item.openid}">
          <input type="hidden" name="senderName" value="${item.nickname}">
          <input type="hidden" name="letterId" value="${item.id}">
          <div class="bg-mail1"></div>
          <div class="bg-mail2"></div>
        </li>
      </c:forEach>
    </ul>
  </div>

  <!-- 确认是否领取信件(弹层222) -->
  <div class="confirmLayer">
    <div class="confirm">
      是否确认拆开Ta的信件
      <div class="noBtn">
        <img src="<%=basePath%>/images/noBtn.png">
      </div>
      <div class="okBtn">
        <img src="<%=basePath%>/images/okBtn.png">
      </div>
    </div>
  </div>

  <!-- 信件内容(弹层333) -->
  <div class="mailLayer">
    <div class="mailContent">
      <h2>标题</h2>
      <p class="textcontent">正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文</p>
      <p class="contactWay">
        联系手机<br/>
        <span>13627666698</span>
      </p>
      <input type="hidden" name="sender" value="">
      <input type="hidden" name="senderName" value="">
      <input type="hidden" name="letterId" value="">
      <button type="button" class="btn btn-pos">完成</button>
      <div class="chance">拆信机会-1</div>
      <div class="bg84"></div>
    </div>
  </div>

  <!-- 发布信息并提示关注层(弹层444) -->
  <div class="postLayer">
    <div class="postMessage">
      <!-- 发布信息 -->
      <form>
        <!-- 关闭按钮 -->
        <div class="closeBtn cbPos">
          <span class="cSpan rz45"></span>
          <span class="cSpan rz-45"></span>
        </div>
        <input type="text" name="title" placeholder="标题" class="writeTitle">
        <textarea name="content" placeholder="详情内容"
                  class="writeLetter"></textarea>
        <p class="tip"></p>
        <button type="button" class="btn bPos">发布</button>
      </form>
      <!-- 提示关注 -->
      <div class="payAttention">
        <h2>发布成功<br/>拆信机会+1</h2>
        <p>关注<br/>走心君服务号<br/>第一时间收到匹配通知</p>
        <img src="<%=basePath%>/images/ewm.png">
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
      <div id="choose-box-wrapper">
        <div id="choose-box">
          <div id="choose-box-title">
            <span>选择学校</span>
          </div>
          <div id="choose-a-province" style="font-size: 0;">
          </div>
          <div id="choose-a-school">
          </div>
          <div id="choose-box-bottom" style="font-size: 9pt;">
            <input type="botton" onclick="hide()" value="关闭"/>
          </div>
        </div>
      </div>
    </div>
  </c:if>
</div>

<script
  src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
<script>
    var userRecord = ${userRecord};
    var flag = ${flag}; //拆信机会
</script>
<script src="../js/mact.js"></script>
<script src="../js/school.js"></script>
<script src="../js/school2.js"></script>
</body>
</html>
