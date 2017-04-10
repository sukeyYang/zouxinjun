<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
    + request.getServerName() + ":" + request.getServerPort()
    + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <title>全球大学创业精神中国调查</title>
  <link rel="shortcut icon" href="favicon.ico" type="image/vnd.microsoft.icon">

  <!-- Bootstrap -->
  <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="<%=basePath%>css/bootstrapValidator.min.css"/>

  <link href="<%=basePath%>css/bootstrap-theme.min.css" rel="stylesheet">

  <!-- Bootstrap Tags Input -->
  <!--<link href="css/bootstrap-tagsinput.css" rel="stylesheet">-->
  <link href="<%=basePath%>css/bootstrap-wizard.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=basePath%>css/question-items.css" rel="stylesheet">

  <link href="<%=basePath%>css/bootstrap-datetimepicker.min.css"
        rel="stylesheet" media="screen">
</head>
<body>
<!--<img class="img-responsive" src="images/wf-logo.jpg">-->
<div class="page-header">

  <div class="container">
    <div class="row">
      <div class="col-md-offset-1 col-md-11">
        <h3>全球大学创业精神中国调查  <small>Global University Entrepreneurial Spirit Students' Survey in China</small></h3>
        <p>答完问卷后有红包哦</p>
        <p>ps:今日（6.19）红包数>=1000,手速慢无</p>
      </div>
    </div>
  </div>
</div>

<div class="container">

  <div class="row bs-wizard">

    <div class="col-xs-4 bs-wizard-step active">
      <div class="text-center bs-wizard-stepnum">步骤 1</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">个人信息及学习情况</div>
    </div>

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 2</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">职业选择意向</div>
    </div>

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 3</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你与创业</div>
    </div>
  </div>

  <form class="form-horizontal" id="survey" method="post"
        action="<%= basePath%>save_answer" onsubmit="return validateForm()">


    <div class="form-group">
      <label class="col-md-2 control-label">出生年份：</label>
      <div class="col-md-8">
        <div class="row">
          <div class="input-group date form_date col-lg-5" data-date="" data-date-format="yyyy" data-link-field="dtp_input2" data-link-format="yyyy" style="padding: 0 15px;">
            <input class="form-control" name="q1" id="q1" type="text" readonly>
            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">性别</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q2" value="1"> 男
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q2" value="2"> 女
            </label>
          </div>
        </div>
      </div>
    </div>


    <div class="form-group">
      <label class="col-md-2 control-label">国籍</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q3" value="1"> 中国
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q3" value="2"> 德国
            </label>
          </div>

          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q3" value="3"> 法国
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q3" value="4"> 日本
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q3" value="5"> 韩国
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q3" value="6"> 其他
            </label>
          </div>

        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你出生于哪个国家</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label style="width:25%">
              <input type="radio" required id="china" name="q4" value="1"> 中国
            </label>
            <select id="province" required name="province"
                    style="width:30%"></select>

            <select id="city" required name="city" style="width:30%"></select>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="2"> 德国
            </label>
          </div>

          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="3"> 法国
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="4"> 日本
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="5"> 韩国
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q4" value="6"> 其他
            </label>
          </div>

        </div>
      </div>
    </div>


    <div class="form-group">
      <label class="col-md-2 control-label">你在目前居住的国家生活了多久</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q5" value="1"> 1-5年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="2"> 6-10年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="3"> 11-15年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="4"> 16-20年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="5"> 21到25年
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q5" value="6"> 25年以上
            </label>
          </div>

        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你所就读的大学是</label>
      <div class="col-md-8">
        <input type="text" name="q6" placeholder="--请选择--" readonly
               id="school-name" onclick="pop()" class="form-control">
      </div>

    </div>
    <div id="choose-box-wrapper">
      <div id="choose-box">
        <div id="choose-box-title">
          <span>选择学校</span>
        </div>
        <div id="choose-a-province">
        </div>
        <div id="choose-a-school">
        </div>
        <div id="choose-box-bottom">
          <input type="botton" onclick="hide()" value="关闭"/>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你正在攻读的学位是</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q7" value="1"> 中专/大专
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q7" value="2"> 学士（本科生）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="3"> 硕士研究生
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q7" value="4"> 其他（博士研究生、MBA、EMBA等）
            </label>
          </div>

        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你所学习的专业是 （请选择最贴切的一项）</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q8" value="1">
              人文专业（语言，文化，宗教，哲学，历史）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="2"> 工程专业（计算机科学，建筑学等）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="3"> 人类医学、健康科学专业
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="4"> 经济和法律专业（包括商学）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="5"> 数学和其他自然科学
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="6"> 艺术专业（设计，音乐，戏剧）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="7"> 社会科学（心理学，政治学，教育科学）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q8" value="8"> 其他
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你是在哪一年开始攻读当前学位的</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q9" value="1"> 2016
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q9" value="2"> 2015
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q9" value="3"> 2014
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q9" value="4"> 2013或更早
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你准备在哪一年完成当前阶段的学习</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q10" value="1"> 2016
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q10" value="2"> 2017
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q10" value="3"> 2018
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q10" value="4"> 2019或更晚
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你是国际交流生吗</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q11" value="1"> 是
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q11" value="2"> 不是
            </label>
          </div>
        </div>
      </div>
    </div>
    <input type="hidden" name="part" id="part" value="1">
    <input type="hidden" name="school_province" id="school_province" >
    <hr>

    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-lg">保存</button>
      </div>
    </div>
  </form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>

<script src="<%=basePath%>js/bootstrapValidator.min.js"></script>

<!--<script src="js/bootstrap-tagsinput.min.js"></script>-->

<script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8"></script>
<script src="<%=basePath%>js/school.js" type="text/javascript"></script>
<script src="<%=basePath%>js/data.js"></script>
<script src="<%=basePath%>js/jquery.city.select.min.js"></script>

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript"></script>
<script type="text/javascript">
  var Title = "【抢红包@你】全球大学创业精神中国调查";
  var Desc = "有趣，教你如何高大上的获取红包，全球大学创业精神中国调查|Global University Entrepreneurial Spirit Students' Survey in China";
  var imageUrl = "<%=basePath%>images/redpack.jpg";
</script>
<script src="<%=basePath %>js/weixin-js-config.js"></script>

<script type="text/javascript">

  $('.form_date').datetimepicker({
    language: 'zh-CN',
    weekStart: 1,
    format: 'yyyy',
    initialDate: new Date('1990-01-01'),
    todayBtn: 0,
    autoclose: 1,
    todayHighlight: 1,
    startView: 4,
    minView: 4,
    forceParse: 0
  });

  $(document).ready(function () {
    //$('#survey').bootstrapValidator({});
    $('#province, #city').citylist({
      data: data,
      id: 'id',
      children: 'cities',
      name: 'name',
      metaTag: 'name'
    });
  });

  function validateForm() {

    if ($("#q1").val() == '') {
      $("#q1").closest(".form-group").addClass("has-error");
      $("html,body").animate({scrollTop: $("#q1").closest(".form-group").offset().top - 20});
      return false;
    }
    if($("#china").is(':checked') ==true){
      if ($("#province").val() == '' || $("#province").val() == '省') {
            $("#province").closest(".form-group").addClass("has-error");
            $("html,body").animate({scrollTop: $("#province").closest(".form-group").offset().top - 20});
            return false;
      }
      if ($("#city").val() == '' || $("#city").val() == '市') {
        $("#city").closest(".form-group").addClass("has-error");
        $("html,body").animate({scrollTop: $("#city").closest(".form-group").offset().top - 20});
        return false;
      }
    }

    if ($("#school-name").val() == '') {
      $("#school-name").closest(".form-group").addClass("has-error");
      $("html,body").animate({scrollTop: $("#school-name").closest(".form-group").offset().top - 20});
      return false;
    }

    return true;


  }

</script>
<script type="text/javascript">
  //弹出窗口
  function pop() {
    //将窗口居中
    makeCenter();

    //初始化省份列表
    initProvince();

    //默认情况下, 给第一个省份添加choosen样式
    $('[province-id="1"]').addClass('choosen');

    //初始化大学列表
    initSchool(1);
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
    $('.province-item').bind('click', function () {
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
        var province= $(".province-item.choosen").text();
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
