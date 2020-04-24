<%--
  Created by IntelliJ IDEA.
  User: 17612
  Date: 2020/4/10
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户登录</title>
    <!-- Fav  Icon Link -->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/static/Other/images/favicon.ico">
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
</div> -->
<!--/Pre Loader -->
<!-- Color Changer -->
<div class="theme-settings" id="switcher">
		<span class="theme-click">
			<span class="ti-settings"></span>
		</span>
    <span class="theme-color theme-default theme-active" data-color="green"></span>
    <span class="theme-color theme-blue" data-color="blue"></span>
    <span class="theme-color theme-red" data-color="red"></span>
    <span class="theme-color theme-violet" data-color="violet"></span>
    <span class="theme-color theme-yellow" data-color="yellow"></span>
</div>
<!-- /Color Changer -->
<div class="wrapper">
    <!-- Page Content  -->
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 auth-box">
                    <div class="lochana-box-shadow">
                        <h3 class="widget-title">普通用户登录</h3>
                        <form action="${pageContext.request.contextPath}/login_Average" method="post" class="widget-form">
                            <!-- form-group -->
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <input type="text" name="aName" placeholder="用户名" class="form-control" required="" data-validation="length alphanumeric" data-validation-length="3-12"
                                           data-validation-error-msg="User name has to be an alphanumeric value (3-12 chars)" data-validation-has-keyup-event="true">
                                </div>
                            </div>
                            <!-- /.form-group -->
                            <!-- form-group -->
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <input type="password" placeholder="密码" name="aPwd" class="form-control" data-validation="strength" data-validation-strength="2"
                                           data-validation-has-keyup-event="true">
                                </div>
                            </div>
                            <!-- /.form-group -->
                            <!-- Check Box -->
                            <div class="form-check row">
                                <div class="col-sm-12 text-left">
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" type="checkbox" id="ex-check-2">
                                        <label class="custom-control-label" for="ex-check-2">记住密码</label>
                                    </div>
                                </div>
                            </div>
                            <!-- /Check Box -->
                            <!-- Login Button -->
                            <div class="button-btn-block">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
                            </div>
                            <div class="button-btn-block">
                                <a href="index.jsp">返回</a>
                            </div>
                            <!-- /Login Button -->
                            <!-- Links -->
                            <div class="auth-footer-text">
                                <small>新用户，您好！请在这里
                                    <a href="${pageContext.request.contextPath}/into_Average2">注册</a> Here</small>
                            </div>
                            <!-- /Links -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Page Content  -->
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
    <%
      Object error=request.getAttribute("error_login");
      if(error!=null){
    %>
    var error=<%=error%>;
    if(error==1){
        alert("账号或密码错误，登录失败！");
    }
    <%}%>
</script>
</html>
