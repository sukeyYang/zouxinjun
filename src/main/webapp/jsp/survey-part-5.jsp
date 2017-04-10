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
      <div class="text-center bs-wizard-stepnum">步骤 4</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">环境认知</div>
    </div>

    <div class="col-xs-4 bs-wizard-step active">
      <div class="text-center bs-wizard-stepnum">步骤 5</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你的计划</div>
    </div>

    <div class="col-xs-4 bs-wizard-step disabled">
      <div class="text-center bs-wizard-stepnum">步骤 6</div>
      <div class="progress">
        <div class="progress-bar"></div>
      </div>
      <a href="javascript:void(0)" class="bs-wizard-dot"></a>
      <div class="bs-wizard-info text-center">你的企业</div>
    </div>
  </div>

  <form class="form-horizontal" id="survey" method="post" action="<%= basePath%>save_answer" onsubmit="return validateForm()">


    <div class="form-group">
      <label
        class="col-md-2 control-label">你前面提到自己正在试图创建一家新企业,你希望在多长时间内创立这家新企业</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q26" value="1" required> 1-6个月内
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q26" value="2"> 7-12个月内
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q26" value="3"> 13-18个月内
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q26" value="4"> 19个月以上
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你前面提到自己正在试图创建一家新企业,你希望这家企业成为你毕业后的主要职业吗</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q27" value="1" required> 是
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q27" value="2"> 否
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">你以前有创立其他新企业的经验吗</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q28" value="1" required> 有
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q28" value="2"> 没有
            </label>
          </div>
        </div>
      </div>
    </div>


    <div class="form-group">
      <label
        class="col-md-2 control-label">你所打算创立的这家新企业所处的行业是？（请选择最为贴切的一项）</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="1" required> 广告/设计/营销
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="2"> 建筑设计和工程
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="3"> 建筑工程 （施工建设）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="4"> 咨询（人力资源，法律，管理，税收方面的咨询服务）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="5"> 教育和培训
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="6"> 金融服务（包括银行业，保险业，投资，房地产等）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="7"> 人类健康和社会服务
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="8"> 信息技术 （IT）和通信（包括软件和IT服务）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="9"> 制造业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="10"> 旅游和休闲行业
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="11"> 贸易（批发和零售）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="12"> 其他服务（如交通运输等）
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q29" value="13"> 其他
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">请在下面所列的准备活动选择你已经完成的（多选）</label>
      <div class="col-md-8">
        <div class="row">
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" id="q30" name="q30" value="1" >
              与潜在顾客讨论产品或商业想法
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="2"> 收集市场或竞争者的信息
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="3"> 撰写商业计划
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="4"> 开始产品或服务的开发
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="5"> 开始营销或市场推广活动
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="6"> 购买原材料，设备或机器
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="7"> 获取外部资金
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="8"> 申请专利，产权或商标
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="9"> 在工商部门注册企业
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="10"> 销售产品或服务
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q30" value="11"> 目前还没有做上述任何一种准备工作
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
              <td><input type="radio" name="q31_1" value="1" required></td>
              <td><input type="radio" name="q31_1" value="2"></td>
              <td><input type="radio" name="q31_1" value="3"></td>
              <td><input type="radio" name="q31_1" value="4"></td>
              <td><input type="radio" name="q31_1" value="5"></td>
              <td><input type="radio" name="q31_1" value="6"></td>
              <td><input type="radio" name="q31_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">取得经济上的成功</td>
            </tr>
            <tr>
              <td><input type="radio" name="q31_2" value="1" required></td>
              <td><input type="radio" name="q31_2" value="2"></td>
              <td><input type="radio" name="q31_2" value="3"></td>
              <td><input type="radio" name="q31_2" value="4"></td>
              <td><input type="radio" name="q31_2" value="5"></td>
              <td><input type="radio" name="q31_2" value="6"></td>
              <td><input type="radio" name="q31_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在商业环境中推进我的事业</td>
            </tr>
            <tr>
              <td><input type="radio" name="q31_3" value="1" required></td>
              <td><input type="radio" name="q31_3" value="2"></td>
              <td><input type="radio" name="q31_3" value="3"></td>
              <td><input type="radio" name="q31_3" value="4"></td>
              <td><input type="radio" name="q31_3" value="5"></td>
              <td><input type="radio" name="q31_3" value="6"></td>
              <td><input type="radio" name="q31_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">向人们展示我的能力（对未来的雇员和同事）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q31_4" value="1" required></td>
              <td><input type="radio" name="q31_4" value="2"></td>
              <td><input type="radio" name="q31_4" value="3"></td>
              <td><input type="radio" name="q31_4" value="4"></td>
              <td><input type="radio" name="q31_4" value="5"></td>
              <td><input type="radio" name="q31_4" value="6"></td>
              <td><input type="radio" name="q31_4" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">解决我强烈认同的一群人所面临的具体问题（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q31_5" value="1" required></td>
              <td><input type="radio" name="q31_5" value="2"></td>
              <td><input type="radio" name="q31_5" value="3"></td>
              <td><input type="radio" name="q31_5" value="4"></td>
              <td><input type="radio" name="q31_5" value="5"></td>
              <td><input type="radio" name="q31_5" value="6"></td>
              <td><input type="radio" name="q31_5" value="7"></td>
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
              <td colspan="7">在改变我强烈认同的一群人的行动中发挥积极作用（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q31_6" value="1" required></td>
              <td><input type="radio" name="q31_6" value="2"></td>
              <td><input type="radio" name="q31_6" value="3"></td>
              <td><input type="radio" name="q31_6" value="4"></td>
              <td><input type="radio" name="q31_6" value="5"></td>
              <td><input type="radio" name="q31_6" value="6"></td>
              <td><input type="radio" name="q31_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">解决私人企业通常无法解决的社会问题（例如，社会不公正，环境保护）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q31_7" value="1" required></td>
              <td><input type="radio" name="q31_7" value="2"></td>
              <td><input type="radio" name="q31_7" value="3"></td>
              <td><input type="radio" name="q31_7" value="4"></td>
              <td><input type="radio" name="q31_7" value="5"></td>
              <td><input type="radio" name="q31_7" value="6"></td>
              <td><input type="radio" name="q31_7" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">践行我自己的核心价值观</td>
            </tr>
            <tr>
              <td><input type="radio" name="q31_8" value="1" required></td>
              <td><input type="radio" name="q31_8" value="2"></td>
              <td><input type="radio" name="q31_8" value="3"></td>
              <td><input type="radio" name="q31_8" value="4"></td>
              <td><input type="radio" name="q31_8" value="5"></td>
              <td><input type="radio" name="q31_8" value="6"></td>
              <td><input type="radio" name="q31_8" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">在改变世界的运行方式中发挥积极作用</td>
            </tr>
            <tr>
              <td><input type="radio" name="q31_9" value="1" required></td>
              <td><input type="radio" name="q31_9" value="2"></td>
              <td><input type="radio" name="q31_9" value="3"></td>
              <td><input type="radio" name="q31_9" value="4"></td>
              <td><input type="radio" name="q31_9" value="5"></td>
              <td><input type="radio" name="q31_9" value="6"></td>
              <td><input type="radio" name="q31_9" value="7"></td>
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
              <td><input type="radio" name="q32_1" value="1" required></td>
              <td><input type="radio" name="q32_1" value="2"></td>
              <td><input type="radio" name="q32_1" value="3"></td>
              <td><input type="radio" name="q32_1" value="4"></td>
              <td><input type="radio" name="q32_1" value="5"></td>
              <td><input type="radio" name="q32_1" value="6"></td>
              <td><input type="radio" name="q32_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">细致地分析公司的财务前景</td>
            </tr>
            <tr>
              <td><input type="radio" name="q32_2" value="1" required></td>
              <td><input type="radio" name="q32_2" value="2"></td>
              <td><input type="radio" name="q32_2" value="3"></td>
              <td><input type="radio" name="q32_2" value="4"></td>
              <td><input type="radio" name="q32_2" value="5"></td>
              <td><input type="radio" name="q32_2" value="6"></td>
              <td><input type="radio" name="q32_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">为我强烈认同的一群人提供有用的产品或服务（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q32_3" value="1" required></td>
              <td><input type="radio" name="q32_3" value="2"></td>
              <td><input type="radio" name="q32_3" value="3"></td>
              <td><input type="radio" name="q32_3" value="4"></td>
              <td><input type="radio" name="q32_3" value="5"></td>
              <td><input type="radio" name="q32_3" value="6"></td>
              <td><input type="radio" name="q32_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">向我的客户传达我想要满足他们的需求而不仅仅是做生意</td>
            </tr>
            <tr>
              <td><input type="radio" name="q32_4" value="1" required></td>
              <td><input type="radio" name="q32_4" value="2"></td>
              <td><input type="radio" name="q32_4" value="3"></td>
              <td><input type="radio" name="q32_4" value="4"></td>
              <td><input type="radio" name="q32_4" value="5"></td>
              <td><input type="radio" name="q32_4" value="6"></td>
              <td><input type="radio" name="q32_4" value="7"></td>
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
              <td><input type="radio" name="q32_5" value="1" required></td>
              <td><input type="radio" name="q32_5" value="2"></td>
              <td><input type="radio" name="q32_5" value="3"></td>
              <td><input type="radio" name="q32_5" value="4"></td>
              <td><input type="radio" name="q32_5" value="5"></td>
              <td><input type="radio" name="q32_5" value="6"></td>
              <td><input type="radio" name="q32_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">真诚地为我强烈认同的一群人提供服务（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q32_6" value="1" required></td>
              <td><input type="radio" name="q32_6" value="2"></td>
              <td><input type="radio" name="q32_6" value="3"></td>
              <td><input type="radio" name="q32_6" value="4"></td>
              <td><input type="radio" name="q32_6" value="5"></td>
              <td><input type="radio" name="q32_6" value="6"></td>
              <td><input type="radio" name="q32_6" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">做一个有高度责任感的公民</td>
            </tr>
            <tr>
              <td><input type="radio" name="q32_7" value="1" required></td>
              <td><input type="radio" name="q32_7" value="2"></td>
              <td><input type="radio" name="q32_7" value="3"></td>
              <td><input type="radio" name="q32_7" value="4"></td>
              <td><input type="radio" name="q32_7" value="5"></td>
              <td><input type="radio" name="q32_7" value="6"></td>
              <td><input type="radio" name="q32_7" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">是世界变得更好（例如，追求社会公正，环境保护）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q32_8" value="1" required></td>
              <td><input type="radio" name="q32_8" value="2"></td>
              <td><input type="radio" name="q32_8" value="3"></td>
              <td><input type="radio" name="q32_8" value="4"></td>
              <td><input type="radio" name="q32_8" value="5"></td>
              <td><input type="radio" name="q32_8" value="6"></td>
              <td><input type="radio" name="q32_8" value="7"></td>
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
              <td><input type="radio" name="q33_1" value="1" required></td>
              <td><input type="radio" name="q33_1" value="2"></td>
              <td><input type="radio" name="q33_1" value="3"></td>
              <td><input type="radio" name="q33_1" value="4"></td>
              <td><input type="radio" name="q33_1" value="5"></td>
              <td><input type="radio" name="q33_1" value="6"></td>
              <td><input type="radio" name="q33_1" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">建立强大的竞争优势，超过我的竞争者</td>
            </tr>
            <tr>
              <td><input type="radio" name="q33_2" value="1" required></td>
              <td><input type="radio" name="q33_2" value="2"></td>
              <td><input type="radio" name="q33_2" value="3"></td>
              <td><input type="radio" name="q33_2" value="4"></td>
              <td><input type="radio" name="q33_2" value="5"></td>
              <td><input type="radio" name="q33_2" value="6"></td>
              <td><input type="radio" name="q33_2" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">聚焦于我强烈认同的一群人（例如，朋友，同事，俱乐部成员，社区成员等）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q33_3" value="1" required></td>
              <td><input type="radio" name="q33_3" value="2"></td>
              <td><input type="radio" name="q33_3" value="3"></td>
              <td><input type="radio" name="q33_3" value="4"></td>
              <td><input type="radio" name="q33_3" value="5"></td>
              <td><input type="radio" name="q33_3" value="6"></td>
              <td><input type="radio" name="q33_3" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">支持和推动我强烈认同的一群人</td>
            </tr>
            <tr>
              <td><input type="radio" name="q33_4" value="1" required></td>
              <td><input type="radio" name="q33_4" value="2"></td>
              <td><input type="radio" name="q33_4" value="3"></td>
              <td><input type="radio" name="q33_4" value="4"></td>
              <td><input type="radio" name="q33_4" value="5"></td>
              <td><input type="radio" name="q33_4" value="6"></td>
              <td><input type="radio" name="q33_4" value="7"></td>
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
              <td><input type="radio" name="q33_5" value="1" required></td>
              <td><input type="radio" name="q33_5" value="2"></td>
              <td><input type="radio" name="q33_5" value="3"></td>
              <td><input type="radio" name="q33_5" value="4"></td>
              <td><input type="radio" name="q33_5" value="5"></td>
              <td><input type="radio" name="q33_5" value="6"></td>
              <td><input type="radio" name="q33_5" value="7"></td>
            </tr>
            <tr>
              <td colspan="7">使他人相信，私人企业有能力解决我的企业正在应对的社会挑战（例如，社会公正，环境保护）</td>
            </tr>
            <tr>
              <td><input type="radio" name="q33_6" value="1" required></td>
              <td><input type="radio" name="q33_6" value="2"></td>
              <td><input type="radio" name="q33_6" value="3"></td>
              <td><input type="radio" name="q33_6" value="4"></td>
              <td><input type="radio" name="q33_6" value="5"></td>
              <td><input type="radio" name="q33_6" value="6"></td>
              <td><input type="radio" name="q33_6" value="7"></td>
            </tr>

          </table>
        </div>
      </div>
    </div>


    <div class="form-group">
      <label class="col-md-2 control-label">在即将创立的新企业中，你所拥有的所有权比例是</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q34" value="1" required> 0-25%
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q34" value="2"> 26-50%
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q34" value="3"> 51-75%
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q34" value="4"> 76-99%
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q34" value="5"> 100%
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label">与你创办新企业的共同创始人数量是</label>
      <div class="col-md-8">
        <div class="row">
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q35" id="partner" value="1" required> 0
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q35" class="flag" value="2"> 1
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q35" class="flag" value="3"> 2
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q35" class="flag" value="4"> 3
            </label>
          </div>
          <div class="radio col-sm-4">
            <label>
              <input type="radio" name="q35" class="flag" value="5"> >3
            </label>
          </div>
        </div>
      </div>
    </div>

    <div id="q35_sub">
      <div class="form-group">
        <label class="col-md-2 control-label">共同创始人中有多少是女性</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" id="q36" name="q36" value="1"> 0
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q36" value="2"> 1
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q36" value="3"> 2
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q36" value="4"> 3
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q36" value="5"> >3
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">共同创始人中有多少是你的亲戚</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" id="q37" name="q37" value="1" > 0
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q37" value="2"> 1
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q37" value="3"> 2
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q37" value="4"> 3
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q37" value="5"> >3
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-2 control-label">共同创始人中有多少是你的同学</label>
        <div class="col-md-8">
          <div class="row">
            <div class="radio col-sm-4">
              <label>
                <input type="radio" id="q38" name="q38" value="1" > 0
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q38" value="2"> 1
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q38" value="3"> 2
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q38" value="4"> 3
              </label>
            </div>
            <div class="radio col-sm-4">
              <label>
                <input type="radio" name="q38" value="5"> >3
              </label>
            </div>
          </div>
        </div>
      </div>

    </div>

    <div class="form-group">
      <label
        class="col-md-2 control-label">创办新企业的商业想法来源是？请选择最重要的来源渠道（可多选）</label>
      <div class="col-md-8">
        <div class="row">
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" id="q39" value="1" > 校内学习
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="2"> 学校中的科研项目
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="3"> 与其他同学的交流
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="4"> 校园外的实践活动（如工作实践）
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="5"> 其他或以前的工作经历
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="6"> 学校外的朋友
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="7"> 家庭成员
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="8"> 兴趣爱好
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="9"> 媒体（电视，网络等）
            </label>
          </div>
          <div class="checkbox col-sm-2">
            <label>
              <input type="checkbox" name="q39" value="10"> 其他
            </label>
          </div>
        </div>
      </div>
    </div>
    <input type="hidden" name="part" id="part" value="5">

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
<script type="text/javascript">

  $(function () {
    $(".flag").bind("click", function () {
      $("#q35_sub").show();
      $("#q36").attr("required","true");
      $("#q37").attr("required","true");
      $("#q38").attr("required","true");
    });

    $("#partner").bind("click", function () {
      $("#q35_sub").hide();
      $("#q36").removeAttr("required");
      $("#q37").removeAttr("required");
      $("#q38").removeAttr("required");
    });
  });

  function validateForm() {
    if($('input[name=q30]').is(':checked') !=true){
        $("#q30").closest(".form-group").addClass("has-error");
        $("html,body").animate({scrollTop: $("#q30").closest(".form-group").offset().top - 20});
        return false;
      }
      if($('input[name=q39]').is(':checked') !=true){
        $("#q39").closest(".form-group").addClass("has-error");
        $("html,body").animate({scrollTop: $("#q39").closest(".form-group").offset().top - 20});
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
