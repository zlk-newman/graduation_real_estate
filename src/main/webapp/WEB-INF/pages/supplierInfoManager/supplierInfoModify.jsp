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
    <title>客户信息修改</title>
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
            $("#pId").val(eachBean.pId);
            $("#pName").val(eachBean.pName);
            $("#pAddress").val(eachBean.pAddress);
            $("#pPhone").val(eachBean.pPhone);
            $("#pEmil").val(eachBean.pEmil);
            $("#pCompany").val(eachBean.pCompany);
            $("#img").attr('src', '${pageContext.request.contextPath}/'+eachBean.pImg);

            sessionStorage.removeItem("eachRow");

        });

        function changepic(obj) {
            //console.log(obj.files[0]);//这里可以获取上传文件的name
            var newsrc=getObjectURL(obj.files[0]);
            document.getElementById('img').src=newsrc;
        }
        //建立一個可存取到該file的url
        function getObjectURL(file) {
            var url = null ;
            // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
            if (window.createObjectURL!=undefined) { // basic
                url = window.createObjectURL(file) ;
            } else if (window.URL!=undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file) ;
            } else if (window.webkitURL!=undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file) ;
            }
            return url ;
        }
    </script>
</head>
<body>
<div id="maindiv">
    <div id="pimg"><img width="64" height="64" id="img" name="pImg" src="" /></div>
    <form id="modifyform" class="form-horizontal" action="${pageContext.request.contextPath}/updatePropertyUser1" method="post"
          enctype="multipart/form-data">
        <!--使用隐藏表单，保存主键字段；用于区分是新增还是修改-->
        <input type="hidden" class="form-control" id="pId" name="pId">

        <div class="form-group row">
            <div class="col-sm-12">
                <input type="file" class="form-control" onchange="changepic(this)" id="userimg" accept="image/png,image/jpeg" name="file_pImg" placeholder="重新选择头像">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pName" id="pName" placeholder="用户名" class="form-control" required>
            </div>
        </div>
        <input  type="hidden" placeholder="密码" name="pPwd" class="form-control" value="123456">
        <%--										id="input_pwd" data-validation-has-keyup-event="true">
        <%--								<div class="form-group row">--%>
        <%--									<div class="col-sm-12">--%>
        <%--										<input  type="password" placeholder="密码" name="pPwd" class="form-control" data-validation="strength" data-validation-strength="2"--%>
        <%--										id="input_pwd" data-validation-has-keyup-event="true">--%>
        <%--									</div>--%>
        <%--								</div>--%>
        <%--								--%>
        <%--								<div class="form-group row">--%>
        <%--									<div class="col-sm-12">--%>
        <%--										<input  type="password" placeholder="确认密码" name="pwdcfm" class="form-control" data-validation="strength"--%>
        <%--										id="input_pwd_cfm" data-validation-strength="2" data-validation-has-keyup-event="true">--%>
        <%--									</div>--%>
        <%--								</div>--%>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pPhone"  placeholder="手机号" id="pPhone" type="text"  class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pEmil" placeholder="邮箱" id="pEmil" type="text" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pAddress" placeholder="住址" id="pAddress" type="text" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pCompany" placeholder="公司" id="pCompany" type="text" class="form-control" required>
            </div>
        </div>


    </form>
</div>

</body>
</html>
