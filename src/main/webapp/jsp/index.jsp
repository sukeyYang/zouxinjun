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
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/school.css">
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
         style="font-weight: bold;vertical-align: text-top;">立即参加</a>
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
      <a class="btn" style="font-weight: bold;vertical-align: text-top;">暂未开放</a>
    </div>
  </div>
  <c:if test="${isNew == 1}">
  <!-- 用户验证222 -->
  <div class="prefectLayer">
    <!-- 完善信息 -->
    <div class="prefectUserinfo">
      <h2>请完善下列信息</h2>
      <form>
        <div class="input-item">
          学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：
          <input type="text" name="college" placeholder="--请选择--" readonly id="school-name" onclick="pop()">
        </div>
        <div class="input-item">
          手机号码：<input type="number" name="phonenumber">
        </div>
        <div class="input-item">
          微&nbsp;&nbsp;信&nbsp;&nbsp;号：<input type="text" name="wechatuser">
        </div>
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
</div>

</c:if>


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

    //验证用户弹层
    //首次参加活动的用户需要完善信息才能参加活动
    $(".prefectUserinfo button").on("click", function () {
      var $pform = $(".prefectUserinfo form"),
        $p = $pform.find("p.tip"),
        $college = $pform.find("input[name='college']").val(),
        $phonenumber = $pform.find("input[name='phonenumber']").val(),
        $wechatId = $pform.find("input[name='wechatuser']").val();
      //提交验证
      if ($.trim($college) == "" || $college == null || $.trim($phonenumber) == "" || $phonenumber == null || $.trim($wechatId) == "" || $wechatId == null) {
        $p.text("输入不能为空");
        return false;
      } else if ($phonenumber.length != 11) {
        $p.text("请输入正确的手机号码");
        return false;
      }
      //提交表单并隐藏页面
      $.ajax({
        type: "post",
        url: "saveUserinfo",
        datatype: "jason",
        data: {
          "school": $college,
          "phone": $phonenumber,
          "wechatId": $wechatId
        },
        success: function () {
          $(".prefectLayer").hide();
        }
      });
    });
  });
</script>

<script src="<%=basePath%>/js/school.js"></script>
<script>
  //弹出窗口
  function pop() {

    //初始化省份列表
    initProvince();

    //默认情况下, 给第一个省份添加choosen样式
    $('[province-id="1"]').addClass('choosen');

    //初始化大学列表
    initSchool(1);

    //将窗口居中
    makeCenter();
  }
  //隐藏窗口
  function hide() {
    $('#choose-box-wrapper').css("display", "none");
  }

  function initProvince() {
    //原先的省份列表清空
    $('#choose-a-province').html('');
    for (i = 0; i < schoolList.length; i++) {
      $('#choose-a-province').append('<a class="province-item" province-id="' + schoolList[i].id + '">' + schoolList[i].name + '</a>');
    }
    //添加省份列表项的click事件
    $('.province-item').on('click', function () {
        var item = $(this);
        var province = item.attr('province-id');
        var choosenItem = item.parent().find('.choosen');
        if (choosenItem)
          $(choosenItem).removeClass('choosen');
        item.addClass('choosen');
        //更新大学列表
        initSchool(province);
      }
    );
  }

  function initSchool(provinceID) {
    //原先的学校列表清空
    $('#choose-a-school').html('');
    var schools = schoolList[provinceID - 1].school;
    for (i = 0; i < schools.length; i++) {
      $('#choose-a-school').append('<a class="school-item" school-id="' + schools[i].id + '">' + schools[i].name + '</a>');
    }
    //添加大学列表项的click事件
    $('.school-item').bind('click', function () {
        var item = $(this);
        var school = item.attr('school-id');
        //更新选择大学文本框中的值
        var province = $(".province-item.choosen").text();
        $("#school_province").val(province);
        $('#school-name').val(item.text());
        //关闭弹窗
        hide();
      }
    );
  }

  function makeCenter() {
    $('#choose-box-wrapper').css("display", "block");
    $('#choose-box-wrapper').css("position", "absolute");
    $('#choose-box-wrapper').css("top", Math.max(0, (($(window).height() - $('#choose-box-wrapper').outerHeight()) / 2) + $(window).scrollTop()) + "px");
    $('#choose-box-wrapper').css("left", Math.max(0, (($(window).width() - $('#choose-box-wrapper').outerWidth()) / 2) + $(window).scrollLeft()) + "px");
  }

</script>
</body>
</html>
