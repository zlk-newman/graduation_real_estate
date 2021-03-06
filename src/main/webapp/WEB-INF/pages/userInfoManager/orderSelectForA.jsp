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
    <title>历史订单</title>
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

                url: "selectAllHistoryForA", // 和form表单的 action属性一样

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
                                    strContent += "<td>" + eachValue.hId + "</td>";
                                    strContent += "<td><img width=\"64\" height=\"64\" src=\"${pageContext.request.contextPath}/" + eachValue.houseImg + "\" /> </td>";
                                    strContent += "<td>" + eachValue.houseName + "</td>";
                                    strContent += "<td>" + eachValue.aName + "</td>";
                                    strContent += "<td>" + eachValue.pName + "</td>";
                                    strContent += "<td>" + eachValue.price + "</td>";
                                    strContent += "<td><button type=\"button\" class=\"btn btn-default\" onclick='deleteData(" + eachValue.hId + ")'>取消订单</button></td>";
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

        ////////////////////////////////////////////////////////////////////////////////////////////////////
        function deleteData(hId) {
            // 使用ajax删除数据
            var r = confirm("是否确定取消该订单？")
            if (r == true) {
                $.post("deleteHistoryByID1", {"hId": hId}, function (data) {
                    // 可以选择弹出框进行提示，也可以不作处理
                    if (data && data == "1") {
                        // 删除成功
                        alert("取消成功");
                        // 重新查询，更新数据
                        doAjaxQuery();

                    } else {
                        alert("取消失败");
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
            <input type="hidden" class="form-control" id="hId" name="hId">
            <input type="hidden" class="form-control" id="aName" name="aName" value="<%=session.getAttribute("loginedname")%>">
            <input type="hidden" class="form-control" id="pName" name="pName" >

            <input type="hidden" class="form-control" id="price" name="price" >
            <input type="hidden" class="form-control" id="houseImg" name="houseImg" >
            <input type="hidden" class="form-control" id="houseName" name="houseName" >
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
                    <th>订单号</th>
                    <th>商品图片</th>
                    <th>商品名</th>
                    <th>用户</th>
                    <th>地产商</th>
                    <th>价格</th>
                    <th>取消订单</th>
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
