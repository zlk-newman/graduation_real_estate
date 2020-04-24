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
    <title>商品房信息详情</title>
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
</head>
<body>
<div id="maindiv">

<%--    <form id="modifyform" class="form-horizontal" action="${pageContext.request.contextPath}/updatePropertyUser1" method="post"--%>
<%--          enctype="multipart/form-data">--%>

        <div id="pimg"><img width="64" height="64" id="img" name="comImg" src="${pageContext.request.contextPath}/<%=request.getAttribute("CommodityHouseImg")%>" /></div>
        <div class="form-group row">
            <div class="col-sm-12">
                商品房姓名:<input name="comName" id="comName" value="<%=request.getAttribute("CommodityHouseName")%>" readonly="readonly" class="form-control" >
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-12">
                商品房价格：<input name="comPrice" id="comPrice" value="<%=request.getAttribute("CommodityHousePrice")%>" readonly="readonly" class="form-control" >
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-12">
                地产商：<input name="pName" id="pName" value="<%=request.getAttribute("CommodityHousePname")%>" readonly="readonly" class="form-control">
            </div>
        </div>


        <div class="form-group row">
            <div class="col-sm-12">
                商品房地址：<input name="comAddress" value="<%=request.getAttribute("CommodityHouseAdd")%>" readonly="readonly" id="comAddress" type="text"  class="form-control" >
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                商品房数量：<input name="comNumber" value="<%=request.getAttribute("CommodityHouseNum")%>" readonly="readonly" id="comNumber" type="text" class="form-control">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                简介：<input name="comDescribe" value="<%=request.getAttribute("CommodityHouseDes")%>" readonly="readonly" id="comDescribe"  class="form-control" style="resize: none">
            </div>
        </div>

    <div class="form-group row">
        <div class="col-sm-12">
                 收藏量：<input name="comColnum" value="<%=request.getAttribute("CommodityHouseColnum")%>" id="comColnum" readonly="readonly"  class="form-control" >
        </div>
    </div>
<%--    </form>--%>

    <form id="modifyform2" class="form-horizontal" action="${pageContext.request.contextPath}/saveComHistory" method="post"
          enctype="multipart/form-data">
        <input name="houseName"  id="houseName" type="hidden" value="<%=request.getAttribute("CommodityHouseName")%>" class="form-control" >
        <input name="aName"  id="aNameforh" type="hidden" value="<%=session.getAttribute("loginedname")%>" class="form-control" >
        <input name="pName"  id="pNameforh" type="hidden" value="<%=request.getAttribute("CommodityHousePname")%>"  class="form-control" >
        <input name="houseImg"  id="houseImg" type="hidden" value="<%=request.getAttribute("CommodityHouseImg")%>" class="form-control" >
        <input name="price" id="price" type="hidden" value="<%=request.getAttribute("CommodityHousePrice")%>" class="form-control" >
        <div class="button-btn-block">
            <button id="btn-submit1" type="submit" class="btn btn-primary btn-lg btn-block">预定</button>
        </div>
    </form>
    <div class="button-btn-block">
        <a href="${pageContext.request.contextPath}/forward?pg=userInfoManager/collectionSelectForA" ><button   class="btn btn-primary btn-lg btn-block">返回</button></a>
    </div>
    <div style="align-items: center"><h2>留言</h2></div>
    <form id="form" action="${pageContext.request.contextPath}/intoAdminMessage" method="post" class="widget-form" enctype="multipart/form-data">
        <div class="form-group row">
            <div class="col-sm-12">
                发送人：<input name="aName" id="aNameForM" readonly="readonly" value="<%=session.getAttribute("loginedname")%>" class="form-control" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-12">
                接收人：<input name="pName" id="pNameForM" readonly="readonly" value="<%=request.getAttribute("CommodityHousePname")%>" class="form-control" required>
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
