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
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css">
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
        <li takeaway="0">
          <h2>${item.title}</h2>
          <p>${item.school}</p>
          <input type="hidden" name="content" value="${item.content}">
          <input type="hidden" name="phonenumber" value="${item.phone}">
          <input type="hidden" name="sender" value="${item.openid}">
          <input type="hidden" name="senderName" value="${item.nickname}">
          <input type="hidden" name="letterId" value="${item.id}">
        </li>
      </c:forEach>
    </ul>
  </div>

  <!-- 确认是否领取信件(弹层222) -->
  <div class="confirmLayer">
    <div class="confirm">
      是否确认领取Ta的心愿
      <div class="closeBtn cbPos2">
        <span class="cSpan bw rz45"></span>
        <span class="cSpan bw rz-45"></span>
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
      <p class="textcontent">正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文</p>
      <p class="contactWay">
        联系手机<br/>
        <span>13627666698</span>
      </p>
      <input type="hidden" name="sender" value="">
      <input type="hidden" name="senderName" value="">
      <input type="hidden" name="letterId" value="">
      <button type="button" class="btn">完成</button>
      <div class="chance">拆信机会-1</div>
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

    var p = 1;  //初始化page
    //信件列表页下拉预加载
    $(".letterList").on("scroll", function () {
      var minHeight = $(this).get(0).scrollHeight - 100;
      if (minHeight <= $(this).scrollTop() + $(this).height()) {
        p++;
        $.ajax({
          type: "post",
          url: "moreLetters",
          datatype: "jason",
          data: {
            "page": p
          },
          success: function (data) {
            if (data.length < 10) {
              $(".letterList").off("scroll");
            }
            var str = "";
            for (var i = 0; i < data.length; i++) {
              str += "<li takeaway='0' >";
              str += "<h2>" + data[i].title + "</h2>";
              str += "<p>" + data[i].school + "</p>";
              str += "<input type='hidden' name='content' value='" + data[i].content + "'>";
              str += "<input type='hidden' name='phone' value='" + data[i].phone + "'>";
              str += "<input type='hidden' name='openid' value='" + data[i].openid + "'>";
              str += "<input type='hidden' name='nickname' value='" + data[i].nickname + "'>";
              str += "<input type='hidden' name='letterid' value='" + data[i].id + "'>";
              str += "</li>";
            }
            $(".letterList").append(str);
          }
        });
      }
    });

    var flag = ${flag}; //拆信机会
    console.log(flag);
    // 点击信件，判断是否还有拆信机会，若有机会确认层弹出,同时在在信件详情信填充对应数据
    $(".mailBox ul").on("click", "li", function () {
      //填充信件详情（不可见）
      var title = $(this).find("h2").text();
      var content = $(this).find("input[name='content']").val();
      var phone = $(this).find("input[name='phone']").val();
      var sender = $(this).find("input[name='sender']").val();
      var letterId = $(this).find("input[name='letterId']").val();
      var $mail = $(".mailContent");
      $mail.find("h2").text(title);
      $mail.find(".textcontent").text(content);
      $mail.find(".contactWay span").text(phone);
      $mail.find("input[name='sender']").val(sender);
      $mail.find("input[name='letterId']").val(letterId);

      var takeaway = $(this).attr("takeaway");
      if (takeaway == 0) {
        //判断是否还有拆信机会,如无机会进行提示
        if (flag == 0) {
          $(".chance0").show();
          return false;
        } else {
          $(".confirmLayer").show(); //显示确认层
        }
      } else if (takeaway == 1) {
        $(".mailLayer").show();
        $(".mailBox").addClass("blur");
      }
    })

    // 点击X按钮关闭确认层
    $(".confirm .closeBtn").on("click", function () {
      $(".confirmLayer").hide();
    });

    // 点击勾按钮关闭确认层，打开信件内容层并提交数据
    $(".yesBtn").on("click", function () {
      var sender = $(".mailContent input[name='sender']").val();
      var letterId = $(".mailContent input[name='letterId']").val();
      $.ajax({
        type: "post",
        url: "userReceive",
        datatype: "jason",
        data: {
          "sender": sender,
          "letterId": letterId
        },
        success: function () {
          $(".mailBox li").find("input[value='" + letterId + "']").parent().attr("takeaway", "1");
          $(".confirmLayer").hide();
          $(".mailLayer").show();
          $(".mailBox").addClass("blur");
          flag--;
        }
      })
    });

    // 第一次点击勾按钮，拆信机会-1提示层淡出
    $(".yesBtn").one("click", function () {
      $(".chance").fadeOut(2000);
    });

    // 点击信件内容层的完成按钮关闭弹层
    $(".mailLayer button").on("click", function () {
      $(".mailLayer").hide();
      $(".mailBox").removeClass("blur");
    });

    // 点击+号按钮打开发布信息及提示关注层
    $(".addBtn").on("click", function () {
      $(".postLayer").show();
      $(".mailBox").addClass("blur");
      $(".chance0").hide();
    });

    // 点击X号按钮关闭发布信息及提示关注层,清空表单数据
    $(".postLayer .closeBtn").on("click", function () {
      $(".postLayer").hide();
      $(".mailBox").removeClass("blur");
      $(this).parent().get(0).reset();
    });

    // 点击表单的发布按钮异步提交数据并执行回调函数
    $(".postLayer form button").on("click", function () {
      var $title = $(".postLayer form input[name='title']").val();
      var $content = $(".postLayer form textarea").val();
//					$phonenumber = $(".postLayer form input[name='phonenumber']").val(),
//					$address = $(".postLayer form input[name='address']").val();
      if ($.trim($title) == "" || $title == null || $.trim($content) == "" || $content == null) {
        $(".tip").text("输入不能为空");
        return false;
      }
      $.ajax({
        type: "post",
        url: "saveLetter",
        datatype: "jason",
        data: {
          "title": $(".postLayer form input[name='title']").val(),
          "content": $(".postLayer form textarea").val()
        },
        success: function (result) {
          $(".postLayer form ").hide().get(0).reset();
          flag++;
        }
      });
    });

    // 点击提示关注页的确定按钮关闭该层
    $(".payAttention button").on("click", function () {
//      $(".postLayer form").show();
//      $(".postLayer").hide();
//      $(".mailBox").removeClass("blur");
      window.location.reload();
    });

  });
</script>
</body>
</html>
