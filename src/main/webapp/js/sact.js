/**
 * Created by YHLS on 2017/5/19.
 */

var p = 1;  //初始化page
//自发活动列表页下拉预加载
$(".sactList").on("scroll", function () {
  var minHeight = $(this).get(0).scrollHeight - 500;
  if (minHeight <= $(this).scrollTop() + $(this).height()) {
    p++;
    $.ajax({
      type: "post",
      url: "moreSactList",
      datatype: "jason",
      data: {
        "page": p
      },
      success: function (data) {
        if (data.length < 10) {
          $(".sactList").off("scroll");
        }
        var str = "";
        for (var i = 0; i < data.length; i++) {
          var time = new Date(data[i].createTime);
          var m = time.getMonth() + 1;
          var d = time.getDate();
          str += "<li class='oneSact'>";
          str += "<h2 class='actTitle'>" + data[i].title + "</h2>";
          str += "<p class='aboutAct'>" + data[i].content + "</p>";
          str += "<div class='evaluate'>"
          str += "<img src='../images/heart.png' class='icon-heart'>"
          str += "<span class='list-liked'>" + data[i].numOfLiked + "</span>"
          str += "<img src='../images/momentComment.png' class='icon-comment'>"
          str += "<span class='list-comment'>" + data[i].numOfComment + "</span>"
          str += "</div>"
          str += "<input type='hidden' name='activityId' value='" + data[i].id + "'>";
          str += "<input type='hidden' name='nickname' value='" + data[i].nickname + "'>";
          str += "<input type='hidden' name='headImage' value='" + data[i].headImage + "'>";
          str += "<input type='hidden' name='numOfPeople' value='" + data[i].numOfPeople + "'>";
          str += "<input type='hidden' name='numOfCheck' value='" + data[i].numOfCheck + "'>";
          str += "<input type='hidden' name='createTime' value='" + m + "/" + d + "'>";
          str += "</li>";
        }
        $(".sactList").append(str);
      }
    });
  }
});

// 点击+号按钮打开发布活动层
$(".addBtn").on("click", function () {
  $(".postLayer").show();
  $(".actBox").addClass("blur");
});

// 发布新活动
$(".postLayer form button").on("click", function () {
  var $title = $(".sactTitle").val();
  var $content = $(".sactContent").val();
  var $numOfPeople = $(".people input").val();
  if ($numOfPeople == "") {
    $numOfPeople = "1";
  }
  $numOfPeople = parseInt($numOfPeople);
  if ($.trim($title) == "" || $title == null || $.trim($content) == "" || $content == null) {
    $(".tip").text("输入不能为空");
    return false;
  }
  $.ajax({
    type: "post",
    url: "saveActivities",
    datatype: "jason",
    data: {
      "title": $title,
      "content": $content,
      "numOfPeople": $numOfPeople
    },
    success: function (result) {
      $(".postLayer form ").hide().get(0).reset();
    }
  });
});

// 点击X号按钮关闭发布层,清空表单数据
$(".postLayer .closeBtn").on("click", function () {
  $(".postLayer").hide();
  $(".actBox").removeClass("blur");
  $(this).parent().get(0).reset();
});

// 点击提示关注页的确定按钮关闭该层
$(".payAttention button").on("click", function () {
//      $(".postLayer form").show();
//      $(".postLayer").hide();
//      $(".actBox").removeClass("blur");
  window.location.reload();
});

//点击活动列表中任一活动，打开活动详情页（左移）
$(".sactList").on("click", "li", function () {
  //清空评论区
  $(".aboutComment").html("");
  //转换按钮状态
  $(".btn-joinin").attr("btn", "1").text("参加");
  //替换图标
  $(".btn-praise img").attr("src", "../images/heart.png");
  //将活动的部分内容填充进去
  var activityId = $(this).find("input[name='activityId']").val();
  var title = $(this).find(" .actTitle").text();
  var content = $(this).find(".aboutAct").text();
  var numOfLiked = $(this).find(".list-liked").text();
  var numOfComment = $(this).find(".list-comment").text();
  var headImage = $(this).find("input[name='headImage']").val();
  var nickname = $(this).find("input[name='nickname']").val();
  var numOfPeople = $(this).find("input[name='numOfPeople']").val();
  //被查看次数+1
  var numOfCheck = $(this).find("input[name='numOfCheck']").val();
  numOfCheck = parseInt(numOfCheck);
  numOfCheck += 1;
  var createTime = $(this).find("input[name='createTime']").val();
  $(".actLayer h2").text(title);
  $(".originator > img").attr("src", headImage);
  $(".or-user").text(nickname);
  $(".or-time").text(createTime);
  $(".or-right span").text(numOfCheck);
  $(".actContent").text(content);
  $(".sact-liked").text(numOfLiked);
  $(".sact-comment").text(numOfComment);
  $(".numOfPeople span").text(numOfPeople);
  $(".state-btn input").val(activityId);
  //加载评论
  $.ajax({
    type: "POST",
    url: "sactCommentDetails",
    datatype: "jason",
    data: {
      "activityId": activityId
    },
    success: function (data) {
      if (data.length > 0) {
        var str = "";
        for (var i = 0; i < data.length; i++) {
          str += "<li class='comment-list'>";
          str += "<img src='" + data[i].headImage + "'>";
          str += "<span>" + data[i].nickname + "</span>";
          str += "<p>" + data[i].commentText + "</p>";
          str += "</li>";
        }
        $(".aboutComment").append(str);
      }
    }
  });

  $(".actLayer").addClass("moveleft");
  $(".state-btn").addClass("moveleft");
});

//点击标题隐藏活动详情（右移）
$(".actLayer h2").on("click", function () {
  $(".actLayer").addClass("moveright");
  $(".state-btn").addClass("moveright");
  setTimeout(function () {
    $(".actLayer").removeClass("moveleft moveright");
    $(".state-btn").removeClass("moveleft moveright");
  }, 500);
});

//点赞
$(".btn-praise").on("click", function () {
  var activityId = $(".state-btn input").val();
  var $parise = $(".sact-liked");
  $.ajax({
    type: "POST",
    url: "praise",
    datatype: "jason",
    data: {
      "activityId": activityId
    },
    success: function (data) {
      if (data == false) {
        //点赞数+1
        $parise.text(parseInt($parise.text()) + 1);
      }
      //替换图标
      $(".btn-praise img").attr("src", "../images/heart2.png");
    }
  });
});

//点击参加按钮打开是否参加确认页面
$(".btn-joinin").on("click", function () {
  var $join = $(".btn-joinin");
  if ($join.attr("btn") == "1") {
    $(".confirmLayer").show();
    var activityId = $(".state-btn input").val();
    $(".confirm input").val(activityId);
  }
});

//点击确认页的nobtn关闭确认页
$(".noBtn").on("click", function () {
  $(".confirmLayer").hide();
});

//点击确认页的okbtn确认参加活动
$(".okBtn").on("click", function () {
  $(".confirmLayer").hide();
  var activityId = $(".confirm input").val();
  var $num = $(".numOfPeople span");
  var $join = $(".btn-joinin");
  $.ajax({
    type: "POST",
    url: "join",
    datatype: "jason",
    data: {
      "activityId": activityId
    },
    success: function (data) {
      $join.attr("btn", "0");
      $join.text("已参加");
      if (data == false) {
        //活动人数+1
        $num.text(parseInt($num.text()) + 1);
      }
    }
  });
});

//点击评论弹出评论层
$(".btn-comment").on("click", function () {
  $(".commentLayer").show();
});

//点击退出按钮关闭评论层
$(".btn-leave").on("click", function () {
  $(".comment-textarea").attr("placeholder", "评论内容");
  $(".commentLayer").hide();
});

//提交评论
$("#comment-submit").on("click", function () {
  var $content = $(".comment-textarea");
  var contentText = $content.val();
  var activityId = $(".state-btn input").val();
  var $comment = $(".sact-comment");
  if (contentText == "" | contentText == null) {
    $content.attr("placeholder", "输入不能为空");
    return false;
  }
  $.ajax({
    type: "POST",
    url: "saveSactComment",
    data: {
      "activityId": activityId,
      "commentText": contentText
    },
    success: function (data) {
      $(".commentLayer").hide();
      //评论数+1
      $comment.text(parseInt($comment.text()) + 1);
      //插入新记录
      var str = "";
      str += "<li class='comment-list'>";
      str += "<img src='" + data.headImage + "'>";
      str += "<span>" + data.nickname + "</span>";
      str += "<p>" + contentText + "</p>";
//          str += "<img src='http://wx.qlogo.cn/mmopen/2ZOQOHfxjxIq8I5ls5KXkJKYMxZuzxTcWM5ibThBxzH5dYGfU5gawg4hl9iaZ8BKSUxib0SaOfEFl1q0ibjXKN1ib2Vb2vGz4ibvKc/0' >";
//          str += "<span>Alan</span>";
//          str += "<p>" + contentText + "</p>";
      str += "</li>";
      $(".aboutComment").append(str);
      $(".commentLayer form ").get(0).reset();
      $content.attr("placeholder", "评论内容");
    }
  });
});

//验证用户弹层
//首次参加活动的用户需要完善信息才能参加活动
$(".prefectUserinfo button").on("click", function () {
  var $pform = $(".prefectUserinfo form"),
    $p = $pform.find("p.tip"),
    $college = $pform.find("input[name='college']").val(),
    $phonenumber = $pform.find("input[name='phonenumber']").val();
  //提交验证
  if ($.trim($college) == "" || $college == null || $.trim($phonenumber) == "" || $phonenumber == null) {
    $p.text("输入不能为空");
    return false;
  } else if ($phonenumber.length != 11) {
    $p.text("请输入正确的手机号码");
    return false;
  }
  //提交表单并隐藏页面
  $.ajax({
    type: "post",
    url: "saveUserinfo",
    datatype: "jason",
    data: {
      "school": $college,
      "phone": $phonenumber
    },
    success: function () {
      $(".prefectLayer").hide();
    }
  });
});

