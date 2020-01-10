<%--
  Created by IntelliJ IDEA.
  User: Luo Shijie
  Date: 2019/12/29
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<base href="<%=basePath%>"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户信息</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
    <%--    <link rel="stylesheet" href="../css/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">--%>

<%--    用网络table解决版本问题--%>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css">

<%--        第一调用jQuery第二调用bootstrap第三调用table--%>
    <%--    <script src="../js/jquery-3.4.1.min.js"></script>--%>
    <%--    <script src="../js/bootstrap.min.js"></script>--%>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>

<%--        <script src="../js/usermanager.js"></script>--%>
<%--        <script src="js/usermanager.js"></script>--%>
    <script src="../../static/js/usermanager.js"></script>
    <%--    <script src="js/data.js"></script>--%>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        用户信息管理
    </div>

<%--    <div class="panel panel-default">--%>
<%--        <div class="panel-heading">查询条件</div>--%>
<%--        <div class="panel-body">--%>
<%--            <form id="formSearch" class="form-horizontal">--%>
<%--                <div class="form-group" style="margin-top:15px">--%>
<%--                    <label class="control-label col-sm-1" for="keyword">姓名</label>--%>
<%--                    <div class="col-sm-3">--%>
<%--                        <input type="text" class="form-control" id="keyword">--%>
<%--                    </div>--%>

<%--                    <div class="col-sm-4" style="text-align:left;">--%>
<%--                        <button type="button" onclick="searchUser()" id="btn_query" class="btn btn-primary">查询</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div id="toolbar" class="btn-group">
        <button id="add" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
            添加
        </button>
        <button id="update" type="button" class="btn btn-info" data-toggle="modal" data-target="#updateModal">
            修改
        </button>
        <button id="delete" type="button" class="btn btn-danger" >
            删除
        </button>
    </div>

</div>
    <table id="utable"></table>


<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="myModal">新增</h4>
            </div>
            <div class="modal-body">
                <form id="ff_p" method="post">
                    <div class="form-group">
                        <label for="username">姓名</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="姓名">
                    </div>

                    <div class="form-group">
                        <label for="sex">性别</label>
                        <input type="text" name="sex" class="form-control" id="sex" placeholder="性别">
                    </div>

                    <div class="form-group">
                        <label for="age">年龄</label>
                        <input type="text" name="age" class="form-control" id="age" placeholder="年龄">
                    </div>

                    <div class="form-group">
                        <label for="phone">电话号码</label>
                        <input type="text" name="phone" class="form-control" id="phone" placeholder="电话号码">
                    </div>

                    <div class="form-group">
                        <label for="address">住址</label>
                        <input type="text" name="address" class="form-control" id="address" placeholder="住址">
                    </div>

                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="text" name="password" class="form-control" id="password" placeholder="密码">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <button type="button" id="add_submit" class="btn btn-primary" data-dismiss="modal" onclick="myadd()"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true" ></span>添加</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="updatemyModalLabel">修改</h4>
            </div>
            <div class="modal-body">
                <form id="updateff_p" method="post">
                    <div class="form-group">
                        <label for="updatepid">id</label>
                        <input type="text" name="id" disabled="disabled" class="form-control" id="updatepid" placeholder="id" value=>
                    </div>
                    <div class="form-group">
                        <label for="updateusername">姓名</label>
                        <input type="text" name="username" class="form-control" id="updateusername" placeholder="姓名">
                    </div>

                    <div class="form-group">
                        <label for="updatesex">性别</label>
                        <input type="text" name="sex" class="form-control" id="updatesex" placeholder="性别">
                    </div>

                    <div class="form-group">
                        <label for="updateage">年龄</label>
                        <input type="text" name="age" class="form-control" id="updateage" placeholder="年龄">
                    </div>

                    <div class="form-group">
                        <label for="updatephone">电话号码</label>
                        <input type="text" name="phone" class="form-control" id="updatephone" placeholder="电话号码">
                    </div>

                    <div class="form-group">
                        <label for="updateaddress">住址</label>
                        <input type="text" name="address" class="form-control" id="updateaddress" placeholder="住址">
                    </div>

                    <div class="form-group">
                        <label for="updatepassword">密码</label>
                        <input type="text" name="password" class="form-control" id="updatepassword" placeholder="密码">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <button type="button" id="btn_update" class="btn btn-primary" data-dismiss="modal" onclick="myupdate()"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true" ></span>确认</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
