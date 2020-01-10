$(function ($) {
    $('#loginform').on('submit', function (e) {
        var username = $('#username').val();
        var password = $('#password').val();

        $.ajax({
            type: 'POST',
            url: 'user/index',
            dataType: 'json',
            timeout: 10000,
            cache: false,
            data:{
                username: username,
                password: password
            },
            success:function (res) {
                window.location.href = "user/turn";
                // if (res.status == 0) {
                //     window.location.href = "user/turn";
                // } else {
                //     alert("账号密码错误！请输入管理员账户！");
                // }
            },
            error: function () {
                alert("登录连接超时");
                // return false;
            }
        });

    });
    // return false;
});
