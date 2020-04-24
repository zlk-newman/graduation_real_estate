<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>发送留言</title>
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

	<div class="wrapper">
		<!-- Page Content -->
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 auth-box">
						<div class="lochana-box-shadow">
							<!-- 给管理员发送留言-->
							<h3 class="widget-title">网站意见</h3>
							<!-- /Page Title -->

							<!-- Form -->
							<!-- action表示将表单提交到哪里-->
							<form id="form" action="${pageContext.request.contextPath}/intoAdminMessage" method="post" class="widget-form" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        发送人：<input name="aName" id="aName" readonly="readonly" value="<%=session.getAttribute("loginedname")%>" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        接收人：<input name="pName" id="pName" readonly="readonly" value="admin" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        内容：<input name="mas" id="mas" type="text" class="form-control" required>
                                    </div>
                                </div>

								<!-- Button -->
								<div class="button-btn-block">
									<button id="btn-submit" type="submit" class="btn btn-primary btn-lg btn-block">发送</button>
								</div>
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

    <script type="text/javascript">
        $(document).ready(function(){
            var mas=$("#mas").val();
            $("#btn-submit").click(function(){
                if (mas==null)
                {
                    alert("留言不可以为空！")
                    mas.focus();
                    return false;
                }
                //正常提交
                $("#form").submit();
            });
        });
    </script>
	
</body>

</html>