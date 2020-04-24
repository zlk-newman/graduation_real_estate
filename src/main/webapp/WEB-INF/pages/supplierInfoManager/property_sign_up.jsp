<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>客户添加页面</title>
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
	<!-- Pre Loader -->
	<!-- <div class="loading">
		<div class="spinner">
			<div class="double-bounce1"></div>
			<div class="double-bounce2"></div>
		</div>
	</div>
	/Pre Loader -->
<%--	<!-- Color Changer -->--%>
<%--	<div class="theme-settings" id="switcher">--%>
<%--		<span class="theme-click">--%>
<%--			<span class="ti-settings"></span>--%>
<%--		</span>--%>
<%--		<span class="theme-color theme-default theme-active" data-color="green"></span>--%>
<%--		<span class="theme-color theme-blue" data-color="blue"></span>--%>
<%--		<span class="theme-color theme-red" data-color="red"></span>--%>
<%--		<span class="theme-color theme-violet" data-color="violet"></span>--%>
<%--		<span class="theme-color theme-yellow" data-color="yellow"></span>--%>
<%--	</div>--%>
<%--	<!-- /Color Changer -->--%>
	<div class="wrapper">
		<!-- Page Content -->
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 auth-box">
						<div class="lochana-box-shadow">
							<!-- Page Title -->
							<h3 class="widget-title">添加商家</h3>
							<!-- /Page Title -->

							<!-- Form -->
							<!-- action表示将表单提交到哪里-->
							<form id="form" action="${pageContext.request.contextPath}/savePropertyUser" method="post" class="widget-form" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <img width="64" height="64" id="img" src="" />
                                        <input type="file" class="form-control" onchange="changepic(this)" id="userimg" accept="image/png,image/jpeg" name="file_pImg" placeholder="请选择头像">
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

								<!-- Button -->
								<div class="button-btn-block">
									<button id="btn-submit" type="submit" class="btn btn-primary btn-lg btn-block">添加</button>
								</div>
							</form>
                            <div class="button-btn-block">
                                <a href="${pageContext.request.contextPath}/forward?pg=supplierInfoManager/supplierInfoAjaxQueryWithPagination" ><button   class="btn btn-primary btn-lg btn-block">返回</button></a>
                            </div>
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
	
	 <script type="text/javascript">
	   $(document).ready(function(){
		  // var pName = $("#input_pwd");
		  // var input_pwd_cfm=$("#input_pwd_cfm");
           var pPhone=$("#pPhone");
           var pEmil=$("#pEmil");
           var pName=$("#pName");
           var pAddress=$("#pAddress");
           var pCompany=$("#pCompany");
		  $("#btn-submit").click(function(){

                  var Phonenumber = pPhone.val();
                  var emil=pEmil.val();
                  var pname=pName.val();
                  var padd=pAddress.val();
                  var pc=pCompany.val();
                  if (!isPhoneNum(Phonenumber))
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
	   });

       function isPhoneNum(str) {
           return /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/.test(str);
       }
       function isEmilNum(str) {
           return /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(str);
       }
       function changepic(obj) {

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
   <%}%>
</script>
	
</body>

</html>