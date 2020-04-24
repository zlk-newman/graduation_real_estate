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
    <title>个人信息修改</title>
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
<%--  --%>
    <script type="text/javascript">

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

    <!-- action表示将表单提交到哪里-->
    <form id="form" action="${pageContext.request.contextPath}/updatePropertyUser2" method="post" class="widget-form" enctype="multipart/form-data">
        <input type="hidden" class="form-control" id="pId" name="pId" value="<%=session.getAttribute("loginedPid")%>">
        <div class="form-group row">
            <div class="col-sm-12">
                <div id="pimg"><img width="64" height="64" id="img"  src="${pageContext.request.contextPath}/<%=session.getAttribute("loginedPimg")%>" /></div>
                <input type="file" class="form-control" onchange="changepic(this)" id="userimg" accept="image/png,image/jpeg" name="file_pImg" placeholder="请选择头像">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pName" id="pName" class="form-control" value="<%=session.getAttribute("loginedname")%>" required>
            </div>
        </div>


        <div class="form-group row">
            <div class="col-sm-12">
                <input  type="password" placeholder="新密码" name="pPwd" class="form-control" id="input_pwd" >
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input  type="password" placeholder="确认密码" name="pwdcfm" class="form-control" id="input_pwd_cfm" >
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pPhone" value="<%=session.getAttribute("loginedPphone")%>" id="pPhone" type="text"  class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pEmil" value="<%=session.getAttribute("loginedPemil")%>" id="pEmil" type="text" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pAddress" value="<%=session.getAttribute("loginedPadd")%>" id="pAddress" type="text" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pCompany" value="<%=session.getAttribute("loginedPcom")%>" id="pCompany" type="text" class="form-control" required>
            </div>
        </div>

        <!-- Button -->
        <div class="button-btn-block">
            <button id="btn-submit" type="submit" class="btn btn-primary btn-lg btn-block">修改</button>
        </div>

    </form>
    <div class="button-btn-block">
        <a href="${pageContext.request.contextPath}/forward?pg=supplierInfoManager/PropertyWelcome"><button  class="btn btn-primary btn-lg btn-block" >取消</button></a>
    </div>
</div>
<script type="text/javascript">

    $(document).ready(function(){
        var input_pwd = $("#input_pwd");
        var input_pwd_cfm=$("#input_pwd_cfm");
        var pPhone=$("#pPhone");
        var pEmil=$("#pEmil");
        var pName=$("#pName");
        var pAddress=$("#pAddress");
        var pCompany=$("#pCompany");
        $("#btn-submit").click(function(){
            var pwd =input_pwd.val();
            var pwd_cfm =input_pwd_cfm.val();
            var Phonenumber = pPhone.val();
            var emil=pEmil.val();
            var pname=pName.val();
            var padd=pAddress.val();
            var pc=pCompany.val();
            if(checkPass(pwd)<3){
                alert("密码格式错误，请重新设置！需至少8位，且包含大小写字母和数字。");
                input_pwd.focus();
                return false;
            }else if (pwd != pwd_cfm) {//判断两次密码输入是否相同
                alert("两次密码输入不一致");
                input_pwd_cfm.focus();
                return false;
            }else if (!isPhoneNum(Phonenumber))
            {
                alert("手机号码输入不正确！");
                pPhone.focus();
                return false;
            }else if(!isEmilNum(emil)){
                alert("邮箱输入不正确！");
                pEmil.focus();
                return false;
            }else if(pname.length>10||pname.length<1){
                alert("用户名输入有误！限制字数为1~10.");
                pName.focus();
                return false;
            }else if(padd.length>50||padd.length<1){
                alert("地址输入有误！限制字数为1~50.");
                pAddress.focus();
                return false;
            }else if(pc.length>50||pc.length<1){
                alert("公司输入有误！限制字数为1~50.");
                pCompany.focus();
                return false;
            }
            //正常提交
            $("#form").submit();


        });
        function isPhoneNum(str) {
            return /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/.test(str);
        }
        function isEmilNum(str) {
            return /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(str);
        }
    });
    function checkPass(pass){
        if(pass.length < 8||pass.length>16)
        {
            return 0;
        }
        var str = 0;
        if(pass.match(/([a-z])+/))
        {
            str++;
        }
        if(pass.match(/([0-9])+/))
        {
            str++;
        }
        if(pass.match(/([A-Z])+/))
        {
            str++;
        }
        if(pass.match(/[^a-zA-Z0-9]+/))
        {
            str++;
        }
        return str;
    }

</script>
</body>
</html>
