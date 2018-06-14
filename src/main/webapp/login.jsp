<%--suppress ALL --%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>welcome</title>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/dateTime/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/dateTime/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/dateTime/moment-with-locales.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/dateTime/bootstrap-datetimepicker.zh-CN.js"></script>
    <style>
    .vertical-center{
        position: absolute;
        top: 60%;
        left: 55%;
        transform: translate(-50%, -50%);
    }
    </style>

</head>
<body style="background-image: url(pic/tree.jpg);background-repeat: no-repeat;background-size:100%">
<div class="container vertical-center">
    <div class="col-md-6 col-md-offset-6" >
        <div class="panel panel-info col-md-10 col-md-offset-1" style="background-color:#f2f2f2;border: hidden">
            <div class="panel-body">
                <form action="${ctx}/success" class="form-horizontal">
                    <div class="form-group">
                        <label for="userName" class="col-sm-4 control-label "></label>
                        <div class="col-sm-8 input-group">
                            <span class="input-group-addon">用户</span>
                            <input type="text" class="form-control" id="userName" placeholder="userName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1" class="col-sm-4 control-label"></label>
                        <div class="col-sm-8 input-group">
                            <span class="input-group-addon">密码</span>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label for="exampleInputFile">File input</label>--%>
                        <%--<input type="file" id="exampleInputFile">--%>
                        <%--<p class="help-block">Example block-level help text here.</p>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-8">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" checked> 同意
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-8">
                            <button type="submit" id="btn_submit" class="btn btn-sm btn-success">登录</button>
                            <button class="btn btn-sm btn-success" id="register" onclick="return resgister()">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="warning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title " style="color: aqua">警告</h4>
            </div>
            <div class="modal-body" align="center" ><font color=" aqua" size="5px" id="warnText"></font></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clearForm()">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新用户注册</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" action="#" role="form" id="registerForm">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" name="username" placeholder="请输入名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="" name="password" placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="" name="address" placeholder="请输入地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input type="radio" name="sex" id="man" value="男" checked> 男 &nbsp;
                            <input type="radio" name="sex" id="woman" value="女" > 女
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <a class='input-group date' id='datetimepicker1' style="float: left;">
                                <input type='text' class="form-control" id='nowdate' name="birthday" onblur='showDate();' style="width: 150px; height: 30px;" />
                                <span class="input-group-addon" style="float: left; width: 50px; height: 30px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-9 col-sm-3">
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="close" onclick="clearForm()">关闭</button>
                            <button type="submit" class="btn btn-primary" onclick="return addUser()">注册</button>
                        </div>
                    </div>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">
    $("#btn_submit").click(function (btn) {
        var userName = $('#userName').val();
        var password = $('#exampleInputPassword1').val();
        if (userName.length < 2 || password.length < 2) {
            $("#warnText").text("请正确填写用户名或密码！！！");
            $("#warning").modal("show");
            return false;
        } else {
            return validateUser(userName, password);
        }
    })
    function validateUser(userName, password) {
        var isvalidate = false;
        $.ajax({
            url: '${ctx}/userValidate',
            async: false,
            data: {
                userName: userName,
                password: password
            },
            success: function (response) {
                if (response.success) {
                    isvalidate = true;
                } else {
                    $("#warnText").text("请正确填写用户名或密码！！！")
                    $("#warning").modal("show");
                }
            }
        })
        return isvalidate;
    }
    function resgister() {
        $("#registerModal").modal("show");
        return false;
    }

    function addUser() {
        var url = '${ctx}/register';
        var data=$("#registerForm").serialize();
        var submitData=decodeURIComponent(data,true);
        console.log(submitData)
        $.ajax({
            url: url,
            data:submitData,
            cache:false,//false是不缓存，true为缓存
//        async:true,//true为异步，false为同步
            success:function(result){
                console.log(result);
                //请求成功时
                $("#close").click();
                if (result.success) {
                    //isvalidate = true;
                    $("#warnText").text("注册成功！！！")
                    $("#warning").modal("show");
                } else {
                    $("#warnText").text("用户已经存在！！！")
                    $("#warning").modal("show");
                }
            },
            error:function(){
                //请求失败时
            }
        });
        return false;
    }

    function clearForm() {
        $("#registerForm")[0].reset();
    }

    //设置日期时间控件
    function Datetime() {
        $('#datetimepicker1').datetimepicker({
            language: 'zh-CN',//显示中文
            format: 'yyyy-mm-dd',//显示格式
            minView: "month",//设置只显示到月份
            initialDate: new Date(),
            autoclose: true,//选中自动关闭
            todayBtn: true,//显示今日按钮
            locale: moment.locale('zh-cn')
        });
        //默认获取当前日期
        var today = new Date();
        var nowdate = (today.getFullYear()) + "-" + (today.getMonth() + 1) + "-" + today.getDate();
        //对日期格式进行处理
        var date = new Date(nowdate);
        var mon = date.getMonth() + 1;
        var day = date.getDate();
        var mydate = date.getFullYear() + "-" + (mon < 10 ? "0" + mon : mon) + "-" + (day < 10 ? "0" + day : day);
        document.getElementById("nowdate").value = mydate;
    }

    function showDate() {
        Datetime();
        $('#datetimepicker1').datetimepicker('show');
    }
</script>
</body>
</html>