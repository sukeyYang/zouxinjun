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
      <div class="text-center bs-wizard-stepnum">步骤 3</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你与创业</div>
    </div>

    <div class="col-xs-4 bs-wizard-step active">
      <div class="text-center bs-wizard-stepnum">步骤 4</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">环境认知</div>
    </div>

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 5</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你的计划</div>
    </div>
  </div>

  <form class="form-horizontal" id="survey" method="post" action="<%= basePath%>save_answer" >


    <div class="form-group">
      <label class="col-md-2 control-label">你的父母是自我雇佣者吗（创业者、自己公司老板等）</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q22" value="1" required> 不是
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q22" value="2"> 父亲是
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q22" value="3"> 母亲是
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q22" value="4"> 父母都是
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你父母是否拥有某一家企业的大部分所有权</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q23" value="1" required> 没有
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q23" value="2"> 父亲有
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q23" value="3"> 母亲有
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q23" value="4"> 父母都有
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">请指出你对下列关于社会环境描述的认可程度
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
              <td colspan="7">在我生活的社会环境中，孩子为父母的个人成就感到自豪</td>
            </tr>
            <tr>
              <td><input type="radio" name="q24_1" value="1" required></td>
              <td><input type="radio" name="q24_1" value="2"></td>
              <td><input type="radio" name="q24_1" value="3"></td>
              <td><input type="radio" name="q24_1" value="4"></td>
              <td><input type="radio" name="q24_1" value="5"></td>
              <td><input type="radio" name="q24_1" value="6"></td>
              <td><input type="radio" name="q24_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在我生活的社会环境中，父母为孩子的个人成就感到自豪</td>
            </tr>
            <tr>
              <td><input type="radio" name="q24_2" value="1" required></td>
              <td><input type="radio" name="q24_2" value="2"></td>
              <td><input type="radio" name="q24_2" value="3"></td>
              <td><input type="radio" name="q24_2" value="4"></td>
              <td><input type="radio" name="q24_2" value="5"></td>
              <td><input type="radio" name="q24_2" value="6"></td>
              <td><input type="radio" name="q24_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在我生活的社会环境中，年迈的父母通常在家里和孩子一起生活</td>
            </tr>
            <tr>
              <td><input type="radio" name="q24_3" value="1" required></td>
              <td><input type="radio" name="q24_3" value="2"></td>
              <td><input type="radio" name="q24_3" value="3"></td>
              <td><input type="radio" name="q24_3" value="4"></td>
              <td><input type="radio" name="q24_3" value="5"></td>
              <td><input type="radio" name="q24_3" value="6"></td>
              <td><input type="radio" name="q24_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在我生活的社会环境中，孩子通常和父母一起居住，直到结婚</td>
            </tr>
            <tr>
              <td><input type="radio" name="q24_4" value="1" required></td>
              <td><input type="radio" name="q24_4" value="2"></td>
              <td><input type="radio" name="q24_4" value="3"></td>
              <td><input type="radio" name="q24_4" value="4"></td>
              <td><input type="radio" name="q24_4" value="5"></td>
              <td><input type="radio" name="q24_4" value="6"></td>
              <td><input type="radio" name="q24_4" value="7"></td>
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
              <td colspan="7">我生活的社会环境强调的是秩序和一致性，即使以尝试和创新为代价</td>
            </tr>
            <tr>
              <td><input type="radio" name="q24_5" value="1" required></td>
              <td><input type="radio" name="q24_5" value="2"></td>
              <td><input type="radio" name="q24_5" value="3"></td>
              <td><input type="radio" name="q24_5" value="4"></td>
              <td><input type="radio" name="q24_5" value="5"></td>
              <td><input type="radio" name="q24_5" value="6"></td>
              <td><input type="radio" name="q24_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在我生活的社会环境中，大部分人的生活是非常结构化的（都沿着特定轨迹展开），很少有意外事件发生
              </td>
            </tr>
            <tr>
              <td><input type="radio" name="q24_6" value="1" required></td>
              <td><input type="radio" name="q24_6" value="2"></td>
              <td><input type="radio" name="q24_6" value="3"></td>
              <td><input type="radio" name="q24_6" value="4"></td>
              <td><input type="radio" name="q24_6" value="5"></td>
              <td><input type="radio" name="q24_6" value="6"></td>
              <td><input type="radio" name="q24_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">社会的规则及对个体的要求是明确的，大部分人都知道社会期望他们做什么</td>
            </tr>
            <tr>
              <td><input type="radio" name="q24_7" value="1" required></td>
              <td><input type="radio" name="q24_7" value="2"></td>
              <td><input type="radio" name="q24_7" value="3"></td>
              <td><input type="radio" name="q24_7" value="4"></td>
              <td><input type="radio" name="q24_7" value="5"></td>
              <td><input type="radio" name="q24_7" value="6"></td>
              <td><input type="radio" name="q24_7" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我生活的社会环境鼓励个人不断努力提高绩效</td>
            </tr>
            <tr>
              <td><input type="radio" name="q24_8" value="1" required></td>
              <td><input type="radio" name="q24_8" value="2"></td>
              <td><input type="radio" name="q24_8" value="3"></td>
              <td><input type="radio" name="q24_8" value="4"></td>
              <td><input type="radio" name="q24_8" value="5"></td>
              <td><input type="radio" name="q24_8" value="6"></td>
              <td><input type="radio" name="q24_8" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">下面的每一个问题都提供了两个完全相反的答案。请指出你对两个答案的认可程度
        （1=完全认同第一个答案，7=完全认同第二个答案）</label>
      <div class="col-md-8">
        <div class="row" style="padding:0 15px">
          <table class="table table-condensed">

            <tr>
              <td colspan="9">在我生活的社会环境中，一个人的影响力主要取决于</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">能力和对社会的贡献</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">权威地位</th>
            </tr>
            <tr>

              <td><input type="radio" name="q25_1" value="1" required></td>
              <td><input type="radio" name="q25_1" value="2"></td>
              <td><input type="radio" name="q25_1" value="3"></td>
              <td><input type="radio" name="q25_1" value="4"></td>
              <td><input type="radio" name="q25_1" value="5"></td>
              <td><input type="radio" name="q25_1" value="6"></td>
              <td><input type="radio" name="q25_1" value="7"></td>

            </tr>

            <tr>
              <td colspan="9">在我生活的社会环境中，下属应该</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">在有分歧时质疑领导</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">服从领导无需质疑</th>
            </tr>
            <tr>

              <td><input type="radio" name="q25_2" value="1" required></td>
              <td><input type="radio" name="q25_2" value="2"></td>
              <td><input type="radio" name="q25_2" value="3"></td>
              <td><input type="radio" name="q25_2" value="4"></td>
              <td><input type="radio" name="q25_2" value="5"></td>
              <td><input type="radio" name="q25_2" value="6"></td>
              <td><input type="radio" name="q25_2" value="7"></td>

            </tr>
            <tr>
              <td colspan="9">在我生活的社会环境中，权力</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">在整个社会中高度分散</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">完全集中在高层</th>
            </tr>
            <tr>

              <td><input type="radio" name="q25_3" value="1" required></td>
              <td><input type="radio" name="q25_3" value="2"></td>
              <td><input type="radio" name="q25_3" value="3"></td>
              <td><input type="radio" name="q25_3" value="4"></td>
              <td><input type="radio" name="q25_3" value="5"></td>
              <td><input type="radio" name="q25_3" value="6"></td>
              <td><input type="radio" name="q25_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="9">在我生活的社会环境中，人们获得的回报主要是基于</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">除绩效表现外其他因素,如资历</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">只有绩效表现</th>
            </tr>
            <tr>

              <td><input type="radio" name="q25_4" value="1" required></td>
              <td><input type="radio" name="q25_4" value="2"></td>
              <td><input type="radio" name="q25_4" value="3"></td>
              <td><input type="radio" name="q25_4" value="4"></td>
              <td><input type="radio" name="q25_4" value="5"></td>
              <td><input type="radio" name="q25_4" value="6"></td>
              <td><input type="radio" name="q25_4" value="7"></td>

            </tr>
            <tr>
              <td colspan="9">在我生活的社会环境中，通过创新来提高绩效被认为是</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">不值得的</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">高度鼓励的</th>
            </tr>
            <tr>

              <td><input type="radio" name="q25_5" value="1" required></td>
              <td><input type="radio" name="q25_5" value="2"></td>
              <td><input type="radio" name="q25_5" value="3"></td>
              <td><input type="radio" name="q25_5" value="4"></td>
              <td><input type="radio" name="q25_5" value="5"></td>
              <td><input type="radio" name="q25_5" value="6"></td>
              <td><input type="radio" name="q25_5" value="7"></td>

            </tr>


          </table>
        </div>
      </div>
    </div>
    <input type="hidden" name="part" id="part" value="4">
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
