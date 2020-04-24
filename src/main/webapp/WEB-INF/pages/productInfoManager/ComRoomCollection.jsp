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
    <title>商品房信息收藏</title>
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
            $("#comId").val(eachBean.comId);
            $("#comName").val(eachBean.comName);
            $("#pName").val(eachBean.pName);
            $("#comPrice").val(eachBean.comPrice);
            $("#comAddress").val(eachBean.comAddress);
            $("#comNumber").val(eachBean.comNumber);
            $("#comDescribe").val(eachBean.comDescribe);
            $("#comColnum").val(eachBean.comColnum);
            $("#img").attr('src', '${pageContext.request.contextPath}/'+eachBean.comImg);

            $("#colName").val(eachBean.comName);
            //$("#aName").val(aname);
            $("#colImg").val(eachBean.comImg);

            $("#houseName").val(eachBean.comName);
            $("#pNameforh").val(eachBean.pName);
            $("#houseImg").val(eachBean.comImg);
            $("#price").val(eachBean.comPrice);

            $("#pNameForM").val(eachBean.pName);
            sessionStorage.removeItem("eachRow");

        });

    </script>
</head>
<body>
<div id="maindiv">

<%--    <form id="modifyform" class="form-horizontal" action="${pageContext.request.contextPath}/updatePropertyUser1" method="post"--%>
<%--          enctype="multipart/form-data">--%>

        <div id="pimg"><img width="64" height="64" id="img" name="comImg" src="" /></div>
        <div class="form-group row">
            <div class="col-sm-12">
                商品房姓名:<input name="comName" id="comName" readonly="readonly" class="form-control" >
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-12">
                商品房价格：<input name="comPrice" id="comPrice" readonly="readonly" class="form-control" >
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-12">
                地产商：<input name="pName" id="pName"  readonly="readonly" class="form-control">
            </div>
        </div>


        <div class="form-group row">
            <div class="col-sm-12">
                商品房地址：<input name="comAddress" readonly="readonly" id="comAddress" type="text"  class="form-control" >
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                商品房数量：<input name="comNumber" readonly="readonly" id="comNumber" type="text" class="form-control">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                简介：<textarea name="comDescribe" readonly="readonly" id="comDescribe" rows=”3” class="form-control" cols=”10” style="resize: none"></textarea>
            </div>
        </div>

    <div class="form-group row">
        <div class="col-sm-12">
                 收藏量：<input name="comColnum"  id="comColnum" readonly="readonly"  class="form-control" >
        </div>
    </div>
<%--    </form>--%>



        <form id="modifyform1" class="form-horizontal" action="${pageContext.request.contextPath}/saveComCollection" method="post"
              enctype="multipart/form-data">
            <input name="colName"  id="colName" type="hidden"  class="form-control" >
            <input name="aName"  id="aName" type="hidden" value="<%=session.getAttribute("loginedname")%>" class="form-control" >
            <input name="colImg"  id="colImg" type="hidden"  class="form-control" >

    </form>
    <form id="modifyform2" class="form-horizontal" action="${pageContext.request.contextPath}/saveComHistory" method="post"
          enctype="multipart/form-data">
        <input name="houseName"  id="houseName" type="hidden"  class="form-control" >
        <input name="aName"  id="aNameforh" type="hidden" value="<%=session.getAttribute("loginedname")%>" class="form-control" >
        <input name="pName"  id="pNameforh" type="hidden"  class="form-control" >
        <input name="houseImg"  id="houseImg" type="hidden"  class="form-control" >
        <input name="price" id="price" type="hidden" class="form-control" >
    </form>
    <div style="align-items: center"><h2>留言</h2></div>
    <form id="form" action="${pageContext.request.contextPath}/intoAdminMessage" method="post" class="widget-form" enctype="multipart/form-data">
        <div class="form-group row">
            <div class="col-sm-12">
                发送人：<input name="aName" id="aNameForM" readonly="readonly" value="<%=session.getAttribute("loginedname")%>" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                接收人：<input name="pName" id="pNameForM" readonly="readonly" class="form-control" required>
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
</div>
<script type="text/javascript">
    $(document).ready(function(){
        var massage=$("#mas");
        $("#btn-submit").click(function(){
            var mas=massage.val();
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
