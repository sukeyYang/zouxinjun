/**
 * Created by YHLS on 2017/5/19.
 */

//底部菜单栏的信封按钮上红点提示信息为0则不显示
// var userRecord = ${userRecord};
if (userRecord != null && userRecord != 0) {
  $(".tabBar-mail").append("<span class='prompt abs'>" + userRecord + "</span>");
}
var $redDot = $(".tabBar-mail .prompt");
if ($redDot.text() == "0" || $redDot.text() == null || $redDot.text() == "") {
  $redDot.hide();
}

//点击底部菜单栏的信封按钮，如果有小红点提示信息就隐藏小红点
$(".tabBar-mail").on("click", function () {
  if ($(this).find("span")) {
    $(this).find("span").remove();
  }
  window.location.href = "message";
});

var p = 1;  //初始化page
//信件列表页下拉预加载
$(".letterList").on("scroll", function () {
  var minHeight = $(this).get(0).scrollHeight - 100;
  if (minHeight <= $(this).scrollTop() + $(this).height()) {
    p++;
    $.ajax({
      type: "post",
      url: "moreLetters",
      datatype: "jason",
      data: {
        "page": p
      },
      success: function (data) {
        if (data.length < 10) {
          $(".letterList").off("scroll");
        }
        var str = "";
        for (var i = 0; i < data.length; i++) {
          str += "<li takeaway='0' class='oneLetter'>";
          str += "<h2>" + data[i].title + "</h2>";
          str += "<p>" + data[i].school + "</p>";
          str += "<input type='hidden' name='content' value='" + data[i].content + "'>";
          str += "<input type='hidden' name='phone' value='" + data[i].phone + "'>";
          str += "<input type='hidden' name='openid' value='" + data[i].openid + "'>";
          str += "<input type='hidden' name='nickname' value='" + data[i].nickname + "'>";
          str += "<input type='hidden' name='letterid' value='" + data[i].id + "'>";
          str += "<div class='bg-mail1'></div>";
          str += "<div class='bg-mail2'></div>";
          str += "</li>";
        }
        $(".letterList").append(str);
      }
    });
  }
});

// var flag = ${flag};  //拆信机会
// 点击信件，判断是否还有拆信机会，若有机会确认层弹出,同时在在信件详情信填充对应数据
$(".mailBox ul").on("click", "li", function () {
  //填充信件详情（不可见）
  var title = $(this).find("h2").text();
  var content = $(this).find("input[name='content']").val();
  var phone = $(this).find("input[name='phone']").val();
  var sender = $(this).find("input[name='sender']").val();
  var letterId = $(this).find("input[name='letterId']").val();
  var $mail = $(".mailContent");
  $mail.find("h2").text(title);
  $mail.find(".textcontent").text(content);
  $mail.find(".contactWay span").text(phone);
  $mail.find("input[name='sender']").val(sender);
  $mail.find("input[name='letterId']").val(letterId);

  var takeaway = $(this).attr("takeaway");
  if (takeaway == 0) {
    //判断是否还有拆信机会,如无机会进行提示
    if (flag == 0) {
      $(".chance0").show().fadeOut(2000);
      return false;
    } else {
      $(".confirmLayer").show(); //显示确认层
    }
  } else if (takeaway == 1) {
    $(".mailLayer").show();
    $(".mailBox").addClass("blur");
  }
})

// 点击X按钮关闭确认层
$(".confirm .noBtn").on("click", function () {
  $(".confirmLayer").hide();
});

// 点击勾按钮关闭确认层，打开信件内容层并提交数据
$(".okBtn").on("click", function () {
  var sender = $(".mailContent input[name='sender']").val();
  var letterId = $(".mailContent input[name='letterId']").val();
  $.ajax({
    type: "post",
    url: "userReceive",
    datatype: "jason",
    data: {
      "sender": sender,
      "letterId": letterId
    },
    success: function () {
      $(".mailBox li").find("input[value='" + letterId + "']").parent().attr("takeaway", "1");
      $(".confirmLayer").hide();
      $(".mailLayer").show();
      $(".mailBox").addClass("blur");
      flag--;
    }
  })
});

// 第一次点击勾按钮，拆信机会-1提示层淡出
$(".okBtn").one("click", function () {
  $(".chance").fadeOut(2000);
});

// 点击信件内容层的完成按钮关闭弹层
$(".mailLayer button").on("click", function () {
  $(".mailLayer").hide();
  $(".mailBox").removeClass("blur");
});

// 点击+号按钮打开发布信息及提示关注层
$(".addBtn").on("click", function () {
  $(".postLayer").show();
  $(".mailBox").addClass("blur");
  $(".chance0").hide();
});

// 点击X号按钮关闭发布信息及提示关注层,清空表单数据
$(".postLayer .closeBtn").on("click", function () {
  $(".postLayer").hide();
  $(".mailBox").removeClass("blur");
  $(this).parent().get(0).reset();
});

// 点击表单的发布按钮异步提交数据并执行回调函数
$(".postLayer form button").on("click", function () {
  var $title = $(".postLayer form input[name='title']").val();
  var $content = $(".postLayer form textarea").val();
//					$phonenumber = $(".postLayer form input[name='phonenumber']").val(),
//					$address = $(".postLayer form input[name='address']").val();
  if ($.trim($title) == "" || $title == null || $.trim($content) == "" || $content == null) {
    $(".tip").text("输入不能为空");
    return false;
  }
  $.ajax({
    type: "post",
    url: "saveLetter",
    datatype: "jason",
    data: {
      "title": $(".postLayer form input[name='title']").val(),
      "content": $(".postLayer form textarea").val()
    },
    success: function (result) {
      $(".postLayer form ").hide().get(0).reset();
      flag++;
    }
  });
});

// 点击提示关注页的确定按钮关闭该层
$(".payAttention button").on("click", function () {
//      $(".postLayer form").show();
//      $(".postLayer").hide();
//      $(".mailBox").removeClass("blur");
  window.location.reload();
});

//验证用户弹层
//首次参加活动的用户需要完善信息才能参加活动
$(".prefectUserinfo button").on("click", function () {
  var $pform = $(".prefectUserinfo form"),
    $p = $pform.find("p.tip"),
    $college = $pform.find("input[name='college']").val(),
    $phonenumber = $pform.find("input[name='phonenumber']").val(),
    $wechatId = $pform.find("input[name='wechatuser']").val();
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
      "phone": $phonenumber,
      "wechatId": $wechatId
    },
    success: function () {
      $(".prefectLayer").hide();
    }
  });
});
