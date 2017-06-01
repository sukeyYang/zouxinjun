/**
 * Created by YHLS on 2017/5/19.
 */

//点击信息列表中任一项，打开活动详情页（左移）
$(".sactMessage").on("click", ".aboutMessage", function () {
  //清空评论区
  $(".aboutComment").html("");
  //转换按钮状态
  $(".btn-joinin").attr("btn", "1").text("参加");
  //替换图标
  $(".btn-praise img").attr("src", "../images/heart.png");
  //将活动的部分内容填充进去
  var activityId = $(this).find("input[name='activityId']").val();
  var title = $(this).find("input[name='title']").val();
  var content = $(this).find("input[name='content']").val();
  var numOfLiked = $(this).find("input[name='numOfLiked']").val();
  var numOfComment = $(this).find("input[name='numOfComment']").val();
  var headImage = $(this).find("img").attr("src");
  var nickname = $(this).find("input[name='nickname']").val();
  var numOfPeople = $(this).find("input[name='numOfPeople']").val();
  //被查看次数+1
  var numOfCheck = $(this).find("input[name='numOfCheck']").val();
  numOfCheck = parseInt(numOfCheck);
  numOfCheck += 1;
  var createTime = $(this).find(".s-time").text();
  $(".actLayer h2").text(title);
  $(".originator > img").attr("src", headImage);
  $(".or-user").text(nickname);
  // $(".or-time").text(m + "-" + d);
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
      //评论数+1
      $comment.text(parseInt($comment.text()) + 1);
      //插入新记录
      var str = "";
      str += "<li class='comment-list'>";
      str += "<img src='" + data.headImage + "'>";
      str += "<span>" + data.nickname + "</span>";
      str += "<p>" + contentText + "</p>";
      str += "</li>";
      $(".aboutComment").append(str);
      $(".commentLayer form ").get(0).reset();
      $content.attr("placeholder", "评论内容");
      $(".commentLayer").hide();
    }
  });
});
