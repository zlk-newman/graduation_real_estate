<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/11
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>管理员界面</title>

    <meta name="keywords" content="响应式后台">
    <meta name="description" content="全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> <link href="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<%
    session.setAttribute("loginedname","admin");
%>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">

    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>

        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" width="32" height="32" src="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/img/user.png" /></span>
                        <div class="dropdown profile-element">

                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">

                                <span class="text-muted text-xs block">系统管理员:<%=session.getAttribute("loginedname")%><b class="caret"></b></span>
                                </span>
                            </a>
                        </div>

                    </div>
                    <div class="logo-element">管理员管理系统
                    </div>

                </li>
                <li>
                    <a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=supplierInfoManager/AdminWelcome">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">首页</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=supplierInfoManager/supplierInfoAjaxQueryWithPagination" data-index="0">客户信息管理</a>
                        </li>
<%--                        <li>--%>
<%--                            <a class="J_menuItem" target="iframe0"  href="#">用户信息管理</a>--%>
<%--                        </li>--%>
                        <li>
                            <a class="J_menuItem" target="iframe0"
                               href="${pageContext.request.contextPath}/forward?pg=MessageManager/ANameMessageAjaxQueryWithPagination">查收留言</a>
                        </li>
                        <li>
                            <a class="J_menuItem" target="iframe0"
                               href="${pageContext.request.contextPath}/forward?pg=MessageManager/PNameMessageAjaxQueryWithPagination">已发留言</a>
                        </li>

                    </ul>

                </li>

            </ul>
        </div>
    </nav>


    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">


        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">

                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="row content-tabs">

            <div class="btn-group roll-nav roll-right">
                <a href="index.jsp" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/forward?pg=supplierInfoManager/AdminWelcome" frameborder="0" data-id="index_v1.html" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">
            </div>
        </div>
    </div>
    <!--右侧部分结束-->

</div>

<!-- 全局js -->
<script src="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/Hplus-v.4.1.0/js/contabs.js"></script>

<!-- 第三方插件 -->
<!--<script src="js/plugins/pace/pace.min.js"></script>-->

</body>

</html>