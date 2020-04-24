<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>旅行社用户注册页面</title>
	<!-- Fav  Icon Link -->
	<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/static/Other/images/favicon.png">
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/bootstrap.min.css">
	<!-- themify icons CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/themify-icons.css">
	<!-- Main CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/styles1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/green.css" id="style_theme">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/responsive1.css">

	<script src="${pageContext.request.contextPath}/static/Other/js/modernizr.min.js"></script>
</head>

<body class="auth-bg">

	<!-- /Color Changer -->
	<div class="wrapper">
		<!-- Page Content -->
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 auth-box">
						<div class="lochana-box-shadow">
							<!-- Page Title -->
							<h3 class="widget-title">普通用户注册</h3>
							<!-- /Page Title -->

							<!-- Form -->
							<!-- action表示将表单提交到哪里-->
							<form id="form" action="${pageContext.request.contextPath}/saveAverageUser" method="post" class="widget-form" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <div id="aimg"><img width="64" height="64" id="img"/></div>
                                        <input type="file" class="form-control" onchange="changepic(this)" accept="image/png,image/jpeg" id="userimg" name="file_aImg" placeholder="请选择头像">
                                    </div>
                                </div>

								<div class="form-group row">
									<div class="col-sm-12">
										<input name="aName" id="aName" placeholder="用户名" class="form-control" required>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-12">
										<input  type="password" placeholder="密码" name="aPwd" class="form-control" id="aPwd" required>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-sm-12">
										<input  type="password" placeholder="确认密码" name="pwdcfm" class="form-control" id="input_pwd_cfm" required>
									</div>
								</div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input name="aPhone" placeholder="手机号" class="form-control" id="aPhone" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input name="aEmil" placeholder="邮箱" class="form-control" id="aEmil" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input name="aAddress" placeholder="住址" class="form-control" id="aAddress"  required>
                                    </div>
                                </div>

								<!-- Button -->
								<div class="button-btn-block">
									<button id="btn-submit" type="submit" class="btn btn-primary btn-lg btn-block">注册</button>
								</div>
								<!-- /Button -->
								<!-- Linsk -->
								<div class="auth-footer-text">
									<small>已注册,
										<a href="${pageContext.request.contextPath}/into_Average1">登陆</a>点这里</small>
								</div>
								<!-- /Links -->
							</form>
							<!-- /Form -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Page Content -->
	</div>
	<!-- Jquery Library-->
	<script src="${pageContext.request.contextPath}/static/Other/js/jquery-3.2.1.min.js"></script>
	<!-- Popper Library-->
	<script src="${pageContext.request.contextPath}/static/Other/js/popper.min.js"></script>
	<!-- Bootstrap Library-->
	<script src="${pageContext.request.contextPath}/static/Other/js/bootstrap.min.js"></script>
	<!-- Custom Script-->
	<script src="${pageContext.request.contextPath}/static/Other/js/custom.js"></script>

</body>
<script type="text/javascript">
    //js有bug，表单提交按钮接收不到监听
    $(document).ready(function(){
        var aname=$("#aName");
        var input_pwd = $("#input_pwd");
        var input_pwd_cfm=$("#input_pwd_cfm");
        var aPhone=$("#aPhone");
        var aemil=$("#aEmil");
        var aadd=$("#aAddress");
        $("#btn-submit").click(function(){
            var name=aname.val();
            var pwd =input_pwd.val();
            var pwd_cfm =input_pwd_cfm.val();
            var Phonenumber=aPhone.val();
            var emil=aemil.val();
            var padd=aadd.val();
            //设置密码格式判断
            if(name.length<1||name.length>20){
                alert("用户格式错误，请重新设置！需1~20位。");
                aname.focus();
                return false;
            }else if(checkPass(pwd)<3){
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
                aPhone.focus();
                return false;
            }else if(!isEmilNum(emil)){
                alert("邮箱输入不正确！");
                aemil.focus();
                return false;
            }else if(padd.length>50||padd.length<1){
                alert("地址输入有误！限制字数为1~50.");
                aadd.focus();
                return false;
            }
            //正常提交
            $("#form").submit();
        });
    });
    function isPhoneNum(str) {
        return /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/.test(str);
    }
    function isEmilNum(str) {
        return /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(str);
    }


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
<script type="text/javascript">
    <%
      String error=request.getParameter("error_sign");
      if(error!=null){
    %>
    var error=<%=error%>;
    if(error==1){
        alert("用户名重复,注册失败！");
    }
    // else if(error==2){
    //   alert("邮箱已被使用");
    // }
    <%}%>
</script>
</html>