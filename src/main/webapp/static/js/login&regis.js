/**
 * Created by sure on 2017/3/22.
 */
//重置
$('#regist_reset').click(function(){
    $("#username_right").attr("style","display:none");
    $("#password_again_right").attr("style","display:none");
    $("#password_right").attr("style","display:none");
});


//登陆
$('#login').click(function(){
    // $("#password").val();
    // alert($("#password").val());
    // alert(hex_md5($("#password").val()));
    saveUserInfo();
    $.ajax({
        type: 'post',
        url: 'login.do',
        data: {
            account:$("#username").val(),
            password:hex_md5($("#password").val()).toUpperCase(),//密码经过加密
        },
        // data: $("#log_form").serialize(),
        success: function(data) {
           // alert("11233");
            if(data=="错误")
                sweetAlert("用户名或密码错误");
            if(data=="正确")
                window.location.href="choose.do";
        }
    });
});

$('#register').click(function(){
    {
        $.ajax({
            type: 'post',
            url: 'register.do',
            // data: $("#register_form").serialize(),
            data:{
                register_mail:$("#register_mail").val(),
                username_register:$("#username_register").val(),
                password_register:hex_md5($("#password_register").val()).toUpperCase(),
            },
            success: function(data) {
                alert(data);
                if(data=="ok")
                {
                    sweetAlert("注册成功，2s自动返回登陆");
                    setTimeout(function () {
                        window.location.href="entrance.jsp";
                    },2000);
                //    window.location.href="login_register.html";
                }
            }
        });
    }
});
function check_findmail() {
    var s=$("#find_email").val();
    if(s.indexOf("@")==-1)
    {
        sweetAlert("请注意邮箱格式");
        // $("#find_email").val("");
    }
}
function check_email() {
    var s=$("#register_mail").val();
    if(s.indexOf("@")!=-1)
    {
        $("#register_right").attr("style","display:block");
    }
    else
    {
        $("#register_right").attr("style","display:none");
        sweetAlert("请输入正确的邮箱");
    }

}

function check_username() {
    var s=$("#username_register").val();
    if(s!="")
    {
        $.ajax({
            type: 'post',
            url: 'check_username.do',
            data: {account:s},
            success: function(data) {
                if(data=="重复")
                {
                    sweetAlert("该用户名已存在");
                    $("#username_register").val("");
                    $("#username_right").attr("style","display:none");
                }
                else
                    $("#username_right").attr("style","display:block");
            }
        });
    }
    else
        $("#username_right").attr("style","display:none");
}

function done_password() {
    if($("#password_register").val()=="")
        $("#password_right").attr("style","display:none");
    else
        $("#password_right").attr("style","display:block");
}

function check_password() {
    var s_password=$("#password_register").val();
    var s_password_again=$("#password_again").val();
    if(s_password_again!="")
    {
        if(s_password==s_password_again)
        {
            $("#password_again_right").attr("style","display:block");
        }
        else
        {
            sweetAlert("请保持前后密码一致");
            $("#password_again_right").attr("style","display:none");
        }
    }
    else
        $("#password_again_right").attr("style","display:none");
}

// 保存用户cookie
$(document).ready(function() {
    if ($.cookie("rmbUser") == "true") {
        $("#rmbUser").attr("checked", true);
        $("#username").val($.cookie("userName"));
        $("#password").val($.cookie("passWord"));
    }
});

function saveUserInfo() {
    // if ($("#rmbUser").attr("checked") == true)
    if($("#rmbUser").is(':checked')){
        var userName = $("#username").val();
        var passWord = $("#password").val();
        $.cookie("rmbUser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie
        $.cookie("userName", userName, { expires: 7 }); // 存储一个带7天期限的 cookie
        $.cookie("passWord", passWord, { expires: 7 }); // 存储一个带7天期限的 cookie
    }
    else {
        $.cookie("rmbUser", "false", { expires: -1 });
        $.cookie("userName", '', { expires: -1 });
        $.cookie("passWord", '', { expires: -1 });
    }
}

function findpassword() {
    var s=$("#find_email").val();
    // alert(s);
    $.ajax({
        type: 'post',
        url: 'findPassword.do',
        // data: $("#register_form").serialize(),
        data:{
            email:s,
        },
        success: function(data) {
            if(data=="已成功")
            {
                sweetAlert("已发送密码邮件到您邮箱，请注意查收");
                setTimeout(function () {
                    window.location.href="login_register.jsp";
                },2000);
            }
            if(data=="无该邮箱")
            {
                sweetAlert("请确认输入了正确的邮箱");
            }
        }
    });
}