<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>考勤管理系统</title>
    <script type="text/javascript" src="${path}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap-table.min.css" rel="stylesheet">
    <script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/locate/bootstrap-table-zh-CN.min.js"></script>
    <link href="${path}/static/bootstrap-3.3.7-dist/dateTime/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/dateTime/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/dateTime/moment-with-locales.js"></script>
    <script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/dateTime/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="${path}/app/user.js"></script>
    <script type="text/javascript" src="${path}/app/check.js"></script>
    <style>
        .myInput {
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>

<a href="/logout" style="position:absolute;right:5px;top:10px;z-index:999;">退出登录</a>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:void(0)">考勤管理</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="javascript:void(0)" id="employeeInfo">员工信息</a></li>
                <li><a href="javascript:void(0)" id="checkTime">打卡录入</a></li>
                <li><a href="javascript:void(0)" id="salay">工资计算</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="panel" id="panel1">
    <div id="toolbar" class="btn-group">
        <button id="addEmployee" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="updateEmployee" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="deleteEmployee" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <table id="user"></table>
</div>

<div class="panel" id="panel2" hidden="true">
    <div class="panel panel-default">
        <%--<div class="panel-heading">查询条件</div>--%>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:2px;margin-bottom: 2px">
                    <label class="control-label col-sm-1" for="name">姓名</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="name" style="width: 200px; height: 30px;">
                    </div>
                    <label for="age" class="col-sm-1 control-label">考勤日期</label>
                    <div class="col-sm-3">
                        <a class='input-group date'  style="float: left;">
                            <input type='text' class="form-control" id="checkdate" name="checkdate" onblur='showDate(this);' style="width: 150px; height: 30px;" />
                            <span class="input-group-addon" style="float: left; width: 50px; height: 30px;">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </a>
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <button type="button" style="margin-left:200px" id="btn_query" class="btn btn-primary">查询</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="checkToolBar" class="btn-group">
        <button id="checkIn" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>每日考勤
        </button>
    </div>
    <table id="checkList"></table>
</div>

<div class="panel" id="panel3" hidden="true">
    工资计算开发中。。。
</div>

<div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clearForm()">&times;</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" action="#" role="form" id="addForm" onsubmit="return addCommit()">
                    <div class="form-group">
                        <%--<label for="username" class="col-sm-2 control-label">名字</label>--%>
                        <div class="col-sm-10">
                            <input type="hidden" class="form-control" id="id" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" name="username" placeholder="请输入名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="usercode" class="col-sm-2 control-label">工号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="usercode" name="usercode" placeholder="请输入工号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="age" class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄">
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
                        <label for="age" class="col-sm-2 control-label">入职时间</label>
                        <div class="col-sm-10">
                            <a class='input-group date'  style="float: left;">
                                <input type='text' class="form-control" name="hiredate" id="hiredate" onblur='showDate(this);' style="width: 150px; height: 30px;" />
                                <span class="input-group-addon" style="float: left; width: 50px; height: 30px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </a>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-9 col-sm-3">
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="close" onclick="clearForm()">关闭</button>
                            <button type="submit" class="btn btn-primary">确定</button>
                        </div>
                    </div>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="checkModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clearForm()">&times;</button>
                <h4 class="modal-title" >员工考勤</h4>
            </div>
            <div class="modal-body" style="overflow-y:scroll; height: 400px">
                <table class="table table-bordered" id="checkTable">
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal" onclick="saveCheck()">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="warning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title " style="color: aqua">警告</h4>
            </div>
            <div class="modal-body" align="center" ><font color=" aqua" size="5px">请选择一行记录！</font></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title " style="color: aqua">提示</h4>
            </div>
            <div class="modal-body" align="center" ><font color=" aqua" size="5px">考勤成功！</font></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script>
 $("#employeeInfo").click(function () {
     $(this).parent().addClass("active");
     $("#checkTime").parent().removeClass("active");
     $("#salay").parent().removeClass("active");
     $("#panel1").show();
     $("#panel2").hide();
     $("#panel3").hide();
 })
 $("#checkTime").click(function () {
     $(this).parent().addClass("active");
     $("#employeeInfo").parent().removeClass("active");
     $("#salay").parent().removeClass("active");
     $("#panel1").hide();
     $("#panel2").show();
     $("#panel3").hide();
     $("#checkList").bootstrapTable('refresh');
 })
 $("#salay").click(function () {
     $(this).parent().addClass("active");
     $("#employeeInfo").parent().removeClass("active");
     $("#checkTime").parent().removeClass("active");
     $("#panel1").hide();
     $("#panel2").hide();
     $("#panel3").show();
 })
 
 $("#addEmployee").click(function () {
     $("#id").val(null);
     $("#myModalLabel").text("添加员工");
     $("#addModel").modal("show");
 });

 $("#updateEmployee").click(function () {
     var selections = $("#user").bootstrapTable("getAllSelections");
     if (selections.length == 1) {
         $("#id").val(selections[0].id);
         $("#username").val(selections[0].username);
         $("#usercode").val(selections[0].usercode);
         $("#age").val(selections[0].age);
         $("#hiredate").val(changeDateFormat(selections[0].hiredate));
         if (selections[0].sex == "男") {
            $("#man").prop("checked", true);
         } else {
             $("#woman").prop("checked", true);
         }
         $("#myModalLabel").text("更新员工");
         $("#addModel").modal("show");
     } else {
        $("#warning").modal("show");
     }
 });

$("#deleteEmployee").click(function () {
    var selections = $("#user").bootstrapTable("getAllSelections");
    if (selections.length == 1) {
        var params = {};
        params.id = selections[0].id;
        $.ajax({
            url: "employee/delete",
            data: params,
//            cache:false,//false是不缓存，true为缓存
//        async:true,//true为异步，false为同步
            success:function(result){
                $("#user").bootstrapTable('refresh');
                //请求成功时
                $("#close").click();
            },
            error:function(){
                //请求失败时
            }
        });
    } else {
        $("#warning").modal("show");
    }
})
 
 $("#checkIn").click(function () {
     var list;
     $.ajax({
         url: 'employee/list',
         async: false,
         data: {
             limit : 20,
             offset : 0
         },
         success:function(result){
             list = result.rows;
         },
         error:function(){
             //请求失败时
         }
     });
     var currentDate = changeDateFormat2(Date.parse(new Date()));
     var trHtml;
     for (index in list) {
         trHtml = trHtml + '<tr><td value='+ list[index].id+ ' name="employeeid" width="20%">' + list[index].username + '</td>';
         trHtml = trHtml + '<td name="worktime" width="20%"><input type="text" class="myInput" onchange="textChange(this)" /></td>';
         trHtml = trHtml + '<td name="checkdate" width="30%" value=' + currentDate +'>' + currentDate + '</td>';
         trHtml = trHtml + '<td name="remarks" width="30%"><input type="text" class="myInput" width="100%" onchange="textChange(this)" /></td></tr>';
     }

     var html = '<caption>考勤列表</caption><thead><tr><th>姓名</th><th>工作时间</th><th>日期</th><th>备注</th></tr></thead><tbody>';
     html = html + trHtml;
     html = html + '</tbody>';

     $("#checkTable").html(html);
     $("#checkModel").modal("show");
 })

 //设置日期时间控件
 function Datetime(input) {
     $($(input).parent()).datetimepicker({
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
     input.value = mydate;
 }

function showDate(input) {
    Datetime(input);
    $($(input).parent()).datetimepicker('show');
}

function addCommit() {
    var id = $("#id").val();
    var url = id ? 'employee/update' : 'employee/add';
    var data=$("#addForm").serialize();
    var submitData=decodeURIComponent(data,true);

    $.ajax({
        url: url,
        data:submitData,
//        cache:false,//false是不缓存，true为缓存
//        async:true,//true为异步，false为同步
        success:function(result){
            $("#user").bootstrapTable('refresh');
            //请求成功时
            $("#close").click();
        },
        error:function(){
            //请求失败时
        }
    });
    return false;
}

function clearForm() {
    $("#addForm")[0].reset();
}

function saveCheck() {
    var saveData = [];
    $("#checkTable").find('tbody').find("tr").each(function () {
        var trData = {};
        $(this).find('td').each(function () {
            var name = $(this).attr('name');
            var value = $(this).attr('value')
            trData[name]= value;
        })
        saveData.push(trData);
    });
    $.ajax({
        url: 'workcheck/checkData',
        data: {
            dataJson: JSON.stringify(saveData)
        },
        type: 'POST',
        success:function(result){
            if (result.success) {
                $("#checkList").bootstrapTable('refresh');
                $("#success").modal("show");
            }
        },
        error:function(){
            //请求失败时
        }
    })
}

function textChange(input) {
    $(input).parent().attr('value',input.value);
}
</script>
</body>
</html>