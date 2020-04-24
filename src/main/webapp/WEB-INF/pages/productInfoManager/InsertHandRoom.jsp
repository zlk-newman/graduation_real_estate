<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>二手房添加页面</title>
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
							<!-- Page Title -->
							<h3 class="widget-title">添加二手房</h3>
							<!-- /Page Title -->

							<!-- Form -->
							<!-- action表示将表单提交到哪里-->
							<form id="form" action="${pageContext.request.contextPath}/saveHand" method="post" class="widget-form" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <img width="64" height="64" id="img" src="" />
                                        <input type="file" class="form-control" onchange="changepic(this)" id="handimg" accept="image/png,image/jpeg" name="file_handImg" placeholder="请选择二手房图片">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input name="handName" id="handName" placeholder="二手房名称" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input name="handPrice" id="handPrice" placeholder="价格" onkeyup="if( ! /^\d*(?:\.\d{0,2})?$/.test(this.value)){alert('只能输入数字，小数点后只能保留两位');this.value='';}"  class="form-control" required>
                                    </div>
                                </div>
								<div class="form-group row">
									<div class="col-sm-12">
										<input name="pName" id="pName" value="<%=session.getAttribute("loginedname")%>" readonly="readonly" class="form-control">
									</div>
								</div>


                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input name="handAddress"  placeholder="房产地址" id="handAddress" type="text"  class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input name="handNumber" placeholder="房产数量" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" id="handNumber" type="text" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input name="handAge" placeholder="房龄" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" id="handAge" type="text" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <textarea name="handDescribe" placeholder="房产描述" id="handDescribe" rows=”3” class="form-control" cols=”10” style="resize: none"></textarea>
                                </div>
                                </div>


                                <input name="handColnum"  id="handColnum" type="hidden" value="0" class="form-control" required>

								<!-- Button -->
								<div class="button-btn-block">
									<button id="btn-submit" type="submit" class="btn btn-primary btn-lg btn-block">添加</button>
								</div>
							</form>
                            <div class="button-btn-block">
                                <a href="${pageContext.request.contextPath}/forward?pg=productInfoManager/HandRoomAjaxQueryWithPagination" ><button   class="btn btn-primary btn-lg btn-block">返回</button></a>
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
           var hname = $("#handName");
           var hprice=$("#handPrice");
           var hnum=$("#handNumber");
           var hadd=$("#handAddress");
           var hage=$("#handAge");
           var hdes=$("#handDescribe")
		  $("#btn-submit").click(function(){

                  var hname = hname.val();
                  var hprice=hprice.val();
                  var hnum=hnum.val();
                  var hadd=hadd.val();
                  var hage=hage.val();
                  var hdes=hdes.val();
                  if (hname.length>21||hname.length<1)
                  {
                      alert("二手房名称输入有误！限制字数为1~20.");
                      hname.focus();
                      return false;
                  }else if(hprice.length<=0){
                      alert("价格不能为空!");
                      hprice.focus();
                      return false;
                  }else if(hnum.length<=0){
                      alert("数量不能为空!");
                      hnum.focus();
                      return false;
                  }else if(hage.length<=0){
                      alert("房龄不能为空!");
                      hage.focus();
                      return false;
                  }else if(hadd.length>51||hadd.length<1){
                      alert("地址输入有误！限制字数为1~50.");
                      hadd.focus();
                      return false;
                  }else if(hdes.length>101||hdes.length<1){
                      alert("地址输入有误！限制字数为1~100.");
                      hdes.focus();
                      return false;
                  }
			  //正常提交
			  $("#form").submit();
		  });
	   });


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
		  alert("二手房添加重复！");
	  }
   <%}%>
</script>
	
</body>

</html>