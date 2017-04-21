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
  <title>个人资料</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width,user-scalable=0"/>
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/school.css">
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

<!-- 个人资料 -->
<div class="container" style="background: #F7F7F7;">
  <div class="personalData">
    <div class="headPortrait clearfix">
      <span>头像</span>
      <img src="${headimgurl}">
      <%--<img src="<%=basePath%>/images/head1.jpg">--%>
    </div>
    <div class="dataDetial nickname clearfix">
      <span>昵称</span>
      <span>${nickName}</span>
    </div>
    <div class="dataDetial school clearfix">
      <span>学校</span>
      <span>${school}</span>
    </div>
    <div class="dataDetial phone clearfix">
      <span>手机号</span>
      <span>${phone}</span>
    </div>
  </div>
  <!-- 修改信息弹层 -->
  <div class="changeInfo" style="display:none;">
    <form>
      <div class="changeCollege input-item">
        修改学校：<input type="text" name="college" placeholder="--请选择--" readonly
                    id="school-name" onclick="pop()">
      </div>
      <div class="changeNumber input-item">
        修改号码：<input type="number" name="phonenumber">
      </div>
      <p class="tip"></p>
      <button type="button" class="btn enter">确定</button>
      <button type="button" class="btn cancel">取消</button>
    </form>

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


  <!-- 底部走心君文字 -->
  <img src="<%=basePath%>/images/zxj2.png" class="megZxj">
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

    //点击学校或者电话，弹出修改信息层
    $(".school").on("click", function () {
      $(".changeInfo").show();
      $(".changeNumber").hide();
      $(".changeCollege").show();
    });

    $(".phone").on("click", function () {
      $(".changeInfo").show();
      $(".changeCollege").hide();
      $(".changeNumber").show();
    });

    //点击确认按钮提交数据
    $(".enter").on("click", function () {
      var $college = $(".changeCollege input[name='college']").val();
      var $phonenumber = $(".changeNumber input[name='phonenumber']").val();
      //提交验证
      if ($.trim($college) == "" && $.trim($phonenumber) == "") {
        $(".tip").text("输入不能为空");
        return false;
      } else if ($phonenumber != "" && $phonenumber.length != 11) {
        $(".tip").text("请输入正确的手机号码");
        return false;
      }

      if ($college != "") {
        $(".school span:last-child").text($college);
      }
      ;
      if ($phonenumber != "") {
        $(".phone span:last-child").text($phonenumber);
      }
      ;
      $.ajax({
        type: "post",
        url: "changeUserinfo",
        datatype: "jason",
        data: {
          "school": $college,
          "phone": $phonenumber
        },
        success: function () {
          $(".changeInfo").hide();
          $(".changeInfo form").get(0).reset();
          $(".tip").text("");
        }
      });
    });

    //点击取消按钮提交数据
    $(".cancel").on("click", function () {
      $(".changeInfo").hide();
      $(".changeInfo form").get(0).reset();
      $(".tip").text("");
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
