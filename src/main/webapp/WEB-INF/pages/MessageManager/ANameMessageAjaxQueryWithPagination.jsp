<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/17
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查收留言</title>
    <style rel="stylesheet">
        #maindiv {
            margin-top: 10px;
            width: 90%;
        }
    </style>
    <!--引入bootstrap的css文件-->
    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!--引入jquery，注意：jquery要在js文件之前引入，因为bootstrap使用了jquery框架-->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jQuery-1.12.4/jquery-1.12.4.js"></script>
    <!--引入bootstrap的js文件-->
    <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>-->
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <!-- 引入分页插件-->
    <link href="${pageContext.request.contextPath}/static/pagination-2.1.4/css/pagination.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/pagination-2.1.4/js/pagination.min.js"></script>

    <!--引入弹出模态框的插件-->
    <link href="${pageContext.request.contextPath}/static/BootstrapEx/css/bootstrapEx.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/BootstrapEx/js/bootstrapEx.js"></script>
    <%----%>
    <script type="text/javascript">
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        window.onload = function(){ doAjaxQuery();  }
        // 使用ajax进行查询
        function doAjaxQuery() {


            // 使用ajax进行查询
            $.ajax({
                type: "POST", // 请求类型

                url: "pNameSelectMessage", // 和form表单的 action属性一样

                data: $("#form1").serialize(),
                // 指定服务器响应的数据类型  json html xml text
                dataType: "json",
                success: function (data) { // ajax的请求成功的回调处理， data就是从服务器返回的影响内容
                    // 拼写需要显示的dom组件的内容
                    var strContent = "";

                    if (data) {
                        // 将ajax查询的json数据，使用分页插件进行处理

                        $('#myPaging').pagination({
                            dataSource: data, // 分页的数据源
                            pageSize: 6, // 每一页显示的记录条数
                            pageNumber: 1, // 开始定位在第1页
                            callback: function (eachPageData, pagination) { // 每次翻页的时候的回调函数
                                // 清空局部变量 strContent
                                strContent = "";

                                // 遍历data的json数据进行解析显示
                                $.each(eachPageData, function (index, eachValue) {
                                    strContent += "<tr>";
                                    strContent += "<th scope='row'>" + (index + 1) + "</th>";
                                    strContent += "<td>" + eachValue.aName + "</td>";
                                    strContent += "<td>" + eachValue.pName + "</td>";
                                    strContent += "<td>" + eachValue.mas + "</td>";
                                    strContent += "<td><button type=\"button\" class=\"btn btn-default\" onclick='showModal4Modify(" + JSON.stringify(eachValue) + ")'>回复</button></td>";
                                    strContent += "<td><button type=\"button\" class=\"btn btn-default\" onclick='deleteData(" + eachValue.masId + ")'>删除</button></td>";
                                    strContent += "</tr>";
                                });
                                // 显示每一页的内容
                                // 将拼接内容显示到指定的控件中
                                // 局部刷新浏览器的dom对象
                                $("#displayMe").html(strContent);
                            }
                        });
                    }
                    // console.info("ajax查询结果：")
                    // console.info(data);
                },
                error: function () {
                    console.log("ajax查询错误！")
                }
            });
        }

        //////////////////////////////////////////////////////////////////////////////////////

        // 显示修改的模态框
        function showModal4Modify(eachValue) {
            /*
            window.localStorage - 存储没有截止日期的数据:
            localStorage 对象存储的是没有截止日期的数据。当浏览器被关闭时数据不会被删除，在下一天、周或年中，都是可用的。
            window.sessionStorage - 针对一个 session 来存储数据（当关闭浏览器标签页时数据会丢失）
            sessionStorage 对象等同 localStorage 对象，不同之处在于只对一个 session 存储数据。如果用户关闭具体的浏览器标签页，数据也会被删除。
             */
            // 使用浏览器客户单缓存对象  sessionStorage   localStorage
            sessionStorage.setItem("eachRow", JSON.stringify(eachValue));
            // 定义模态框显示的页面的url
            //var targetUrl = "https://www.baidu.com/";
            // 修改页面因为在web-info下，需要跳转后台进行访问
            var targetUrl = "forward?pg=MessageManager/MessageModify";
            var Modal3 = InitModal3(targetUrl);
            Modal3.show();
        }

        //Modal嵌入页签页初始化处理
        function InitModal3(targetUrl) {
            $(document.body).append('<div id="modal3"></div>');
            var Modal3 = new Modal();
            Modal3.renderto = "#modal3";
            Modal3.InitShow = true;
            Modal3.btns = [{id: "btn_mes", text: "发送"}, {id: "closebtn"}]
            var tab1 = new Tab();
            Modal3.OnfirstInited = function (thismodal) {
                tab1.tabs = [{
                    id: "tabs1", title: "留言反馈", active: true, isiframe: true, url: targetUrl
                }];
                tab1.renderto = thismodal.body;
                tab1.Init();

                // 给保存按钮添加一个点击事件
                $("#btn_mes").click(function () {
                    // 使用jquery的选择器获取需要提交的form表单对象
                    console.log("modifyformmodifyformmodifyformmodifyformmodifyformmodifyform:::::");
                    console.log($("#modal3 iframe").contents().find("#modifyform"));
                    // 可以直接提交表单进行保存处理，
                    // 也可以使用ajax进行处理，需要注意：实现ajax下的文件上传
                    // 课下作业：使用ajax方式保存修改的数据，实现ajax下的文件上传
                    // form表单提交保存数据，不推荐；推荐使用ajax方式进行保存
                    var mas=$("#modal3 iframe").contents().find("#mas").val();
                    if (mas<1||mas>100)
                    {
                        alert("留言输入有误！限制字数为：1~100.");
                        mas.focus();
                        return false;
                    }
                    $("#modal3 iframe").contents().find("#modifyform").submit();

                });
            }

            return Modal3;
        }

        // 定义modal关闭之后的事件处理函数
        // 事件函数的命名时固定的：modal的id值_事件名
        function modal3_Hideend() {
            //alert("修改成功！");
            doAjaxQuery();
        }

        ////////////////////////////////////////////////////////////////////////////////////////////////////
        function deleteData(masId) {
            // 使用ajax删除数据
            var r = confirm("是否确定删除该记录？")
            if (r == true) {
                $.post("deleteMessageByID", {"masId": masId}, function (data) {
                    // 可以选择弹出框进行提示，也可以不作处理
                    if (data && data == "1") {
                        // 删除成功
                        alert("删除成功");
                        // 重新查询，更新数据
                        doAjaxQuery();

                    } else {
                        alert("删除失败");
                    }
                });
            }
        }
    </script>

</head>
<body>
<div id="maindiv" style="margin: 10px auto">
    <div id="formdiv">

        <form id="form1" class="form-horizontal">
            <input type="hidden" class="form-control" id="masId" name="masId">
            <input type="hidden" class="form-control" id="aName" name="aName" >
            <input type="hidden" class="form-control" id="pName" name="pName" value="<%=session.getAttribute("loginedname")%>" >

            <input type="hidden" class="form-control" id="mas" name="mas" >

            <div class="form-group">

                <div id="p_div2">

                    <button type="button" class="btn btn-default" onclick="doAjaxQuery()">查询</button>
                </div>
            </div>
        </form>
    </div>

    <div class="row" style="height: 310px;">
        <div class="col-sm-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>发送人</th>
                    <th>接收人</th>
                    <th>留言内容</th>
                    <th>回复</th>
                    <th>删除</th>
                </tr>
                </thead>
                <tbody id="displayMe">
                <%--此处有jquery通过ajax查询之后的回调函数进行局部刷新操作--%>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12" id="myPaging">
            <%--分页插件需要显示的内容，运行时动态添加--%>
        </div>
    </div>
</div>
</body>
</html>
