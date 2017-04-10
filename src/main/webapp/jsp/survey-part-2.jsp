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
  <link rel="shortcut icon" href="favicon.ico"
        type="<%=basePath%>image/vnd.microsoft.icon">

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
        rel="stylesheet"
        media="screen">

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
      <div class="text-center bs-wizard-stepnum">步骤 1</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">个人信息及学习情况</div>
    </div>

    <div class="col-xs-4 bs-wizard-step active">
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
      <label class="col-md-2 control-label">完成当前阶段学习后，你希望成为</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q12" value="1">
              在一家小型企业中（员工规模1-49人）
            </label>

          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="2"> 在一家中型企业中（员工规模50-249人）
            </label>
          </div>

          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="3"> 在一家大型企业中（员工规模250人以上）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="4"> 在非营利性组织中
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="5"> 在学术组织中 （如高等教育机构）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="6"> 在公共服务组织中（如政府机关）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="7"> 创立自己的企业
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="8"> 在父母或家族的企业中继续工作
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="9"> 继承其他企业
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q12" value="10"> 其他
            </label>
          </div>


        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">完成当前阶段学习<b>5年后</b>，你希望成为</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q13" value="1">
              在一家小型企业中（员工规模1-49人）
            </label>

          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="2"> 在一家中型企业中（员工规模50-249人）
            </label>
          </div>

          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="3"> 在一家大型企业中（员工规模250人以上）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="4"> 在非营利性组织中
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="5"> 在学术组织中 （如高等教育机构）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="6"> 在公共服务组织中（如政府机关）
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="7"> 创立自己的企业
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="8"> 在父母或家族的企业中继续工作
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="9"> 继承其他企业
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q13" value="10"> 其他
            </label>
          </div>


        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你现在是否正在尝试创建自己的企业</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q14" value="1"> 是
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q14" value="2"> 否
            </label>
          </div>

        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你是否已经创立了自己的企业</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-2">
            <label>
              <input type="radio" required name="q15" value="1"> 是
            </label>
          </div>
          <div class="radio col-sm-2">
            <label>
              <input type="radio" name="q15" value="2"> 否
            </label>
          </div>

        </div>
      </div>
    </div>


    <div class="form-group">
      <label class="col-md-2 control-label">下面是对你所就读的大学环境的描述，请指出你对这些描述的认可程度
        （1=完全不同意，7=完全同意）</label>
      <div class="col-md-8">
        <div class="row" style="padding:0 15px">
          <table class="table table-condensed">
            <tr class="info">
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
            </tr>
            <tr>
              <td colspan="7">学校内的氛围激励我积极开发创业的想法</td>
            </tr>
            <tr>
              <td><input type="radio" name="q16_1" value="1" required></td>
              <td><input type="radio" name="q16_1" value="2"></td>
              <td><input type="radio" name="q16_1" value="3"></td>
              <td><input type="radio" name="q16_1" value="4"></td>
              <td><input type="radio" name="q16_1" value="5"></td>
              <td><input type="radio" name="q16_1" value="6"></td>
              <td><input type="radio" name="q16_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我就读的大学有良好的创业环境和氛围</td>
            </tr>
            <tr>
              <td><input type="radio" name="q16_2" value="1" required></td>
              <td><input type="radio" name="q16_2" value="2"></td>
              <td><input type="radio" name="q16_2" value="3"></td>
              <td><input type="radio" name="q16_2" value="4"></td>
              <td><input type="radio" name="q16_2" value="5"></td>
              <td><input type="radio" name="q16_2" value="6"></td>
              <td><input type="radio" name="q16_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在我的大学中，学生创业活动受到鼓励</td>
            </tr>
            <tr>
              <td><input type="radio" name="q16_3" value="1" required></td>
              <td><input type="radio" name="q16_3" value="2"></td>
              <td><input type="radio" name="q16_3" value="3"></td>
              <td><input type="radio" name="q16_3" value="4"></td>
              <td><input type="radio" name="q16_3" value="5"></td>
              <td><input type="radio" name="q16_3" value="6"></td>
              <td><input type="radio" name="q16_3" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">请指出你对下列有关学习描述的认可程度
        （1=完全不同意，7=完全同意）</label>
      <div class="col-md-8">
        <div class="row" style="padding:0 15px">
          <table class="table table-condensed">
            <tr class="info">
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
            </tr>
            <tr>
              <td colspan="7">所学课程加强了我对创业者的态度、价值和动机的理解</td>
            </tr>
            <tr>
              <td><input type="radio" name="q17_1" value="1" required></td>
              <td><input type="radio" name="q17_1" value="2"></td>
              <td><input type="radio" name="q17_1" value="3"></td>
              <td><input type="radio" name="q17_1" value="4"></td>
              <td><input type="radio" name="q17_1" value="5"></td>
              <td><input type="radio" name="q17_1" value="6"></td>
              <td><input type="radio" name="q17_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">所学课程增加了我对创业所必须采取的行动的认识</td>
            </tr>
            <tr>
              <td><input type="radio" name="q17_2" value="1" required></td>
              <td><input type="radio" name="q17_2" value="2"></td>
              <td><input type="radio" name="q17_2" value="3"></td>
              <td><input type="radio" name="q17_2" value="4"></td>
              <td><input type="radio" name="q17_2" value="5"></td>
              <td><input type="radio" name="q17_2" value="6"></td>
              <td><input type="radio" name="q17_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">所学课程增强了创业所需的管理技能</td>
            </tr>
            <tr>
              <td><input type="radio" name="q17_3" value="1" required></td>
              <td><input type="radio" name="q17_3" value="2"></td>
              <td><input type="radio" name="q17_3" value="3"></td>
              <td><input type="radio" name="q17_3" value="4"></td>
              <td><input type="radio" name="q17_3" value="5"></td>
              <td><input type="radio" name="q17_3" value="6"></td>
              <td><input type="radio" name="q17_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">所学课程增强了我建立和拓展人际关系网络的能力</td>
            </tr>
            <tr>
              <td><input type="radio" name="q17_4" value="1" required></td>
              <td><input type="radio" name="q17_4" value="2"></td>
              <td><input type="radio" name="q17_4" value="3"></td>
              <td><input type="radio" name="q17_4" value="4"></td>
              <td><input type="radio" name="q17_4" value="5"></td>
              <td><input type="radio" name="q17_4" value="6"></td>
              <td><input type="radio" name="q17_4" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">所学课程增强了我识别创业机会的能力</td>
            </tr>
            <tr>
              <td><input type="radio" name="q17_5" value="1" required></td>
              <td><input type="radio" name="q17_5" value="2"></td>
              <td><input type="radio" name="q17_5" value="3"></td>
              <td><input type="radio" name="q17_5" value="4"></td>
              <td><input type="radio" name="q17_5" value="5"></td>
              <td><input type="radio" name="q17_5" value="6"></td>
              <td><input type="radio" name="q17_5" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>


    <div class="form-group">
      <label class="col-md-2 control-label">请指出下列哪些描述符合你的实际情况（多选）</label>
      <div class="col-md-8">
        <div class="row">
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" id="q18" name="q18" value="1">
              我从来没有上过创业类的课程
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q18" value="2"> 我至少上过一门创业类的选修课程
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q18" value="3"> 我至少上过一门创业类的必修课程
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q18" value="4"> 我目前正在学习创业类的课程
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q18" value="5">
              我选择目前就读大学的主要原因是它在创业方面的知名度
            </label>
          </div>
        </div>
      </div>
    </div>
    <input type="hidden" name="part"  id="part" value="2">

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

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript"></script>
<script type="text/javascript">
  var Title = "【红包@你】全球大学创业精神中国调查";
  var Desc = "有趣，教你如何高大上的获取红包，全球大学创业精神中国调查|Global University Entrepreneurial Spirit Students' Survey in China";
  var imageUrl = "<%=basePath%>images/redpack.jpg";
</script>
<script src="<%=basePath %>js/weixin-js-config.js"></script>
<script type="text/javascript">

  function validateForm() {
    if ($('input[name=q18]').is(':checked') != true) {
      $("#q18").closest(".form-group").addClass("has-error");
      $("html,body").animate({scrollTop: $("#q18").closest(".form-group").offset().top - 20});
      return false;
    }
    return true;
  }

</script>


</body>
</html>
