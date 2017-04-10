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
  <link href="<%=basePath%>css/question-items.css" rel="stylesheet" rel="stylesheet" media="screen">
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

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 6</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你的企业</div>
    </div>

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 7</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你父母的企业</div>
    </div>

    <div class="col-xs-4 bs-wizard-step active">
      <div class="text-center bs-wizard-stepnum">步骤 8</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">结语</div>
    </div>
  </div>

  <form class="form-horizontal" id="survey" method="post"
        action="<%= basePath%>save_answer" onsubmit="return validateForm()">


    <div class="form-group">
      <label class="col-md-2 control-label">你是否在2013年秋/2014年春参与了GUESSS调查</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q76" value="1"> 是
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q76" value="2"> 否
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">如果你希望了解调研结果，请写出自己的邮箱地址</label>
      <div class="col-md-8">
        <input type="email" name="q77" class="form-control">
      </div>
    </div>

    <input type="hidden" name="part" id="part" value="8">
    <hr>

    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-lg">完成</button>
      </div>
    </div>
  </form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript"></script>
<script type="text/javascript">
  var Title = "【红包@你】全球大学创业精神中国调查";
  var Desc = "有趣，教你如何高大上的获取红包，全球大学创业精神中国调查|Global University Entrepreneurial Spirit Students' Survey in China";
  var imageUrl = "<%=basePath%>images/redpack.jpg";
</script>
<script src="<%=basePath %>js/weixin-js-config.js"></script>

</body>
</html>
