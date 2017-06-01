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
    <div class="indexEntry1">
      <p class="activityTitle">查令十字街84号</p>
      <p class="activityDesc">流至此的信里，是否有着一个有趣的灵魂。</p>
    </div>
    <div class="indexEntry2">
      <p class="activityTitle">青春就是要搞事</p>
      <p class="activityDesc">青春君们，睡什么，起来搞事？</p>
    </div>
    <img src="<%=basePath%>/images/zxj2.png" class="indexZxj">
  </div>

  <!-- 活动详情层111 -->
  <div class="indexLayer">
    <div class="activity1">
      <h2>活动详情</h2>
      <div class="closeBtn cbPos">
        <span class="cSpan rz45"></span>
        <span class="cSpan rz-45"></span>
      </div>
      <img src="<%=basePath%>/images/index-img3.jpg" align="center">
      <p class="activityDetail">写一封寄宿心情与愿望的信件，漂流至世界某个角落的另一个有趣灵魂，从未相见，却见字如面。</p>
      <p>活动规则：<span>每写一封信，就拥有拆开一封信件的机会，拆开信件之后可以获得彼此的联系方式哦 </span></p>
      <p>活动时间：<span>2017年5月起</span></p>
      <a href="mainActivity" class="btn"
         style="font-weight: bold;vertical-align: text-top;margin-top: 0.25rem;">立即参加</a>
    </div>
    <div class="activity2" style="display:none">
      <h2>活动详情</h2>
      <div class="closeBtn cbPos">
        <span class="cSpan rz45"></span>
        <span class="cSpan rz-45"></span>
      </div>
      <img src="<%=basePath%>/images/index-img4.jpg">
      <p class="activityDetail">
        同校同城的小伙伴可以发起自己的走心活动，其他小伙伴可以报名参与，线下互动，可以是周末约郊游，晚上约跑步，期末约自习等等，不限创意哦。</p>
      <p>活动规则：<span>发布者活动的走心君宝宝要填写好联系方式，通过审核之后，即可发布</span></p>
      <a href="secondaryActivity" class="btn" style="font-weight: bold;vertical-align: text-top;margin-top: 0.25rem;">立即参加</a>
    </div>
  </div>


  <script
    src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
  <script>
    $(function () {
      //底部菜单栏的信封按钮上红点提示信息为0则不显示
      var userRecord = ${userRecord};
      if (userRecord != null && userRecord != 0) {
        $(".tabBar-mail").append("<span class='prompt abs'>" + userRecord + "</span>");
      }
      var $redDot = $(".tabBar-mail .prompt");
      if ($redDot.text() == "0" || $redDot.text() == null || $redDot.text() == "") {
        $redDot.hide();
      }

      //点击底部菜单栏的信封按钮，如果有小红点提示信息就隐藏小红点
      $(".tabBar-mail").on("click", function () {
        if ($(this).find("span")) {
          $(this).find("span").remove();
        }
        window.location.href = "message";
      });

      // 点击页面上的图片入口，分别显示活动详情层
      $(".indexEntry1").on("click", function () {
        $(".indexLayer").show();
        $(".activity1").show();
        $(".activity2").hide();
        $(".index").addClass("blur");
      });

      $(".indexEntry2").on("click", function () {
        $(".indexLayer").show();
        $(".activity2").show();
        $(".activity1").hide();
        $(".index").addClass("blur");
      });

      //点击X按钮关闭活动详情层
      $(".indexLayer .closeBtn").on("click", function () {
        $(".indexLayer").hide();
        $(".index").removeClass("blur");
      });


    });
  </script>
</body>
</html>
