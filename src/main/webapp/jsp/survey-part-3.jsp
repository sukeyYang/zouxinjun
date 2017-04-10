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
  <link rel="shortcut icon" href="favicon.ico" type="<%=basePath%>image/vnd.microsoft.icon">

  <!-- Bootstrap -->
  <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="<%=basePath%>css/bootstrapValidator.min.css"/>

  <link href="<%=basePath%>css/bootstrap-theme.min.css" rel="stylesheet">

  <!-- Bootstrap Tags Input -->
  <!--<link href="css/bootstrap-tagsinput.css" rel="stylesheet">-->
  <link href="<%=basePath%>css/bootstrap-wizard.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=basePath%>css/question-items.css" rel="stylesheet">

  <link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet"
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
      <div class="text-center bs-wizard-stepnum">步骤 2</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">职业选择意向</div>
    </div>

    <div class="col-xs-4 bs-wizard-step active">
      <div class="text-center bs-wizard-stepnum">步骤 3</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你与创业</div>
    </div>

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 4</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">环境认知</div>
    </div>
  </div>

  <form class="form-horizontal" id="survey" method="post" action="<%= basePath%>save_answer">


    <div class="form-group">
      <label class="col-md-2 control-label">关于你的想法，请指出你对下列描述的认可程度
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
              <td colspan="7">为了成为创业者，我愿意做任何事</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_1" value="1" required></td>
              <td><input type="radio" name="q19_1" value="2"></td>
              <td><input type="radio" name="q19_1" value="3"></td>
              <td><input type="radio" name="q19_1" value="4"></td>
              <td><input type="radio" name="q19_1" value="5"></td>
              <td><input type="radio" name="q19_1" value="6"></td>
              <td><input type="radio" name="q19_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我的职业目标是成为一名创业者</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_2" value="1" required></td>
              <td><input type="radio" name="q19_2" value="2"></td>
              <td><input type="radio" name="q19_2" value="3"></td>
              <td><input type="radio" name="q19_2" value="4"></td>
              <td><input type="radio" name="q19_2" value="5"></td>
              <td><input type="radio" name="q19_2" value="6"></td>
              <td><input type="radio" name="q19_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我会尽一切努力来创立和经营我自己的企业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_3" value="1" required></td>
              <td><input type="radio" name="q19_3" value="2"></td>
              <td><input type="radio" name="q19_3" value="3"></td>
              <td><input type="radio" name="q19_3" value="4"></td>
              <td><input type="radio" name="q19_3" value="5"></td>
              <td><input type="radio" name="q19_3" value="6"></td>
              <td><input type="radio" name="q19_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我决心在将来创立一家新企业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_4" value="1" required></td>
              <td><input type="radio" name="q19_4" value="2"></td>
              <td><input type="radio" name="q19_4" value="3"></td>
              <td><input type="radio" name="q19_4" value="4"></td>
              <td><input type="radio" name="q19_4" value="5"></td>
              <td><input type="radio" name="q19_4" value="6"></td>
              <td><input type="radio" name="q19_4" value="7"></td>
            </tr>
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
              <td colspan="7">我已经开始认真思考创立一家新企业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_5" value="1" required></td>
              <td><input type="radio" name="q19_5" value="2"></td>
              <td><input type="radio" name="q19_5" value="3"></td>
              <td><input type="radio" name="q19_5" value="4"></td>
              <td><input type="radio" name="q19_5" value="5"></td>
              <td><input type="radio" name="q19_5" value="6"></td>
              <td><input type="radio" name="q19_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我有创立新企业的强烈意愿</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_6" value="1" required></td>
              <td><input type="radio" name="q19_6" value="2"></td>
              <td><input type="radio" name="q19_6" value="3"></td>
              <td><input type="radio" name="q19_6" value="4"></td>
              <td><input type="radio" name="q19_6" value="5"></td>
              <td><input type="radio" name="q19_6" value="6"></td>
              <td><input type="radio" name="q19_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">通常情况下我能够保护我的个人利益</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_7" value="1" required></td>
              <td><input type="radio" name="q19_7" value="2"></td>
              <td><input type="radio" name="q19_7" value="3"></td>
              <td><input type="radio" name="q19_7" value="4"></td>
              <td><input type="radio" name="q19_7" value="5"></td>
              <td><input type="radio" name="q19_7" value="6"></td>
              <td><input type="radio" name="q19_7" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">当我制定计划的时候，我几乎可以肯定去实现它们</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_8" value="1" required></td>
              <td><input type="radio" name="q19_8" value="2"></td>
              <td><input type="radio" name="q19_8" value="3"></td>
              <td><input type="radio" name="q19_8" value="4"></td>
              <td><input type="radio" name="q19_8" value="5"></td>
              <td><input type="radio" name="q19_8" value="6"></td>
              <td><input type="radio" name="q19_8" value="7"></td>
            </tr>
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
              <td colspan="7">我可以决定我未来的生活</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_9" value="1" required></td>
              <td><input type="radio" name="q19_9" value="2"></td>
              <td><input type="radio" name="q19_9" value="3"></td>
              <td><input type="radio" name="q19_9" value="4"></td>
              <td><input type="radio" name="q19_9" value="5"></td>
              <td><input type="radio" name="q19_9" value="6"></td>
              <td><input type="radio" name="q19_9" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">创业对我来说利大于弊</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_10" value="1" required></td>
              <td><input type="radio" name="q19_10" value="2"></td>
              <td><input type="radio" name="q19_10" value="3"></td>
              <td><input type="radio" name="q19_10" value="4"></td>
              <td><input type="radio" name="q19_10" value="5"></td>
              <td><input type="radio" name="q19_10" value="6"></td>
              <td><input type="radio" name="q19_10" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">创业对我来说很有吸引力</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_11" value="1" required></td>
              <td><input type="radio" name="q19_11" value="2"></td>
              <td><input type="radio" name="q19_11" value="3"></td>
              <td><input type="radio" name="q19_11" value="4"></td>
              <td><input type="radio" name="q19_11" value="5"></td>
              <td><input type="radio" name="q19_11" value="6"></td>
              <td><input type="radio" name="q19_11" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">只要我有机会和资源，我就会去创业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_12" value="1" required></td>
              <td><input type="radio" name="q19_12" value="2"></td>
              <td><input type="radio" name="q19_12" value="3"></td>
              <td><input type="radio" name="q19_12" value="4"></td>
              <td><input type="radio" name="q19_12" value="5"></td>
              <td><input type="radio" name="q19_12" value="6"></td>
              <td><input type="radio" name="q19_12" value="7"></td>
            </tr>
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
              <td colspan="7">创业能够给我带来极大的满足感</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_13" value="1" required></td>
              <td><input type="radio" name="q19_13" value="2"></td>
              <td><input type="radio" name="q19_13" value="3"></td>
              <td><input type="radio" name="q19_13" value="4"></td>
              <td><input type="radio" name="q19_13" value="5"></td>
              <td><input type="radio" name="q19_13" value="6"></td>
              <td><input type="radio" name="q19_13" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在各种各样的选择中，我宁愿成为一名创业者</td>
            </tr>
            <tr>
              <td><input type="radio" name="q19_14" value="1" required></td>
              <td><input type="radio" name="q19_14" value="2"></td>
              <td><input type="radio" name="q19_14" value="3"></td>
              <td><input type="radio" name="q19_14" value="4"></td>
              <td><input type="radio" name="q19_14" value="5"></td>
              <td><input type="radio" name="q19_14" value="6"></td>
              <td><input type="radio" name="q19_14" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">关于你的技能，请指出你对完成下列活动或任务的胜任程度
        （1=完全不能胜任，7=完全能够胜任）</label>
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
              <td colspan="7">识别创业机会</td>
            </tr>
            <tr>
              <td><input type="radio" name="q20_1" value="1" required></td>
              <td><input type="radio" name="q20_1" value="2"></td>
              <td><input type="radio" name="q20_1" value="3"></td>
              <td><input type="radio" name="q20_1" value="4"></td>
              <td><input type="radio" name="q20_1" value="5"></td>
              <td><input type="radio" name="q20_1" value="6"></td>
              <td><input type="radio" name="q20_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">创造新产品和服务</td>
            </tr>
            <tr>
              <td><input type="radio" name="q20_2" value="1" required></td>
              <td><input type="radio" name="q20_2" value="2"></td>
              <td><input type="radio" name="q20_2" value="3"></td>
              <td><input type="radio" name="q20_2" value="4"></td>
              <td><input type="radio" name="q20_2" value="5"></td>
              <td><input type="radio" name="q20_2" value="6"></td>
              <td><input type="radio" name="q20_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在企业内部进行创新</td>
            </tr>
            <tr>
              <td><input type="radio" name="q20_3" value="1" required></td>
              <td><input type="radio" name="q20_3" value="2"></td>
              <td><input type="radio" name="q20_3" value="3"></td>
              <td><input type="radio" name="q20_3" value="4"></td>
              <td><input type="radio" name="q20_3" value="5"></td>
              <td><input type="radio" name="q20_3" value="6"></td>
              <td><input type="radio" name="q20_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">作为领导者和沟通者</td>
            </tr>
            <tr>
              <td><input type="radio" name="q20_4" value="1" required></td>
              <td><input type="radio" name="q20_4" value="2"></td>
              <td><input type="radio" name="q20_4" value="3"></td>
              <td><input type="radio" name="q20_4" value="4"></td>
              <td><input type="radio" name="q20_4" value="5"></td>
              <td><input type="radio" name="q20_4" value="6"></td>
              <td><input type="radio" name="q20_4" value="7"></td>
            </tr>
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
              <td colspan="7">建立专业的关系网络</td>
            </tr>
            <tr>
              <td><input type="radio" name="q20_5" value="1" required></td>
              <td><input type="radio" name="q20_5" value="2"></td>
              <td><input type="radio" name="q20_5" value="3"></td>
              <td><input type="radio" name="q20_5" value="4"></td>
              <td><input type="radio" name="q20_5" value="5"></td>
              <td><input type="radio" name="q20_5" value="6"></td>
              <td><input type="radio" name="q20_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">将新想法商业化</td>
            </tr>
            <tr>
              <td><input type="radio" name="q20_6" value="1" required></td>
              <td><input type="radio" name="q20_6" value="2"></td>
              <td><input type="radio" name="q20_6" value="3"></td>
              <td><input type="radio" name="q20_6" value="4"></td>
              <td><input type="radio" name="q20_6" value="5"></td>
              <td><input type="radio" name="q20_6" value="6"></td>
              <td><input type="radio" name="q20_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">成功经营一家企业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q20_7" value="1" required></td>
              <td><input type="radio" name="q20_7" value="2"></td>
              <td><input type="radio" name="q20_7" value="3"></td>
              <td><input type="radio" name="q20_7" value="4"></td>
              <td><input type="radio" name="q20_7" value="5"></td>
              <td><input type="radio" name="q20_7" value="6"></td>
              <td><input type="radio" name="q20_7" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">如果你进选择成为创业者，你周围环境中的人将如何反应
        （1=非常负面的反应，7=非常积极的反应）</label>
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
              <td colspan="7">你的家庭成员</td>
            </tr>
            <tr>
              <td><input type="radio" name="q21_1" value="1" required></td>
              <td><input type="radio" name="q21_1" value="2"></td>
              <td><input type="radio" name="q21_1" value="3"></td>
              <td><input type="radio" name="q21_1" value="4"></td>
              <td><input type="radio" name="q21_1" value="5"></td>
              <td><input type="radio" name="q21_1" value="6"></td>
              <td><input type="radio" name="q21_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">你的朋友</td>
            </tr>
            <tr>
              <td><input type="radio" name="q21_2" value="1" required></td>
              <td><input type="radio" name="q21_2" value="2"></td>
              <td><input type="radio" name="q21_2" value="3"></td>
              <td><input type="radio" name="q21_2" value="4"></td>
              <td><input type="radio" name="q21_2" value="5"></td>
              <td><input type="radio" name="q21_2" value="6"></td>
              <td><input type="radio" name="q21_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">你的同学</td>
            </tr>
            <tr>
              <td><input type="radio" name="q21_3" value="1" required></td>
              <td><input type="radio" name="q21_3" value="2"></td>
              <td><input type="radio" name="q21_3" value="3"></td>
              <td><input type="radio" name="q21_3" value="4"></td>
              <td><input type="radio" name="q21_3" value="5"></td>
              <td><input type="radio" name="q21_3" value="6"></td>
              <td><input type="radio" name="q21_3" value="7"></td>
            </tr>

          </table>
        </div>
      </div>
    </div>
    <input type="hidden" name="part" id="part" value="3">
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


</body>
</html>
