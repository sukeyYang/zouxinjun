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
  <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">

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

    <div class="row bs-wizard">

      <div class="col-xs-4 bs-wizard-step disabled">
        <div class="text-center bs-wizard-stepnum">步骤 6</div>
        <div class="progress">
          <div class="progress-bar"></div>
        </div>
        <a href="javascript:void(0)" class="bs-wizard-dot"></a>
        <div class="bs-wizard-info text-center">你的企业</div>
      </div>

      <div class="col-xs-4 bs-wizard-step active">
        <div class="text-center bs-wizard-stepnum">步骤 7</div>
        <div class="progress">
          <div class="progress-bar"></div>
        </div>
        <a href="javascript:void(0)" class="bs-wizard-dot"></a>
        <div class="bs-wizard-info text-center">你父母的企业</div>
      </div>

      <div class="col-xs-4 bs-wizard-step disabled">
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
        <label class="col-md-2 control-label">企业创立的年份</label>
        <div class="input-group date form_date col-md-4" data-date="2016"
             data-date-format="yyyy" data-link-format="yyyy" style="padding: 0 15px;">
          <input class="form-control" size="16" name="q59" id="q59" type="text" readonly>
        <span class="input-group-addon"><span
          class="glyphicon glyphicon-remove"></span></span>
        <span class="input-group-addon"><span
          class="glyphicon glyphicon-calendar"></span></span>
        </div>
      </div>

      <div class="form-group">
        <label for="inputQ60"
               class="col-md-2 control-label">企业目前拥有的全职员工数量（请填写数字）</label>
        <div class="col-md-4">
          <input type="number" name="q60" required class="form-control"
                 id="inputQ60">
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">你的父亲或母亲是否在实际运营这家企业</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" required name="q61" value="1"> 是
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q61" value="2"> 否
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">你的家庭所拥有的所有权比例是</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" required name="q62" value="1"> 0%
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q62" value="2"> 1-25%
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q62" value="3"> 26-50%
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q62" value="4"> 51-99%
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q62" value="5"> 100%
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">你在这家企业中拥有的所有权比例是</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" required name="q63" value="1"> 0%
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q63" value="2"> 1-25%
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q63" value="3"> 26-50%
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q63" value="4"> 51-99%
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q63" value="5"> 100%
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">你是否认为这家企业是家族企业</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" required name="q64" value="1"> 是
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q64" value="2"> 否
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">你父母的企业所处的行业是？（请选择最为贴切的一项）</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" required name="q65" value="1"> 广告/设计/营销
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="2"> 建筑设计和工程
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="3"> 建筑工程 （施工建设）
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="4">
                咨询（人力资源，法律，管理，税收方面的咨询服务）
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="5"> 教育和培训
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="6">
                金融服务（包括银行业，保险业，投资，房地产等）
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="7"> 人类健康和社会服务
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="8"> 信息技术
                （IT）和通信（包括软件和IT服务）
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="9"> 制造业
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="10"> 旅游和休闲行业
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="11"> 贸易（批发和零售）
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="12"> 其他服务（如交通运输等）
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q65" value="13"> 其他
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">你是否曾经在你父母的企业中工作</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" required name="q66" value="1"> 是
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q66" value="2"> 否
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">你共有多少个兄弟姐妹</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" required name="q67" id="partner" value="1">
                0
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q67" class="flag" value="2"> 1
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q67" class="flag" value="3"> 2
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q67" class="flag" value="4"> 3
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q67" class="flag" value="5"> 4个或更多
              </label>
            </div>
          </div>
        </div>
      </div>


      <div class="form-group" id="q67_sub">
        <label class="col-md-2 control-label">其中，有多少位兄弟姐妹比你年长</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" id="q68"  name="q68" value="1"> 0
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q68" value="2"> 1
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q68" value="3"> 2
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q68" value="4"> 3
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q68" value="5"> 4个或更多
              </label>
            </div>
          </div>
        </div>
      </div>


      <div class="form-group">
        <label class="col-md-2 control-label">关于作为接班人的思考，请指出你对下列描述的认可程度（1=完全不同意，7=完全同意）</label>
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
                <td colspan="7">为接管我父母的公司，我愿意做任何事情</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_1" value="1" required></td>
                <td><input type="radio" name="q69_1" value="2"></td>
                <td><input type="radio" name="q69_1" value="3"></td>
                <td><input type="radio" name="q69_1" value="4"></td>
                <td><input type="radio" name="q69_1" value="5"></td>
                <td><input type="radio" name="q69_1" value="6"></td>
                <td><input type="radio" name="q69_1" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">我的职业目标就是成为父母公司的接班人</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_2" value="1" required></td>
                <td><input type="radio" name="q69_2" value="2"></td>
                <td><input type="radio" name="q69_2" value="3"></td>
                <td><input type="radio" name="q69_2" value="4"></td>
                <td><input type="radio" name="q69_2" value="5"></td>
                <td><input type="radio" name="q69_2" value="6"></td>
                <td><input type="radio" name="q69_2" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">我将尽一切努力成为父母公司的接班人</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_3" value="1" required></td>
                <td><input type="radio" name="q69_3" value="2"></td>
                <td><input type="radio" name="q69_3" value="3"></td>
                <td><input type="radio" name="q69_3" value="4"></td>
                <td><input type="radio" name="q69_3" value="5"></td>
                <td><input type="radio" name="q69_3" value="6"></td>
                <td><input type="radio" name="q69_3" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">我下定决心要在将来成为父母公司的接班人</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_4" value="1" required></td>
                <td><input type="radio" name="q69_4" value="2"></td>
                <td><input type="radio" name="q69_4" value="3"></td>
                <td><input type="radio" name="q69_4" value="4"></td>
                <td><input type="radio" name="q69_4" value="5"></td>
                <td><input type="radio" name="q69_4" value="6"></td>
                <td><input type="radio" name="q69_4" value="7"></td>
              </tr>

              <tr>
                <td colspan="7">我非常认真地考虑过要接管我父母的公司</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_5" value="1" required></td>
                <td><input type="radio" name="q69_5" value="2"></td>
                <td><input type="radio" name="q69_5" value="3"></td>
                <td><input type="radio" name="q69_5" value="4"></td>
                <td><input type="radio" name="q69_5" value="5"></td>
                <td><input type="radio" name="q69_5" value="6"></td>
                <td><input type="radio" name="q69_5" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">我有接管父母公司的强烈意愿</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_6" value="1" required></td>
                <td><input type="radio" name="q69_6" value="2"></td>
                <td><input type="radio" name="q69_6" value="3"></td>
                <td><input type="radio" name="q69_6" value="4"></td>
                <td><input type="radio" name="q69_6" value="5"></td>
                <td><input type="radio" name="q69_6" value="6"></td>
                <td><input type="radio" name="q69_6" value="7"></td>
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
                <td colspan="7">对我而言，接管父母的公司带来的优势大于劣势</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_7" value="1" required></td>
                <td><input type="radio" name="q69_7" value="2"></td>
                <td><input type="radio" name="q69_7" value="3"></td>
                <td><input type="radio" name="q69_7" value="4"></td>
                <td><input type="radio" name="q69_7" value="5"></td>
                <td><input type="radio" name="q69_7" value="6"></td>
                <td><input type="radio" name="q69_7" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">成为父母公司的接班人对我来说很有吸引力</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_8" value="1" required></td>
                <td><input type="radio" name="q69_8" value="2"></td>
                <td><input type="radio" name="q69_8" value="3"></td>
                <td><input type="radio" name="q69_8" value="4"></td>
                <td><input type="radio" name="q69_8" value="5"></td>
                <td><input type="radio" name="q69_8" value="6"></td>
                <td><input type="radio" name="q69_8" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">如果我有机会和资源，我将成为父母公司的接班人</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_9" value="1" required></td>
                <td><input type="radio" name="q69_9" value="2"></td>
                <td><input type="radio" name="q69_9" value="3"></td>
                <td><input type="radio" name="q69_9" value="4"></td>
                <td><input type="radio" name="q69_9" value="5"></td>
                <td><input type="radio" name="q69_9" value="6"></td>
                <td><input type="radio" name="q69_9" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">成为父母公司的接班人能够给我带来极大的满足感</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_10" value="1" required></td>
                <td><input type="radio" name="q69_10" value="2"></td>
                <td><input type="radio" name="q69_10" value="3"></td>
                <td><input type="radio" name="q69_10" value="4"></td>
                <td><input type="radio" name="q69_10" value="5"></td>
                <td><input type="radio" name="q69_10" value="6"></td>
                <td><input type="radio" name="q69_10" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">在各种各样的选择中，我宁愿成为父母公司的接班人</td>
              </tr>
              <tr>
                <td><input type="radio" name="q69_11" value="1" required></td>
                <td><input type="radio" name="q69_11" value="2"></td>
                <td><input type="radio" name="q69_11" value="3"></td>
                <td><input type="radio" name="q69_11" value="4"></td>
                <td><input type="radio" name="q69_11" value="5"></td>
                <td><input type="radio" name="q69_11" value="6"></td>
                <td><input type="radio" name="q69_11" value="7"></td>
              </tr>


            </table>
          </div>
        </div>
      </div>


      <div class="form-group">
        <label class="col-md-2 control-label">如果你进选择成为父母公司的接班人，你周围环境中的人将如何反应（1=非常负面的反应，7=非常积极的反应）</label>
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
                <td colspan="7">你的父母</td>
              </tr>
              <tr>
                <td><input type="radio" name="q70_1" value="1" required></td>
                <td><input type="radio" name="q70_1" value="2"></td>
                <td><input type="radio" name="q70_1" value="3"></td>
                <td><input type="radio" name="q70_1" value="4"></td>
                <td><input type="radio" name="q70_1" value="5"></td>
                <td><input type="radio" name="q70_1" value="6"></td>
                <td><input type="radio" name="q70_1" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">亲密的家庭成员（如，兄弟姐妹）</td>
              </tr>
              <tr>
                <td><input type="radio" name="q70_2" value="1" required></td>
                <td><input type="radio" name="q70_2" value="2"></td>
                <td><input type="radio" name="q70_2" value="3"></td>
                <td><input type="radio" name="q70_2" value="4"></td>
                <td><input type="radio" name="q70_2" value="5"></td>
                <td><input type="radio" name="q70_2" value="6"></td>
                <td><input type="radio" name="q70_2" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">其他家庭成员（如，叔叔或阿姨）</td>
              </tr>
              <tr>
                <td><input type="radio" name="q70_3" value="1" required></td>
                <td><input type="radio" name="q70_3" value="2"></td>
                <td><input type="radio" name="q70_3" value="3"></td>
                <td><input type="radio" name="q70_3" value="4"></td>
                <td><input type="radio" name="q70_3" value="5"></td>
                <td><input type="radio" name="q70_3" value="6"></td>
                <td><input type="radio" name="q70_3" value="7"></td>
              </tr>

            </table>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">如果你打算接手父母的公司，你将会在几年内完成接管</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q71" value="1" required> 1年内
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q71" value="2"> 2-5 年
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q71" value="3"> 超过5年
              </label>
            </div>

          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">假设你的两个兄弟姐妹在竞争公司内的同一个职位。你如何评估以下解决方案的公平性（1
          =不公平，7 =非常公平）</label>
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
                <td colspan="7">更能胜任这份工作的人得到该职位</td>
              </tr>
              <tr>
                <td><input type="radio" name="q72_1" value="1" required></td>
                <td><input type="radio" name="q72_1" value="2"></td>
                <td><input type="radio" name="q72_1" value="3"></td>
                <td><input type="radio" name="q72_1" value="4"></td>
                <td><input type="radio" name="q72_1" value="5"></td>
                <td><input type="radio" name="q72_1" value="6"></td>
                <td><input type="radio" name="q72_1" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">两个人共同分享该职位</td>
              </tr>
              <tr>
                <td><input type="radio" name="q72_2" value="1" required></td>
                <td><input type="radio" name="q72_2" value="2"></td>
                <td><input type="radio" name="q72_2" value="3"></td>
                <td><input type="radio" name="q72_2" value="4"></td>
                <td><input type="radio" name="q72_2" value="5"></td>
                <td><input type="radio" name="q72_2" value="6"></td>
                <td><input type="radio" name="q72_2" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">不具有胜任能力，但在其他地方找不到工作的人得到该职位</td>
              </tr>
              <tr>
                <td><input type="radio" name="q72_3" value="1" required></td>
                <td><input type="radio" name="q72_3" value="2"></td>
                <td><input type="radio" name="q72_3" value="3"></td>
                <td><input type="radio" name="q72_3" value="4"></td>
                <td><input type="radio" name="q72_3" value="5"></td>
                <td><input type="radio" name="q72_3" value="6"></td>
                <td><input type="radio" name="q72_3" value="7"></td>
              </tr>

            </table>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">假设你有一个非常称职的兄妹在父母的公司内工作，还有一名刚刚失业的兄妹在家中协助处理家庭事务。请指出你对下列关于接班描述的认可程度（1=完全不同意，7=完全同意）</label>
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
                <td colspan="7">所有的兄弟姐妹都应该得到相同的企业所有权份额</td>
              </tr>
              <tr>
                <td><input type="radio" name="q73_1" value="1" required></td>
                <td><input type="radio" name="q73_1" value="2"></td>
                <td><input type="radio" name="q73_1" value="3"></td>
                <td><input type="radio" name="q73_1" value="4"></td>
                <td><input type="radio" name="q73_1" value="5"></td>
                <td><input type="radio" name="q73_1" value="6"></td>
                <td><input type="radio" name="q73_1" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">有些兄弟姐妹可以获得更高的所有权份额，但应对获得较少所有权份额的人进行经济补偿</td>
              </tr>
              <tr>
                <td><input type="radio" name="q73_2" value="1" required></td>
                <td><input type="radio" name="q73_2" value="2"></td>
                <td><input type="radio" name="q73_2" value="3"></td>
                <td><input type="radio" name="q73_2" value="4"></td>
                <td><input type="radio" name="q73_2" value="5"></td>
                <td><input type="radio" name="q73_2" value="6"></td>
                <td><input type="radio" name="q73_2" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">当一个兄弟姐妹对公司的贡献更大时，她/他应该获得更高的所有权份额</td>
              </tr>
              <tr>
                <td><input type="radio" name="q73_3" value="1" required></td>
                <td><input type="radio" name="q73_3" value="2"></td>
                <td><input type="radio" name="q73_3" value="3"></td>
                <td><input type="radio" name="q73_3" value="4"></td>
                <td><input type="radio" name="q73_3" value="5"></td>
                <td><input type="radio" name="q73_3" value="6"></td>
                <td><input type="radio" name="q73_3" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">当一个兄弟姐妹对家庭的贡献更大时，她/他应该获得更高的所有权份额</td>
              </tr>
              <tr>
                <td><input type="radio" name="q73_4" value="1" required></td>
                <td><input type="radio" name="q73_4" value="2"></td>
                <td><input type="radio" name="q73_4" value="3"></td>
                <td><input type="radio" name="q73_4" value="4"></td>
                <td><input type="radio" name="q73_4" value="5"></td>
                <td><input type="radio" name="q73_4" value="6"></td>
                <td><input type="radio" name="q73_4" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">处境不太好的兄弟姐妹应该获得较高的所有权份额</td>
              </tr>
              <tr>
                <td><input type="radio" name="q73_5" value="1" required></td>
                <td><input type="radio" name="q73_5" value="2"></td>
                <td><input type="radio" name="q73_5" value="3"></td>
                <td><input type="radio" name="q73_5" value="4"></td>
                <td><input type="radio" name="q73_5" value="5"></td>
                <td><input type="radio" name="q73_5" value="6"></td>
                <td><input type="radio" name="q73_5" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">所有家庭成员的财务安全是最重要的</td>
              </tr>
              <tr>
                <td><input type="radio" name="q73_6" value="1" required></td>
                <td><input type="radio" name="q73_6" value="2"></td>
                <td><input type="radio" name="q73_6" value="3"></td>
                <td><input type="radio" name="q73_6" value="4"></td>
                <td><input type="radio" name="q73_6" value="5"></td>
                <td><input type="radio" name="q73_6" value="6"></td>
                <td><input type="radio" name="q73_6" value="7"></td>
              </tr>

            </table>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">下列关于接班的目标哪一个对你比较重要</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q74" value="1" required> 保持家庭和睦
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q74" value="2"> 保持公司长期的生存能力
              </label>
            </div>
          </div>
        </div>
      </div>


      <div class="form-group">
        <label class="col-md-2 control-label">在过去三年中，与竞争者相比，你认为父母公司的业绩表现如何（1=差得多，7=好得多）</label>
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
                <td colspan="7">销售增长</td>
              </tr>
              <tr>
                <td><input type="radio" name="q75_1" value="1" required></td>
                <td><input type="radio" name="q75_1" value="2"></td>
                <td><input type="radio" name="q75_1" value="3"></td>
                <td><input type="radio" name="q75_1" value="4"></td>
                <td><input type="radio" name="q75_1" value="5"></td>
                <td><input type="radio" name="q75_1" value="6"></td>
                <td><input type="radio" name="q75_1" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">市场份额增长</td>
              </tr>
              <tr>
                <td><input type="radio" name="q75_2" value="1" required></td>
                <td><input type="radio" name="q75_2" value="2"></td>
                <td><input type="radio" name="q75_2" value="3"></td>
                <td><input type="radio" name="q75_2" value="4"></td>
                <td><input type="radio" name="q75_2" value="5"></td>
                <td><input type="radio" name="q75_2" value="6"></td>
                <td><input type="radio" name="q75_2" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">利润增长</td>
              </tr>
              <tr>
                <td><input type="radio" name="q75_3" value="1" required></td>
                <td><input type="radio" name="q75_3" value="2"></td>
                <td><input type="radio" name="q75_3" value="3"></td>
                <td><input type="radio" name="q75_3" value="4"></td>
                <td><input type="radio" name="q75_3" value="5"></td>
                <td><input type="radio" name="q75_3" value="6"></td>
                <td><input type="radio" name="q75_3" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">创造就业岗位</td>
              </tr>
              <tr>
                <td><input type="radio" name="q75_4" value="1" required></td>
                <td><input type="radio" name="q75_4" value="2"></td>
                <td><input type="radio" name="q75_4" value="3"></td>
                <td><input type="radio" name="q75_4" value="4"></td>
                <td><input type="radio" name="q75_4" value="5"></td>
                <td><input type="radio" name="q75_4" value="6"></td>
                <td><input type="radio" name="q75_4" value="7"></td>
              </tr>
              <tr>
                <td colspan="7">创新</td>
              </tr>
              <tr>
                <td><input type="radio" name="q75_5" value="1" required></td>
                <td><input type="radio" name="q75_5" value="2"></td>
                <td><input type="radio" name="q75_5" value="3"></td>
                <td><input type="radio" name="q75_5" value="4"></td>
                <td><input type="radio" name="q75_5" value="5"></td>
                <td><input type="radio" name="q75_5" value="6"></td>
                <td><input type="radio" name="q75_5" value="7"></td>
              </tr>
            </table>
          </div>
        </div>
      </div>

      <input type="hidden" name="part" id="part" value="7">
      <hr>

      <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
          <button type="submit" class="btn btn-primary btn-lg">下一步</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>

<script src="<%=basePath%>js/bootstrapValidator.min.js"></script>

<!--<script src="js/bootstrap-tagsinput.min.js"></script>-->

<script type="text/javascript"
        src="<%=basePath%>js/bootstrap-datetimepicker.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8"></script>

<script type="text/javascript">

  $('.form_date').datetimepicker({
    language: 'zh-CN',
    weekStart: 1,
    format: 'yyyy',
    todayBtn: 0,
    autoclose: 1,
    startDate: new Date('1980-01-01'),
    endDate: new Date('2016-12-31'),
    todayHighlight: 1,
    startView: 4,
    minView: 4,
    forceParse: 0
  });

  $(function () {
    $(".flag").bind("click", function () {
      $("#q67_sub").show();
      $("#q68").attr("required","true");
    });

    $("#partner").bind("click", function () {
      $("#q67_sub").hide();
      $("#q68").removeAttr("required");
    });
  });

  function validateForm() {
     if ($("#q59").val() == '') {
       $("#q59").closest(".form-group").addClass("has-error");
       $("html,body").animate({scrollTop: $("#q59").closest(".form-group").offset().top - 20});
       return false;
     }

     return true;


   }

</script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript"></script>
<script type="text/javascript">
  var Title = "【红包@你】全球大学创业精神中国调查";
  var Desc = "有趣，教你如何高大上的获取红包，全球大学创业精神中国调查|Global University Entrepreneurial Spirit Students' Survey in China";
  var imageUrl = "<%=basePath%>images/redpack.jpg";
</script>
<script src="<%=basePath %>js/weixin-js-config.js"></script>

</body>
</html>
