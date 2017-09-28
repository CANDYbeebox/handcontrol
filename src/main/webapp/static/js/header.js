/**
 * Created by try on 2017/9/25.
 */
function confirmmima() {
    if($("#xinmima").val()==$("#querenmima").val())
    {
        var s1=hex_md5($("#xinmima").val()).toUpperCase();
        var s2=hex_md5($("#yuanmima").val()).toUpperCase();
        $.ajax({
            type: 'post',
            url: 'resetPassword.do',
            // data: $("#register_form").serialize(),
            data:{
                // xinmima: hex_md5($("#xinmima").val()).toUpperCase(),
                // yuanmima: hex_md5($("#yuanmima").val()).toUpperCase(),
                newPassword:s1,
                oldPassword:s2,
            },
            success: function (data) {
                if(data=="正确")
                {
                    sweetAlert("已修改成功");
                    $('#resetpassword').modal('hide');
                }
                else if(data=="错误")
                {
                    sweetAlert("未修改成功，旧密码不正确");
                    $("#xinmima").val("");
                    $("#querenmima").val("");
                    $("#yuanmima").val("");
                    // $('#resetpassword').modal('hide');
                }
            }
        });
    }
    else
    {
        sweetAlert("请确保新密码两次输入一致");
        $("#querenmima").val("");
        $("#xinmima").val("");
    }
}
