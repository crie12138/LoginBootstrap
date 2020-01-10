$(function ($) {
    // alert("hello");
    var $table = $('#utable');

    $table.bootstrapTable({
        height: '200px',
        url: 'user/findall',
        striped: true,
        pageNumber: 1,
        pagination: true,
        uniqueId: "id",
        sidePagination: 'client',
        search: true,
        searchOnEnterKey: true,
        searchAlign: 'left',//指定 搜索框 水平方向的位置
        showColumns: "true",//是否显示 内容列下拉框
        pageSize: 5,//单页记录数
        pageList: [5, 10],//可选择单页记录数
        paginationVAlign: 'top',//指定 分页条 在垂直方向的位置
        maintainSelected: true,//点击分页按钮或搜索按钮时，记住checkbox的选择项

        columns: [{
            field: 'select',
            checkbox: true,
            align: 'center',
            valign: 'middle'
        }, {
            title: '编号',
            field: 'id',
            align: 'center',
            valign: 'middle'
        }, {
            title: '用户名',
            field: 'username',
            align: 'center',
            valign: 'middle'
        }, {
            title: '性别',
            field: 'sex',
            align: 'center',
            valign: 'middle'
        }, {
            title: '年龄',
            field: 'age',
            align: 'center',
            valign: 'middle'
        }, {
            title: '电话',
            field: 'phone',
            align: 'center',
            valign: 'middle'
        }, {
            title: '住址',
            field: 'address',
            align: 'center',
            valign: 'middle'
        }]
    });

    // $('#update').on("click",function () {
    //     //清除表单数据
    //     $("#updateModal form")[0].reset();
    //     // $("#userName_revise_input").next("span").text("");
    //     var rows = $("#utable").bootstrapTable('getSelections');
    //     //修改框中用户信息回显
    //     var id = rows[0].id;
    //     var name = rows[0].username;
    //     var sex = rows[0].sex;
    //     var age = rows[0].age;
    //     var phone = rows[0].phone;
    //     var address = rows[0].address;
    //     var password = rows[0].password;
    //     //将id的值传递给修改按钮的属性，方便发送Ajax请求
    //     // $("#user_revise_btn").attr("edit-id",id);
    //     // var password=$(this).parent().parent().children("td").eq(7).text();
    //     $("#updatepid").val(id);
    //     $("#updateusername").val(name);
    //     $("#updatesex").val(sex);
    //     $("#updateage").val(age);
    //     $("#updatephone").val(phone);
    //     $("#updateaddress").val(address);
    //     $("#updatepassword").val(password);
    //     $("#updateModal").modal({
    //         backdrop: "static"
    //     })
    // });



    //删除
    $('#delete').on("click", function () {
        // var row=$.map($("#utable").bootstrapTable('getSelections'),function(row){
        //     return row ;
        // });
        var rows = $("#utable").bootstrapTable('getSelections');
        var ids = new Array();
        // for (var i = 0; i < row.length; i++) {
        //     //获取自定义table 的中的checkbox值
        //     var id=row[i].id;   //OTRECORDID这个是你要在列表中取的单个id
        //     myarray.push(id); //然后把单个id循环放到ids的数组中
        // }
        $(rows).each(function () {
            ids.push(this.id);
        });
        deleteMs(ids)

    })

    function deleteMs(ids) {
        $.ajax({
            url: "user/delPerson",
            type: "post",
            data: "ids=" + ids,
            dataType: "json",
            success: function (res) {
                // alert("返回的是："+msg);
                if (res.status == 0) {
                    alert("删除成功！");
                    $('#utable').bootstrapTable('refresh');
                } else {
                    alert("删除失败！");
                }
            }
        });
    }

    $('#updateModal').on('show.bs.modal', function (event) {
        //获取到触发modal的button
        var button = $(event.relatedTarget);
        //获取button的传入值
        var recipient = button.data('whatever');
        var rows = $("#utable").bootstrapTable('getSelections');
        //修改框中用户信息回显
        var id = rows[0].id;
        var name = rows[0].username;
        var sex = rows[0].sex;
        var age = rows[0].age;
        var phone = rows[0].phone;
        var address = rows[0].address;
        var password = rows[0].password;
        // console.log(recipient);
        //获取当前显示的modal
        var modal = $(this);
        //设置获取的值到输入框
        modal.find("#updatepid").val(id);
        modal.find("#updateusername").val(name);
        modal.find("#updatesex").val(sex);
        modal.find("#updateage").val(age);
        modal.find("#updatephone").val(phone);
        modal.find("#updateaddress").val(address);
        modal.find("#updatepassword").val(password);
    })

    $('#addModal').on('show.bs.modal', function (event) {
        //获取到触发modal的button
        var button = $(event.relatedTarget);
        //获取button的传入值
        var recipient = button.data('whatever');
        document.getElementById("ff_p").reset();
        //获取当前显示的modal
    })

})


//提交添加：
function myadd() {
    var username = $('#username').val();
    var sex = $('#sex').val();
    var age = $('#age').val();
    var phone = $('#phone').val();
    var address = $('#address').val();
    var password = $('#password').val();
    //实例化一个对象：
    var user = {"username": username, "sex": sex, "age": age, "phone": phone, "address": address, "password": password};
    //将对象转换成字符串
    var str = JSON.stringify(user);
    alert(str);
    $.ajax({
        type: "POST",
        url: "user/addPerson",
        data: {
            username: username,
            sex: sex,
            age: age,
            phone: phone,
            address: address,
            password: password
        },
        success: function (res) {
            if (res.status == 0) {
                alert("success");
                $('#utable').bootstrapTable('refresh');
                $('#ff_p').form('clear');
            } else {
                alert('添加失败');
            }

        }
    });
}

// //修改提交：
// function myb() {
//     var addpname = $('#updatepname').val();
//     var addpage = $('#updatepage').val();
//     //实例化一个对象：
//     var person = {"pname": addpname, "page": addpage};
//     //将对象转换成字符串
//     var str = JSON.stringify(person);
//     $.ajax({
//         type: "POST",
//         url: "/addPerson.action",
//         data: "str=" + str,
//         success: function (msg) {
//             if (msg == 1) {
//                 $('#cusTable').bootstrapTable('refresh');
//             } else {
//                 alert('修改失败');
//             }
//
//         }
//     });
// }

//提交添加：
function myupdate() {
    var id = $('#updatepid').val();
    var username = $('#updateusername').val();
    var sex = $('#updatesex').val();
    var age = $('#updateage').val();
    var phone = $('#updatephone').val();
    var address = $('#updateaddress').val();
    var password = $('#updatepassword').val();
    //实例化一个对象：
    var user = {"username": username, "sex": sex, "age": age, "phone": phone, "address": address, "password": password};
    //将对象转换成字符串
    var str = JSON.stringify(user);
    alert(str);
    $.ajax({
        type: "POST",
        url: "user/updatePerson",
        data: {
            id: id,
            username: username,
            sex: sex,
            age: age,
            phone: phone,
            address: address,
            password: password
        },
        success: function (res) {
            if (res.status == 0) {
                alert("success");
                $('#utable').bootstrapTable('refresh');
                $('#updateff_p').form('clear');
            } else {
                alert('添加失败');
            }

        }
    });
}

function searchUser(){
    var keyword = $("#keyword").val();
    var queryparam = {
        silent:true,
        query:{
            keyword:keyword
        }
    };
    $('#utable').bootstrapTable('refresh',queryparam);
}


