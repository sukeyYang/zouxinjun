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
  <title>关于我们</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width,user-scalable=0"/>
  <script type="text/javascript">
    document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    window.onresize = function () {
      document.documentElement.style.fontSize = document.documentElement.clientWidth / 6.4 + 'px';
    };
  </script>
  <link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>css/school.css">
</head>
<body>
<div class="prefectLayer">
  <!-- 完善信息 -->
  <div class="prefectUserinfo">
    <h2>请完善下列信息</h2>
    <form action="">
      <div class="input-item">
        学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：<input type="text"
                                                            name="college"
                                                            placeholder="--请选择--"
                                                            readonly
                                                            id="school-name"
                                                            onclick="pop()">
      </div>
      <div class="input-item">
        手机号码：<input type="number" name="phonenumber">
      </div>
      <div class="input-item">
        微&nbsp;&nbsp;信&nbsp;&nbsp;号：<input type="text" name="wechatuser">
      </div>
      <p class="tip"></p>
      <button type="submit">确定</button>
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

<script
  src="http://cache.shchengdian.com/js/PhotoClip-V2.05/jquery-3.1.1.min.js"></script>
<script>
  $(function () {
    var $pUI = $(".prefectUserinfo"),
      $pform = $pUI.find("form"),
      $p = $pform.find("p.tip"),
      $btn = $pform.find("button");

    $btn.on("click", function () {
      var $college = $pform.find("input[name='college']").val(),
        $phonenumber = $pform.find("input[name='phonenumber']").val(),
        $wechatuser = $pform.find("input[name='wechatuser']").val();
      //提交验证
      if ($college == "" || $college == null || $phonenumber == "" || $phonenumber == null) {
        $p.text("学校和手机号码不能为空");
        return false;
      } else if ($phonenumber.length != 11) {
        $p.text("请输入正确的手机号码");
        return false;
      }
      //提交表单并跳转页面
      $.ajax({
        type: "post",
        url: "",
        datatype: "jason",
        data: {
          "college": $college,
          "phonenumber": $phonenumber,
          "wechatuser": $wechatuser
        },
        success: function (result) {
          if (result) {
            $pUI.hide();
          }
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
