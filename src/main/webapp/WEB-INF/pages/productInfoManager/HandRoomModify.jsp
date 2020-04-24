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
    <title>二手房信息查看与修改</title>
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
            $("#handId").val(eachBean.handId);
            $("#handName").val(eachBean.handName);
            $("#pName").val(eachBean.pName);
            $("#handPrice").val(eachBean.handPrice);
            $("#handAddress").val(eachBean.handAddress);
            $("#handNumber").val(eachBean.handNumber);
            $("#handAge").val(eachBean.handAge);
            $("#handDescribe").val(eachBean.handDescribe);
            $("#handColnum").val(eachBean.handColnum);
            $("#img").attr('src', '${pageContext.request.contextPath}/'+eachBean.handImg);

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
    <div id="pimg"><img width="64" height="64" id="img" name="handImg" src="" /></div>
    <form id="modifyform" class="form-horizontal" action="${pageContext.request.contextPath}/updateHandRoom" method="post"
          enctype="multipart/form-data">
        <!--使用隐藏表单，保存主键字段；用于区分是新增还是修改-->
        <input type="hidden" class="form-control" id="handId" name="handId">

        <div class="form-group row">
            <div class="col-sm-12">

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
                <input name="handPrice" id="handPrice" onkeyup="if( ! /^\d*(?:\.\d{0,2})?$/.test(this.value)){alert('只能输入数字，小数点后只能保留两位');this.value='';}" placeholder="价格" class="form-control" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-12">
                <input name="pName" id="pName"  readonly="readonly" class="form-control">
            </div>
        </div>


        <div class="form-group row">
            <div class="col-sm-12">
                <input name="handAddress"  placeholder="房产地址" id="handAddress" type="text"  class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="handNumber" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" placeholder="房产数量" id="handNumber" type="text" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <input name="handAge" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" placeholder="房龄" id="handAge" type="text" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                <textarea name="handDescribe" placeholder="房产描述" id="handDescribe" rows=”3” class="form-control" cols=”10” style="resize: none"></textarea>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-12">
                <input name="handColnum"  id="handColnum" readonly="readonly" class="form-control" >
            </div>
        </div>





    </form>
</div>

</body>
</html>
