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
    <title>留言回复</title>
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
    <!--使用ajax将修改的数据进行显示-->
    <script type="text/javascript">
        // 使用ajax查询需要修改数据的信息
        // 使用jquery的dom ready事件，在页面加载完成之后就将数据进行查询
        $(function () {
            // 从浏览器缓存中将修改的数据取出
            var eachRow = sessionStorage.getItem("eachRow") || null;  // || null 相当于设置默认值为null
            // sessionStorage中缓存的是一个json的字符串形式，需要将字符串形式转换为json对象形式
            var eachBean = JSON.parse(eachRow);

            // 进行dom操作将需要修改的数据显示在修改页面的form表单中
            $("#pName").val(eachBean.aName);
            $("#aName").val(eachBean.pName);
            sessionStorage.removeItem("eachRow");

        });

    </script>
</head>
<body>
<div id="maindiv">
    <form id="modifyform" class="form-horizontal" action="${pageContext.request.contextPath}/intoAdminMessage" method="post"
          enctype="multipart/form-data">

        <div class="form-group row">
            <div class="col-sm-12">
                发送人：<input name="aName" id="aName" readonly="readonly"  class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                接收人：<input name="pName" id="pName" readonly="readonly" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                内容：<input name="mas" id="mas" type="text" class="form-control" required>
            </div>
        </div>


    </form>
</div>

</body>
</html>
