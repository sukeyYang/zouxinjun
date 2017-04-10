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

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 5</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你的计划</div>
    </div>

    <div class="col-xs-4 bs-wizard-step active">
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
  </div>

  <form class="form-horizontal" id="survey" method="post"
        action="<%= basePath%>save_answer" onsubmit="return validateForm()">

    <div class="form-group">
      <label class="col-md-2 control-label">你的企业是在哪年创立的：</label>
      <div class="col-md-8">
        <div class="row">
          <div class="input-group date form_date col-md-4" data-date="2016" data-date-format="yyyy" data-link-format="yyyy" style="padding: 0 15px;">
            <input class="form-control" size="16" name="q40" id="q40" type="text" value="" readonly>
            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
          </div>
        </div>
      </div>
    </div>



    <div class="form-group">
      <label for="inputQ40"
             class="col-md-2 control-label">企业目前拥有的全职员工数量（请填写数字）</label>
      <div class="col-md-4">
        <input type="number" name="q41" class="form-control" id="inputQ40"
               required>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你在企业所有权中的占比是</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q42" value="1" required> 0-25%
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q42" value="2"> 26-50%
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q42" value="3"> 51-75%
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q42" value="4"> 76-99%
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q42" value="5"> 100%
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你是否希望这家企业成为你毕业后的主要职业</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q43" value="1" required> 是
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q43" value="2"> 否
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">对企业拥有所有权的人有（）个</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q44" id="partner" value="1" required> 0
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q44" class="flag" value="2"> 1
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q44" class="flag" value="3"> 2
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q44" class="flag" value="4"> 3
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q44" class="flag" value="5"> >3
            </label>
          </div>
        </div>
      </div>
    </div>


    <div class="form-group">
      <label class="col-md-2 control-label">你创立的企业所处的行业是？（请选择最为贴切的一项）</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="1" required> 广告/设计/营销
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="2"> 建筑设计和工程
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="3"> 建筑工程 （施工建设）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="4"> 咨询（人力资源，法律，管理，税收方面的咨询服务）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="5"> 教育和培训
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="6"> 金融服务（包括银行业，保险业，投资，房地产等）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="7"> 人类健康和社会服务
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="8"> 信息技术 （IT）和通信（包括软件和IT服务）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="9"> 制造业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="10"> 旅游和休闲行业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="11"> 贸易（批发和零售）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="12"> 其他服务（如交通运输等）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q45" value="13"> 其他
            </label>
          </div>
        </div>
      </div>
    </div>


    <div class="form-group">
      <label class="col-md-2 control-label">请指出拟对下列描述的认可程度（1=完全不同意，7=完全同意）。我创立企业是为了……</label>
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
              <td colspan="7">赚取金钱，变得富有</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_1" value="1" required></td>
              <td><input type="radio" name="q46_1" value="2"></td>
              <td><input type="radio" name="q46_1" value="3"></td>
              <td><input type="radio" name="q46_1" value="4"></td>
              <td><input type="radio" name="q46_1" value="5"></td>
              <td><input type="radio" name="q46_1" value="6"></td>
              <td><input type="radio" name="q46_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">取得经济上的成功</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_2" value="1" required></td>
              <td><input type="radio" name="q46_2" value="2"></td>
              <td><input type="radio" name="q46_2" value="3"></td>
              <td><input type="radio" name="q46_2" value="4"></td>
              <td><input type="radio" name="q46_2" value="5"></td>
              <td><input type="radio" name="q46_2" value="6"></td>
              <td><input type="radio" name="q46_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在商业环境中推进我的事业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_3" value="1" required></td>
              <td><input type="radio" name="q46_3" value="2"></td>
              <td><input type="radio" name="q46_3" value="3"></td>
              <td><input type="radio" name="q46_3" value="4"></td>
              <td><input type="radio" name="q46_3" value="5"></td>
              <td><input type="radio" name="q46_3" value="6"></td>
              <td><input type="radio" name="q46_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">向人们展示我的能力（对未来的雇员和同事）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_4" value="1" required></td>
              <td><input type="radio" name="q46_4" value="2"></td>
              <td><input type="radio" name="q46_4" value="3"></td>
              <td><input type="radio" name="q46_4" value="4"></td>
              <td><input type="radio" name="q46_4" value="5"></td>
              <td><input type="radio" name="q46_4" value="6"></td>
              <td><input type="radio" name="q46_4" value="7"></td>
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
              <td colspan="7">解决我强烈认同的一群人所面临的具体问题（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_5" value="1" required></td>
              <td><input type="radio" name="q46_5" value="2"></td>
              <td><input type="radio" name="q46_5" value="3"></td>
              <td><input type="radio" name="q46_5" value="4"></td>
              <td><input type="radio" name="q46_5" value="5"></td>
              <td><input type="radio" name="q46_5" value="6"></td>
              <td><input type="radio" name="q46_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在改变我强烈认同的一群人的行动中发挥积极作用（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_6" value="1" required></td>
              <td><input type="radio" name="q46_6" value="2"></td>
              <td><input type="radio" name="q46_6" value="3"></td>
              <td><input type="radio" name="q46_6" value="4"></td>
              <td><input type="radio" name="q46_6" value="5"></td>
              <td><input type="radio" name="q46_6" value="6"></td>
              <td><input type="radio" name="q46_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">解决私人企业通常无法解决的社会问题（例如，社会不公正，环境保护）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_7" value="1" required></td>
              <td><input type="radio" name="q46_7" value="2"></td>
              <td><input type="radio" name="q46_7" value="3"></td>
              <td><input type="radio" name="q46_7" value="4"></td>
              <td><input type="radio" name="q46_7" value="5"></td>
              <td><input type="radio" name="q46_7" value="6"></td>
              <td><input type="radio" name="q46_7" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">践行我自己的核心价值观</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_8" value="1" required></td>
              <td><input type="radio" name="q46_8" value="2"></td>
              <td><input type="radio" name="q46_8" value="3"></td>
              <td><input type="radio" name="q46_8" value="4"></td>
              <td><input type="radio" name="q46_8" value="5"></td>
              <td><input type="radio" name="q46_8" value="6"></td>
              <td><input type="radio" name="q46_8" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在改变世界的运行方式中发挥积极作用</td>
            </tr>
            <tr>
              <td><input type="radio" name="q46_9" value="1" required></td>
              <td><input type="radio" name="q46_9" value="2"></td>
              <td><input type="radio" name="q46_9" value="3"></td>
              <td><input type="radio" name="q46_9" value="4"></td>
              <td><input type="radio" name="q46_9" value="5"></td>
              <td><input type="radio" name="q46_9" value="6"></td>
              <td><input type="radio" name="q46_9" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">作为公司的创立者，……对我来说非常重要
        （1=非常不同意，7=非常同意）</label>
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
              <td colspan="7">在坚实的管理实践的基础上运行我的企业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q47_1" value="1" required></td>
              <td><input type="radio" name="q47_1" value="2"></td>
              <td><input type="radio" name="q47_1" value="3"></td>
              <td><input type="radio" name="q47_1" value="4"></td>
              <td><input type="radio" name="q47_1" value="5"></td>
              <td><input type="radio" name="q47_1" value="6"></td>
              <td><input type="radio" name="q47_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">细致地分析公司的财务前景</td>
            </tr>
            <tr>
              <td><input type="radio" name="q47_2" value="1" required></td>
              <td><input type="radio" name="q47_2" value="2"></td>
              <td><input type="radio" name="q47_2" value="3"></td>
              <td><input type="radio" name="q47_2" value="4"></td>
              <td><input type="radio" name="q47_2" value="5"></td>
              <td><input type="radio" name="q47_2" value="6"></td>
              <td><input type="radio" name="q47_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">为我强烈认同的一群人提供有用的产品或服务（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q47_3" value="1" required></td>
              <td><input type="radio" name="q47_3" value="2"></td>
              <td><input type="radio" name="q47_3" value="3"></td>
              <td><input type="radio" name="q47_3" value="4"></td>
              <td><input type="radio" name="q47_3" value="5"></td>
              <td><input type="radio" name="q47_3" value="6"></td>
              <td><input type="radio" name="q47_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">向我的客户传达我想要满足他们的需求而不仅仅是做生意</td>
            </tr>
            <tr>
              <td><input type="radio" name="q47_4" value="1" required></td>
              <td><input type="radio" name="q47_4" value="2"></td>
              <td><input type="radio" name="q47_4" value="3"></td>
              <td><input type="radio" name="q47_4" value="4"></td>
              <td><input type="radio" name="q47_4" value="5"></td>
              <td><input type="radio" name="q47_4" value="6"></td>
              <td><input type="radio" name="q47_4" value="7"></td>
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
              <td colspan="7">向我的客户传达我从根本上关注他们的观点，兴趣和价值观</td>
            </tr>
            <tr>
              <td><input type="radio" name="q47_5" value="1" required></td>
              <td><input type="radio" name="q47_5" value="2"></td>
              <td><input type="radio" name="q47_5" value="3"></td>
              <td><input type="radio" name="q47_5" value="4"></td>
              <td><input type="radio" name="q47_5" value="5"></td>
              <td><input type="radio" name="q47_5" value="6"></td>
              <td><input type="radio" name="q47_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">真诚地为我强烈认同的一群人提供服务（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q47_6" value="1" required></td>
              <td><input type="radio" name="q47_6" value="2"></td>
              <td><input type="radio" name="q47_6" value="3"></td>
              <td><input type="radio" name="q47_6" value="4"></td>
              <td><input type="radio" name="q47_6" value="5"></td>
              <td><input type="radio" name="q47_6" value="6"></td>
              <td><input type="radio" name="q47_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">做一个有高度责任感的公民</td>
            </tr>
            <tr>
              <td><input type="radio" name="q47_7" value="1" required></td>
              <td><input type="radio" name="q47_7" value="2"></td>
              <td><input type="radio" name="q47_7" value="3"></td>
              <td><input type="radio" name="q47_7" value="4"></td>
              <td><input type="radio" name="q47_7" value="5"></td>
              <td><input type="radio" name="q47_7" value="6"></td>
              <td><input type="radio" name="q47_7" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">是世界变得更好（例如，追求社会公正，环境保护）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q47_8" value="1" required></td>
              <td><input type="radio" name="q47_8" value="2"></td>
              <td><input type="radio" name="q47_8" value="3"></td>
              <td><input type="radio" name="q47_8" value="4"></td>
              <td><input type="radio" name="q47_8" value="5"></td>
              <td><input type="radio" name="q47_8" value="6"></td>
              <td><input type="radio" name="q47_8" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label
        class="col-md-2 control-label">在管理我的企业时，……对我非常重要（1=非常不同意，7=非常同意）</label>
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
              <td colspan="7">聚焦于企业能够在竞争中获得的价值</td>
            </tr>
            <tr>
              <td><input type="radio" name="q48_1" value="1" required></td>
              <td><input type="radio" name="q48_1" value="2"></td>
              <td><input type="radio" name="q48_1" value="3"></td>
              <td><input type="radio" name="q48_1" value="4"></td>
              <td><input type="radio" name="q48_1" value="5"></td>
              <td><input type="radio" name="q48_1" value="6"></td>
              <td><input type="radio" name="q48_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">建立强大的竞争优势，超过我的竞争者</td>
            </tr>
            <tr>
              <td><input type="radio" name="q48_2" value="1" required></td>
              <td><input type="radio" name="q48_2" value="2"></td>
              <td><input type="radio" name="q48_2" value="3"></td>
              <td><input type="radio" name="q48_2" value="4"></td>
              <td><input type="radio" name="q48_2" value="5"></td>
              <td><input type="radio" name="q48_2" value="6"></td>
              <td><input type="radio" name="q48_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">聚焦于我强烈认同的一群人（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q48_3" value="1" required></td>
              <td><input type="radio" name="q48_3" value="2"></td>
              <td><input type="radio" name="q48_3" value="3"></td>
              <td><input type="radio" name="q48_3" value="4"></td>
              <td><input type="radio" name="q48_3" value="5"></td>
              <td><input type="radio" name="q48_3" value="6"></td>
              <td><input type="radio" name="q48_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">支持和推动我强烈认同的一群人</td>
            </tr>
            <tr>
              <td><input type="radio" name="q48_4" value="1" required></td>
              <td><input type="radio" name="q48_4" value="2"></td>
              <td><input type="radio" name="q48_4" value="3"></td>
              <td><input type="radio" name="q48_4" value="4"></td>
              <td><input type="radio" name="q48_4" value="5"></td>
              <td><input type="radio" name="q48_4" value="6"></td>
              <td><input type="radio" name="q48_4" value="7"></td>
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
              <td colspan="7">聚焦于公司能够为社会做的贡献</td>
            </tr>
            <tr>
              <td><input type="radio" name="q48_5" value="1" required></td>
              <td><input type="radio" name="q48_5" value="2"></td>
              <td><input type="radio" name="q48_5" value="3"></td>
              <td><input type="radio" name="q48_5" value="4"></td>
              <td><input type="radio" name="q48_5" value="5"></td>
              <td><input type="radio" name="q48_5" value="6"></td>
              <td><input type="radio" name="q48_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">使他人相信，私人企业有能力解决我的企业正在应对的社会挑战（例如，社会公正，环境保护）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q48_6" value="1" required></td>
              <td><input type="radio" name="q48_6" value="2"></td>
              <td><input type="radio" name="q48_6" value="3"></td>
              <td><input type="radio" name="q48_6" value="4"></td>
              <td><input type="radio" name="q48_6" value="5"></td>
              <td><input type="radio" name="q48_6" value="6"></td>
              <td><input type="radio" name="q48_6" value="7"></td>
            </tr>

          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label
        class="col-md-2 control-label">下列目标对你在企业中进行创新的重要性是（1=完全不重要，7=非常重要）</label>
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
              <td colspan="7">介绍新产品或服务</td>
            </tr>
            <tr>
              <td><input type="radio" name="q49_1" value="1" required></td>
              <td><input type="radio" name="q49_1" value="2"></td>
              <td><input type="radio" name="q49_1" value="3"></td>
              <td><input type="radio" name="q49_1" value="4"></td>
              <td><input type="radio" name="q49_1" value="5"></td>
              <td><input type="radio" name="q49_1" value="6"></td>
              <td><input type="radio" name="q49_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">拓展产品/服务范围</td>
            </tr>
            <tr>
              <td><input type="radio" name="q49_2" value="1" required></td>
              <td><input type="radio" name="q49_2" value="2"></td>
              <td><input type="radio" name="q49_2" value="3"></td>
              <td><input type="radio" name="q49_2" value="4"></td>
              <td><input type="radio" name="q49_2" value="5"></td>
              <td><input type="radio" name="q49_2" value="6"></td>
              <td><input type="radio" name="q49_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">开拓新市场</td>
            </tr>
            <tr>
              <td><input type="radio" name="q49_3" value="1" required></td>
              <td><input type="radio" name="q49_3" value="2"></td>
              <td><input type="radio" name="q49_3" value="3"></td>
              <td><input type="radio" name="q49_3" value="4"></td>
              <td><input type="radio" name="q49_3" value="5"></td>
              <td><input type="radio" name="q49_3" value="6"></td>
              <td><input type="radio" name="q49_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">进入新的技术领域</td>
            </tr>
            <tr>
              <td><input type="radio" name="q49_4" value="1" required></td>
              <td><input type="radio" name="q49_4" value="2"></td>
              <td><input type="radio" name="q49_4" value="3"></td>
              <td><input type="radio" name="q49_4" value="4"></td>
              <td><input type="radio" name="q49_4" value="5"></td>
              <td><input type="radio" name="q49_4" value="6"></td>
              <td><input type="radio" name="q49_4" value="7"></td>
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
              <td colspan="7">改善已有的产品/服务质量</td>
            </tr>
            <tr>
              <td><input type="radio" name="q49_5" value="1" required></td>
              <td><input type="radio" name="q49_5" value="2"></td>
              <td><input type="radio" name="q49_5" value="3"></td>
              <td><input type="radio" name="q49_5" value="4"></td>
              <td><input type="radio" name="q49_5" value="5"></td>
              <td><input type="radio" name="q49_5" value="6"></td>
              <td><input type="radio" name="q49_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">提高生产产品/服务的灵活性</td>
            </tr>
            <tr>
              <td><input type="radio" name="q49_6" value="1" required></td>
              <td><input type="radio" name="q49_6" value="2"></td>
              <td><input type="radio" name="q49_6" value="3"></td>
              <td><input type="radio" name="q49_6" value="4"></td>
              <td><input type="radio" name="q49_6" value="5"></td>
              <td><input type="radio" name="q49_6" value="6"></td>
              <td><input type="radio" name="q49_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">降低生产产品/服务的成本</td>
            </tr>
            <tr>
              <td><input type="radio" name="q49_7" value="1" required></td>
              <td><input type="radio" name="q49_7" value="2"></td>
              <td><input type="radio" name="q49_7" value="3"></td>
              <td><input type="radio" name="q49_7" value="4"></td>
              <td><input type="radio" name="q49_7" value="5"></td>
              <td><input type="radio" name="q49_7" value="6"></td>
              <td><input type="radio" name="q49_7" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">提高产量或降低资源消耗</td>
            </tr>
            <tr>
              <td><input type="radio" name="q49_8" value="1" required></td>
              <td><input type="radio" name="q49_8" value="2"></td>
              <td><input type="radio" name="q49_8" value="3"></td>
              <td><input type="radio" name="q49_8" value="4"></td>
              <td><input type="radio" name="q49_8" value="5"></td>
              <td><input type="radio" name="q49_8" value="6"></td>
              <td><input type="radio" name="q49_8" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">下面的每一个问题包含两个完全相反的描述。请指出你对两个描述的认可程度
        （1=完全认同第一个答案，7=完全认同第二个答案）</label>
      <div class="col-md-8">
        <div class="row" style="padding:0 15px">
          <table class="table table-condensed">

            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">持谨慎、观望的态度，以尽量减少付出高昂成本的代价</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">持大胆，积极的态度，以最大限度地利用机会</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_1" value="1" required></td>
              <td><input type="radio" name="q50_1" value="2"></td>
              <td><input type="radio" name="q50_1" value="3"></td>
              <td><input type="radio" name="q50_1" value="4"></td>
              <td><input type="radio" name="q50_1" value="5"></td>
              <td><input type="radio" name="q50_1" value="6"></td>
              <td><input type="radio" name="q50_1" value="7"></td>

            </tr>

            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">偏好低风险项目以获取固定或正常的回报率</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">偏好高风险项目以获取较高的回报率</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_2" value="1" required></td>
              <td><input type="radio" name="q50_2" value="2"></td>
              <td><input type="radio" name="q50_2" value="3"></td>
              <td><input type="radio" name="q50_2" value="4"></td>
              <td><input type="radio" name="q50_2" value="5"></td>
              <td><input type="radio" name="q50_2" value="6"></td>
              <td><input type="radio" name="q50_2" value="7"></td>

            </tr>
            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">在逐步、谨慎、渐进的行为中探索环境</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">以大胆、广泛的行为探索环境</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_3" value="1" required></td>
              <td><input type="radio" name="q50_3" value="2"></td>
              <td><input type="radio" name="q50_3" value="3"></td>
              <td><input type="radio" name="q50_3" value="4"></td>
              <td><input type="radio" name="q50_3" value="5"></td>
              <td><input type="radio" name="q50_3" value="6"></td>
              <td><input type="radio" name="q50_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">重视推广经过验证的产品</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">重视研发、技术领导地位和创新</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_4" value="1" required></td>
              <td><input type="radio" name="q50_4" value="2"></td>
              <td><input type="radio" name="q50_4" value="3"></td>
              <td><input type="radio" name="q50_4" value="4"></td>
              <td><input type="radio" name="q50_4" value="5"></td>
              <td><input type="radio" name="q50_4" value="6"></td>
              <td><input type="radio" name="q50_4" value="7"></td>

            </tr>
            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">产品或服务线的细微变化</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">产品或服务线的巨大变化</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_5" value="1" required></td>
              <td><input type="radio" name="q50_5" value="2"></td>
              <td><input type="radio" name="q50_5" value="3"></td>
              <td><input type="radio" name="q50_5" value="4"></td>
              <td><input type="radio" name="q50_5" value="5"></td>
              <td><input type="radio" name="q50_5" value="6"></td>
              <td><input type="radio" name="q50_5" value="7"></td>

            </tr>

            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">不引进新的产品/服务线</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">引进许多新产品/服务线</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_6" value="1" required></td>
              <td><input type="radio" name="q50_6" value="2"></td>
              <td><input type="radio" name="q50_6" value="3"></td>
              <td><input type="radio" name="q50_6" value="4"></td>
              <td><input type="radio" name="q50_6" value="5"></td>
              <td><input type="radio" name="q50_6" value="6"></td>
              <td><input type="radio" name="q50_6" value="7"></td>

            </tr>

            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">从不率先推出新产品/服务</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">经常率先推出新产品/服务</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_7" value="1" required></td>
              <td><input type="radio" name="q50_7" value="2"></td>
              <td><input type="radio" name="q50_7" value="3"></td>
              <td><input type="radio" name="q50_7" value="4"></td>
              <td><input type="radio" name="q50_7" value="5"></td>
              <td><input type="radio" name="q50_7" value="6"></td>
              <td><input type="radio" name="q50_7" value="7"></td>

            </tr>

            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">回应竞争对手发起的行动</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">发起行动，迫使竞争对手回应</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_8" value="1" required></td>
              <td><input type="radio" name="q50_8" value="2"></td>
              <td><input type="radio" name="q50_8" value="3"></td>
              <td><input type="radio" name="q50_8" value="4"></td>
              <td><input type="radio" name="q50_8" value="5"></td>
              <td><input type="radio" name="q50_8" value="6"></td>
              <td><input type="radio" name="q50_8" value="7"></td>

            </tr>
            <tr>
              <td colspan="9">总体上来说，我的企业偏好于……</td>
            </tr>
            <tr class="info">
              <th rowspan="2" class="th_answer">追随领导者推出产品/服务</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th rowspan="2" class="th_answer">领先于竞争对手推出新产品/服务</th>
            </tr>
            <tr>

              <td><input type="radio" name="q50_9" value="1" required></td>
              <td><input type="radio" name="q50_9" value="2"></td>
              <td><input type="radio" name="q50_9" value="3"></td>
              <td><input type="radio" name="q50_9" value="4"></td>
              <td><input type="radio" name="q50_9" value="5"></td>
              <td><input type="radio" name="q50_9" value="6"></td>
              <td><input type="radio" name="q50_9" value="7"></td>

            </tr>


          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">请指出你对下列关于企业所处行业描述的认可程度（1=完全不同意，7=非常同意）</label>
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
              <td colspan="7">市场中客户的偏好在不断变化</td>
            </tr>
            <tr>
              <td><input type="radio" name="q51_1" value="1" required></td>
              <td><input type="radio" name="q51_1" value="2"></td>
              <td><input type="radio" name="q51_1" value="3"></td>
              <td><input type="radio" name="q51_1" value="4"></td>
              <td><input type="radio" name="q51_1" value="5"></td>
              <td><input type="radio" name="q51_1" value="6"></td>
              <td><input type="radio" name="q51_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">顾客对我公司产品/服务的需求在不断变化</td>
            </tr>
            <tr>
              <td><input type="radio" name="q51_2" value="1" required></td>
              <td><input type="radio" name="q51_2" value="2"></td>
              <td><input type="radio" name="q51_2" value="3"></td>
              <td><input type="radio" name="q51_2" value="4"></td>
              <td><input type="radio" name="q51_2" value="5"></td>
              <td><input type="radio" name="q51_2" value="6"></td>
              <td><input type="radio" name="q51_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">其他企业正在不断地向我公司的市场推出新产品</td>
            </tr>
            <tr>
              <td><input type="radio" name="q51_3" value="1" required></td>
              <td><input type="radio" name="q51_3" value="2"></td>
              <td><input type="radio" name="q51_3" value="3"></td>
              <td><input type="radio" name="q51_3" value="4"></td>
              <td><input type="radio" name="q51_3" value="5"></td>
              <td><input type="radio" name="q51_3" value="6"></td>
              <td><input type="radio" name="q51_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">市场中其他企业正在不断制定新的销售策略</td>
            </tr>
            <tr>
              <td><input type="radio" name="q51_4" value="1" required></td>
              <td><input type="radio" name="q51_4" value="2"></td>
              <td><input type="radio" name="q51_4" value="3"></td>
              <td><input type="radio" name="q51_4" value="4"></td>
              <td><input type="radio" name="q51_4" value="5"></td>
              <td><input type="radio" name="q51_4" value="6"></td>
              <td><input type="radio" name="q51_4" value="7"></td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你的企业是否已经产生销售收入</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q52" value="1" required> 是
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q52" value="2"> 否
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">销售收入是否能够覆盖成本</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q52_add" value="1" required> 是
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q52_add" value="2"> 否
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你的企业是否有财务利润</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q53" value="1" required> 是
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q53" value="2"> 否
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你如何判断从现在起5年内，企业雇员人数的增长（1=非常悲观，7=非常乐观）</label>
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
              <td colspan="7">25%的增长</td>
            </tr>
            <tr>
              <td><input type="radio" name="q54_1" value="1" required></td>
              <td><input type="radio" name="q54_1" value="2"></td>
              <td><input type="radio" name="q54_1" value="3"></td>
              <td><input type="radio" name="q54_1" value="4"></td>
              <td><input type="radio" name="q54_1" value="5"></td>
              <td><input type="radio" name="q54_1" value="6"></td>
              <td><input type="radio" name="q54_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">50%的增长</td>
            </tr>
            <tr>
              <td><input type="radio" name="q54_2" value="1" required></td>
              <td><input type="radio" name="q54_2" value="2"></td>
              <td><input type="radio" name="q54_2" value="3"></td>
              <td><input type="radio" name="q54_2" value="4"></td>
              <td><input type="radio" name="q54_2" value="5"></td>
              <td><input type="radio" name="q54_2" value="6"></td>
              <td><input type="radio" name="q54_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">75%的增长</td>
            </tr>
            <tr>
              <td><input type="radio" name="q54_3" value="1" required></td>
              <td><input type="radio" name="q54_3" value="2"></td>
              <td><input type="radio" name="q54_3" value="3"></td>
              <td><input type="radio" name="q54_3" value="4"></td>
              <td><input type="radio" name="q54_3" value="5"></td>
              <td><input type="radio" name="q54_3" value="6"></td>
              <td><input type="radio" name="q54_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">100%的增长</td>
            </tr>
            <tr>
              <td><input type="radio" name="q54_4" value="1" required></td>
              <td><input type="radio" name="q54_4" value="2"></td>
              <td><input type="radio" name="q54_4" value="3"></td>
              <td><input type="radio" name="q54_4" value="4"></td>
              <td><input type="radio" name="q54_4" value="5"></td>
              <td><input type="radio" name="q54_4" value="6"></td>
              <td><input type="radio" name="q54_4" value="7"></td>
            </tr>

          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label
        class="col-md-2 control-label">请指出你对下列描述的认可程度（1=完全不同意，7=非常同意）</label>
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
              <td colspan="7">我对我的创业事业很满意</td>
            </tr>
            <tr>
              <td><input type="radio" name="q55_1" value="1" required></td>
              <td><input type="radio" name="q55_1" value="2"></td>
              <td><input type="radio" name="q55_1" value="3"></td>
              <td><input type="radio" name="q55_1" value="4"></td>
              <td><input type="radio" name="q55_1" value="5"></td>
              <td><input type="radio" name="q55_1" value="6"></td>
              <td><input type="radio" name="q55_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">总体上说，我对我的企业感到满意</td>
            </tr>
            <tr>
              <td><input type="radio" name="q55_2" value="1" required></td>
              <td><input type="radio" name="q55_2" value="2"></td>
              <td><input type="radio" name="q55_2" value="3"></td>
              <td><input type="radio" name="q55_2" value="4"></td>
              <td><input type="radio" name="q55_2" value="5"></td>
              <td><input type="radio" name="q55_2" value="6"></td>
              <td><input type="radio" name="q55_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我愿意再次创立同一家企业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q55_3" value="1" required></td>
              <td><input type="radio" name="q55_3" value="2"></td>
              <td><input type="radio" name="q55_3" value="3"></td>
              <td><input type="radio" name="q55_3" value="4"></td>
              <td><input type="radio" name="q55_3" value="5"></td>
              <td><input type="radio" name="q55_3" value="6"></td>
              <td><input type="radio" name="q55_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">考虑各方面因素，我对作为一个创业者的生活感到满意</td>
            </tr>
            <tr>
              <td><input type="radio" name="q55_4" value="1" required></td>
              <td><input type="radio" name="q55_4" value="2"></td>
              <td><input type="radio" name="q55_4" value="3"></td>
              <td><input type="radio" name="q55_4" value="4"></td>
              <td><input type="radio" name="q55_4" value="5"></td>
              <td><input type="radio" name="q55_4" value="6"></td>
              <td><input type="radio" name="q55_4" value="7"></td>
            </tr>

          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">与销售同类产品/服务的其他企业相比，你认为企业的表现如何（1=非常差，7=非常好）</label>
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
              <td colspan="7">创造利润</td>
            </tr>
            <tr>
              <td><input type="radio" name="q56_1" value="1" required></td>
              <td><input type="radio" name="q56_1" value="2"></td>
              <td><input type="radio" name="q56_1" value="3"></td>
              <td><input type="radio" name="q56_1" value="4"></td>
              <td><input type="radio" name="q56_1" value="5"></td>
              <td><input type="radio" name="q56_1" value="6"></td>
              <td><input type="radio" name="q56_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">销售增长</td>
            </tr>
            <tr>
              <td><input type="radio" name="q56_2" value="1" required></td>
              <td><input type="radio" name="q56_2" value="2"></td>
              <td><input type="radio" name="q56_2" value="3"></td>
              <td><input type="radio" name="q56_2" value="4"></td>
              <td><input type="radio" name="q56_2" value="5"></td>
              <td><input type="radio" name="q56_2" value="6"></td>
              <td><input type="radio" name="q56_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">市场份额增长</td>
            </tr>
            <tr>
              <td><input type="radio" name="q56_3" value="1" required></td>
              <td><input type="radio" name="q56_3" value="2"></td>
              <td><input type="radio" name="q56_3" value="3"></td>
              <td><input type="radio" name="q56_3" value="4"></td>
              <td><input type="radio" name="q56_3" value="5"></td>
              <td><input type="radio" name="q56_3" value="6"></td>
              <td><input type="radio" name="q56_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">创造就业岗位</td>
            </tr>
            <tr>
              <td><input type="radio" name="q56_4" value="1" required></td>
              <td><input type="radio" name="q56_4" value="2"></td>
              <td><input type="radio" name="q56_4" value="3"></td>
              <td><input type="radio" name="q56_4" value="4"></td>
              <td><input type="radio" name="q56_4" value="5"></td>
              <td><input type="radio" name="q56_4" value="6"></td>
              <td><input type="radio" name="q56_4" value="7"></td>
            </tr>

          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label
        class="col-md-2 control-label">总体而言，你的企业在下列方面表现如何（1=非常差，7=非常好）</label>
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
              <td colspan="7">为自己创造个人财富</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_1" value="1" required></td>
              <td><input type="radio" name="q57_1" value="2"></td>
              <td><input type="radio" name="q57_1" value="3"></td>
              <td><input type="radio" name="q57_1" value="4"></td>
              <td><input type="radio" name="q57_1" value="5"></td>
              <td><input type="radio" name="q57_1" value="6"></td>
              <td><input type="radio" name="q57_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">创造与目标客户沟通的机会</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_2" value="1" required></td>
              <td><input type="radio" name="q57_2" value="2"></td>
              <td><input type="radio" name="q57_2" value="3"></td>
              <td><input type="radio" name="q57_2" value="4"></td>
              <td><input type="radio" name="q57_2" value="5"></td>
              <td><input type="radio" name="q57_2" value="6"></td>
              <td><input type="radio" name="q57_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">与目标客户分享信息或知识</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_3" value="1" required></td>
              <td><input type="radio" name="q57_3" value="2"></td>
              <td><input type="radio" name="q57_3" value="3"></td>
              <td><input type="radio" name="q57_3" value="4"></td>
              <td><input type="radio" name="q57_3" value="5"></td>
              <td><input type="radio" name="q57_3" value="6"></td>
              <td><input type="radio" name="q57_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">让你在目标客户中获得强大的社会认同</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_4" value="1" required></td>
              <td><input type="radio" name="q57_4" value="2"></td>
              <td><input type="radio" name="q57_4" value="3"></td>
              <td><input type="radio" name="q57_4" value="4"></td>
              <td><input type="radio" name="q57_4" value="5"></td>
              <td><input type="radio" name="q57_4" value="6"></td>
              <td><input type="radio" name="q57_4" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">帮助你的目标客户将自己与其他消费者或团体区分开来</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_5" value="1" required></td>
              <td><input type="radio" name="q57_5" value="2"></td>
              <td><input type="radio" name="q57_5" value="3"></td>
              <td><input type="radio" name="q57_5" value="4"></td>
              <td><input type="radio" name="q57_5" value="5"></td>
              <td><input type="radio" name="q57_5" value="6"></td>
              <td><input type="radio" name="q57_5" value="7"></td>
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
              <td colspan="7">在满足目标顾客需求的过程中成为先行者</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_6" value="1" required></td>
              <td><input type="radio" name="q57_6" value="2"></td>
              <td><input type="radio" name="q57_6" value="3"></td>
              <td><input type="radio" name="q57_6" value="4"></td>
              <td><input type="radio" name="q57_6" value="5"></td>
              <td><input type="radio" name="q57_6" value="6"></td>
              <td><input type="radio" name="q57_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">提出解决已有社会问题的新方法</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_7" value="1" required></td>
              <td><input type="radio" name="q57_7" value="2"></td>
              <td><input type="radio" name="q57_7" value="3"></td>
              <td><input type="radio" name="q57_7" value="4"></td>
              <td><input type="radio" name="q57_7" value="5"></td>
              <td><input type="radio" name="q57_7" value="6"></td>
              <td><input type="radio" name="q57_7" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">改变其他公司的做法</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_8" value="1" required></td>
              <td><input type="radio" name="q57_8" value="2"></td>
              <td><input type="radio" name="q57_8" value="3"></td>
              <td><input type="radio" name="q57_8" value="4"></td>
              <td><input type="radio" name="q57_8" value="5"></td>
              <td><input type="radio" name="q57_8" value="6"></td>
              <td><input type="radio" name="q57_8" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">作为其他企业的标杆</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_9" value="1" required></td>
              <td><input type="radio" name="q57_9" value="2"></td>
              <td><input type="radio" name="q57_9" value="3"></td>
              <td><input type="radio" name="q57_9" value="4"></td>
              <td><input type="radio" name="q57_9" value="5"></td>
              <td><input type="radio" name="q57_9" value="6"></td>
              <td><input type="radio" name="q57_9" value="7"></td>
            </tr>


            <tr>
              <td colspan="7">提高公众对某一特定社会问题的认识</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_10" value="1" required></td>
              <td><input type="radio" name="q57_10" value="2"></td>
              <td><input type="radio" name="q57_10" value="3"></td>
              <td><input type="radio" name="q57_10" value="4"></td>
              <td><input type="radio" name="q57_10" value="5"></td>
              <td><input type="radio" name="q57_10" value="6"></td>
              <td><input type="radio" name="q57_10" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">引导法律法规变化</td>
            </tr>
            <tr>
              <td><input type="radio" name="q57_11" value="1" required></td>
              <td><input type="radio" name="q57_11" value="2"></td>
              <td><input type="radio" name="q57_11" value="3"></td>
              <td><input type="radio" name="q57_11" value="4"></td>
              <td><input type="radio" name="q57_11" value="5"></td>
              <td><input type="radio" name="q57_11" value="6"></td>
              <td><input type="radio" name="q57_11" value="7"></td>
            </tr>

          </table>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label
        class="col-md-2 control-label">在管理企业的过程中，你做以下行为的频率是（1=从来不，7=总是）</label>
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
              <td colspan="7">在商业活动中，我花时间仔细思考事情</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_1" value="1" required></td>
              <td><input type="radio" name="q58_1" value="2"></td>
              <td><input type="radio" name="q58_1" value="3"></td>
              <td><input type="radio" name="q58_1" value="4"></td>
              <td><input type="radio" name="q58_1" value="5"></td>
              <td><input type="radio" name="q58_1" value="6"></td>
              <td><input type="radio" name="q58_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在商业活动中，我在实际行动前先制定计划</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_2" value="1" required></td>
              <td><input type="radio" name="q58_2" value="2"></td>
              <td><input type="radio" name="q58_2" value="3"></td>
              <td><input type="radio" name="q58_2" value="4"></td>
              <td><input type="radio" name="q58_2" value="5"></td>
              <td><input type="radio" name="q58_2" value="6"></td>
              <td><input type="radio" name="q58_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我采取较为系统的方法解决业务中存在的问题</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_3" value="1" required></td>
              <td><input type="radio" name="q58_3" value="2"></td>
              <td><input type="radio" name="q58_3" value="3"></td>
              <td><input type="radio" name="q58_3" value="4"></td>
              <td><input type="radio" name="q58_3" value="5"></td>
              <td><input type="radio" name="q58_3" value="6"></td>
              <td><input type="radio" name="q58_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在商业活动中，相较于潜在损失，我更关注潜在收益</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_4" value="1" required></td>
              <td><input type="radio" name="q58_4" value="2"></td>
              <td><input type="radio" name="q58_4" value="3"></td>
              <td><input type="radio" name="q58_4" value="4"></td>
              <td><input type="radio" name="q58_4" value="5"></td>
              <td><input type="radio" name="q58_4" value="6"></td>
              <td><input type="radio" name="q58_4" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">我喜欢用创造性的解决方案来实现我的创业目标</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_5" value="1" required></td>
              <td><input type="radio" name="q58_5" value="2"></td>
              <td><input type="radio" name="q58_5" value="3"></td>
              <td><input type="radio" name="q58_5" value="4"></td>
              <td><input type="radio" name="q58_5" value="5"></td>
              <td><input type="radio" name="q58_5" value="6"></td>
              <td><input type="radio" name="q58_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">我喜欢快速行动，以实现我的业务目标</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_6" value="1" required></td>
              <td><input type="radio" name="q58_6" value="2"></td>
              <td><input type="radio" name="q58_6" value="3"></td>
              <td><input type="radio" name="q58_6" value="4"></td>
              <td><input type="radio" name="q58_6" value="5"></td>
              <td><input type="radio" name="q58_6" value="6"></td>
              <td><input type="radio" name="q58_6" value="7"></td>
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
              <td colspan="7">在日常工作中，我的工作精确而深入</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_7" value="1" required></td>
              <td><input type="radio" name="q58_7" value="2"></td>
              <td><input type="radio" name="q58_7" value="3"></td>
              <td><input type="radio" name="q58_7" value="4"></td>
              <td><input type="radio" name="q58_7" value="5"></td>
              <td><input type="radio" name="q58_7" value="6"></td>
              <td><input type="radio" name="q58_7" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">在商业活动中，我更喜欢遵循众所周知的策略和方法</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_8" value="1" required></td>
              <td><input type="radio" name="q58_8" value="2"></td>
              <td><input type="radio" name="q58_8" value="3"></td>
              <td><input type="radio" name="q58_8" value="4"></td>
              <td><input type="radio" name="q58_8" value="5"></td>
              <td><input type="radio" name="q58_8" value="6"></td>
              <td><input type="radio" name="q58_8" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">我采取较为系统的方法来制定创业决策</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_9" value="1" required></td>
              <td><input type="radio" name="q58_9" value="2"></td>
              <td><input type="radio" name="q58_9" value="3"></td>
              <td><input type="radio" name="q58_9" value="4"></td>
              <td><input type="radio" name="q58_9" value="5"></td>
              <td><input type="radio" name="q58_9" value="6"></td>
              <td><input type="radio" name="q58_9" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">未来的商业收益激励我更加努力工作</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_10" value="1" required></td>
              <td><input type="radio" name="q58_10" value="2"></td>
              <td><input type="radio" name="q58_10" value="3"></td>
              <td><input type="radio" name="q58_10" value="4"></td>
              <td><input type="radio" name="q58_10" value="5"></td>
              <td><input type="radio" name="q58_10" value="6"></td>
              <td><input type="radio" name="q58_10" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">在商业活动中，我更喜欢尝试新的做事方式</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_11" value="1" required></td>
              <td><input type="radio" name="q58_11" value="2"></td>
              <td><input type="radio" name="q58_11" value="3"></td>
              <td><input type="radio" name="q58_11" value="4"></td>
              <td><input type="radio" name="q58_11" value="5"></td>
              <td><input type="radio" name="q58_11" value="6"></td>
              <td><input type="radio" name="q58_11" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">在日常工作中，我喜欢快速完成手头的事情/把事情做得很快</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_12" value="1" required></td>
              <td><input type="radio" name="q58_12" value="2"></td>
              <td><input type="radio" name="q58_12" value="3"></td>
              <td><input type="radio" name="q58_12" value="4"></td>
              <td><input type="radio" name="q58_12" value="5"></td>
              <td><input type="radio" name="q58_12" value="6"></td>
              <td><input type="radio" name="q58_12" value="7"></td>
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
              <td colspan="7">在日常工作中，详细的准备对我来说非常重要</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_13" value="1" required></td>
              <td><input type="radio" name="q58_13" value="2"></td>
              <td><input type="radio" name="q58_13" value="3"></td>
              <td><input type="radio" name="q58_13" value="4"></td>
              <td><input type="radio" name="q58_13" value="5"></td>
              <td><input type="radio" name="q58_13" value="6"></td>
              <td><input type="radio" name="q58_13" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">我为我的企业尽量降低风险和潜在损失</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_14" value="1" required></td>
              <td><input type="radio" name="q58_14" value="2"></td>
              <td><input type="radio" name="q58_14" value="3"></td>
              <td><input type="radio" name="q58_14" value="4"></td>
              <td><input type="radio" name="q58_14" value="5"></td>
              <td><input type="radio" name="q58_14" value="6"></td>
              <td><input type="radio" name="q58_14" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">一旦采取了某项计划，按计划行事对我很重要</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_15" value="1" required></td>
              <td><input type="radio" name="q58_15" value="2"></td>
              <td><input type="radio" name="q58_15" value="3"></td>
              <td><input type="radio" name="q58_15" value="4"></td>
              <td><input type="radio" name="q58_15" value="5"></td>
              <td><input type="radio" name="q58_15" value="6"></td>
              <td><input type="radio" name="q58_15" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">作为一名创业者，我最大化地利用我所拥有的资源</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_16" value="1" required></td>
              <td><input type="radio" name="q58_16" value="2"></td>
              <td><input type="radio" name="q58_16" value="3"></td>
              <td><input type="radio" name="q58_16" value="4"></td>
              <td><input type="radio" name="q58_16" value="5"></td>
              <td><input type="radio" name="q58_16" value="6"></td>
              <td><input type="radio" name="q58_16" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">作为一名创业者，我尽最大可能具有创新性</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_17" value="1" required></td>
              <td><input type="radio" name="q58_17" value="2"></td>
              <td><input type="radio" name="q58_17" value="3"></td>
              <td><input type="radio" name="q58_17" value="4"></td>
              <td><input type="radio" name="q58_17" value="5"></td>
              <td><input type="radio" name="q58_17" value="6"></td>
              <td><input type="radio" name="q58_17" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">我迅速做出商业决策</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_18" value="1" required></td>
              <td><input type="radio" name="q58_18" value="2"></td>
              <td><input type="radio" name="q58_18" value="3"></td>
              <td><input type="radio" name="q58_18" value="4"></td>
              <td><input type="radio" name="q58_18" value="5"></td>
              <td><input type="radio" name="q58_18" value="6"></td>
              <td><input type="radio" name="q58_18" value="7"></td>
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
              <td colspan="7">在日常工作中，我花很长时间在制定计划和准备上</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_19" value="1" required></td>
              <td><input type="radio" name="q58_19" value="2"></td>
              <td><input type="radio" name="q58_19" value="3"></td>
              <td><input type="radio" name="q58_19" value="4"></td>
              <td><input type="radio" name="q58_19" value="5"></td>
              <td><input type="radio" name="q58_19" value="6"></td>
              <td><input type="radio" name="q58_19" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">最大限度的减少潜在损失是我制定决策的核心原则</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_20" value="1" required></td>
              <td><input type="radio" name="q58_20" value="2"></td>
              <td><input type="radio" name="q58_20" value="3"></td>
              <td><input type="radio" name="q58_20" value="4"></td>
              <td><input type="radio" name="q58_20" value="5"></td>
              <td><input type="radio" name="q58_20" value="6"></td>
              <td><input type="radio" name="q58_20" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">我试着从不同角度去分析我所面临的商业问题</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_21" value="1" required></td>
              <td><input type="radio" name="q58_21" value="2"></td>
              <td><input type="radio" name="q58_21" value="3"></td>
              <td><input type="radio" name="q58_21" value="4"></td>
              <td><input type="radio" name="q58_21" value="5"></td>
              <td><input type="radio" name="q58_21" value="6"></td>
              <td><input type="radio" name="q58_21" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">我努力把不利的商业环境变得有利</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_22" value="1" required></td>
              <td><input type="radio" name="q58_22" value="2"></td>
              <td><input type="radio" name="q58_22" value="3"></td>
              <td><input type="radio" name="q58_22" value="4"></td>
              <td><input type="radio" name="q58_22" value="5"></td>
              <td><input type="radio" name="q58_22" value="6"></td>
              <td><input type="radio" name="q58_22" value="7"></td>
            </tr>


            <tr>
              <td colspan="7">即使公司处于危急情况下，我也坚信一切都会变好</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_23" value="1" required></td>
              <td><input type="radio" name="q58_23" value="2"></td>
              <td><input type="radio" name="q58_23" value="3"></td>
              <td><input type="radio" name="q58_23" value="4"></td>
              <td><input type="radio" name="q58_23" value="5"></td>
              <td><input type="radio" name="q58_23" value="6"></td>
              <td><input type="radio" name="q58_23" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">我试着用创造性的方法去解决我所面临的商业问题</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_24" value="1" required></td>
              <td><input type="radio" name="q58_24" value="2"></td>
              <td><input type="radio" name="q58_24" value="3"></td>
              <td><input type="radio" name="q58_24" value="4"></td>
              <td><input type="radio" name="q58_24" value="5"></td>
              <td><input type="radio" name="q58_24" value="6"></td>
              <td><input type="radio" name="q58_24" value="7"></td>
            </tr>

            <tr>
              <td colspan="7">快速制定决策对我来说很重要</td>
            </tr>
            <tr>
              <td><input type="radio" name="q58_25" value="1" required></td>
              <td><input type="radio" name="q58_25" value="2"></td>
              <td><input type="radio" name="q58_25" value="3"></td>
              <td><input type="radio" name="q58_25" value="4"></td>
              <td><input type="radio" name="q58_25" value="5"></td>
              <td><input type="radio" name="q58_25" value="6"></td>
              <td><input type="radio" name="q58_25" value="7"></td>
            </tr>

          </table>
        </div>
      </div>
    </div>

    <input type="hidden" name="part" id="part" value="6">
    <hr>

    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" id="next" class="btn btn-primary btn-lg">保存</button>
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

  $(document).ready(function () {
//    $('#survey').bootstrapValidator({});
  });

  function validateForm() {
    if ($("#q40").val() == '') {
      $("#q40").closest(".form-group").addClass("has-error");
      $("html,body").animate({scrollTop: $("#q40").closest(".form-group").offset().top - 20});
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
