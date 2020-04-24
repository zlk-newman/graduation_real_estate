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
    <title>我的收藏</title>
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

                url: "selectAllCollection", // 和form表单的 action属性一样

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
                                    strContent += "<td><img width=\"64\" height=\"64\" src=\"${pageContext.request.contextPath}/" + eachValue.colImg + "\" /> </td>";
                                    strContent += "<td>" + eachValue.colName.substring(5) + "</td>";
                                    strContent += "<td>" + eachValue.aName + "</td>";
                                    strContent += "<td><button type=\"button\" class=\"btn btn-default\" onclick='showModal4Modify(" + JSON.stringify(eachValue) + ")'>查看详情</button></td>";
                                    strContent += "<td><button type=\"button\" class=\"btn btn-default\" onclick='deleteData(" + eachValue.colId + ")'>取消收藏</button></td>";
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

        // 显示修改的模态框
        function showModal4Modify(eachValue) {
            var select=eachValue.colName.substring(0,5);
            if(select==="Hand."){
                $("#handName").val(eachValue.colName.substring(5));
                $("#form2").submit();
            }if(select==="Comm.") {
                $("#comName").val(eachValue.colName.substring(5));
                $("#form3").submit();
            }

        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        function deleteData(colId) {
            // 使用ajax删除数据
            var r = confirm("是否确定取消该订单？")
            if (r == true) {
                $.post("deleteCollectionByID", {"colId": colId}, function (data) {
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
            <input type="hidden" class="form-control" id="colId" name="colId">
            <input type="hidden" class="form-control" id="aName" name="aName" value="<%=session.getAttribute("loginedname")%>">
            <input type="hidden" class="form-control" id="colImg" name="colImg" >
            <input type="hidden" class="form-control" id="colName" name="colName" >
            <div class="form-group">

                <div id="p_div2">

                    <button type="button" class="btn btn-default" onclick="doAjaxQuery()">查询</button>
                </div>
            </div>
        </form>
    </div>
    <form id="form2" class="form-horizontal" action="${pageContext.request.contextPath}/selectHandOne">
        <input name="handImg" placeholder="照片" id="handImg" type="hidden" class="form-control" required>
        <input name="handNumber" placeholder="房产数量" id="handNumber" type="hidden" class="form-control" required>
        <input name="handDescribe" type="hidden" placeholder="房产描述" id="handDescribe" class="form-control" >
        <input name="handColnum"  id="handColnum" type="hidden" value="0" class="form-control" required>
        <input name="pName"  id="pName" type="hidden" class="form-control" >
        <input name="handName" id="handName" type="hidden" placeholder="二手房名称" class="form-control" required>
        <input name="handPrice" id="handPrice" type="hidden" placeholder="价格" class="form-control" required>
        <input name="handAddress" type="hidden" placeholder="房产地址" id="handAddress"  class="form-control" required>
        <input name="handAge" type="hidden" placeholder="房龄" id="handAge" class="form-control" required>
    </form>
    <form id="form3" class="form-horizontal" action="${pageContext.request.contextPath}/selectComOne">
        <input name="comImg" placeholder="照片" id="comImg" type="hidden" class="form-control" required>
        <input name="comNumber" placeholder="房产数量" id="comNumber" type="hidden" class="form-control" required>
        <input name="comDescribe" type="hidden" placeholder="房产描述" id="comDescribe"  class="form-control" >
        <input name="comColnum"  id="comColnum" type="hidden" value="0" class="form-control" required>
        <input name="comName" id="comName" type="hidden" placeholder="商品房名称" class="form-control" required>
        <input name="comPrice" id="comPrice" type="hidden" placeholder="价格" class="form-control" required>
        <input name="comAddress"  placeholder="房产地址" id="comAddress" type="hidden"  class="form-control" required>
        <input name="comAge" placeholder="房龄" id="comAge" type="hidden" class="form-control" required>

    </form>
    <div class="row" style="height: 310px;">
        <div class="col-sm-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>商品图片</th>
                    <th>商品名</th>
                    <th>用户</th>
                    <th>查看详情</th>
                    <th>取消收藏</th>
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
