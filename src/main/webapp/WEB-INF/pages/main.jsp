
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="TravelStar - Tour, Travel, Travel Agency Template">
    <meta name="keywords" content="Tour, Travel, Travel Agency Template">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelStar - Tour, Travel & Travel Agency Template</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/Other/images/favicon.ico">
    <!-- bootstrap css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/bootstrap.min.css">
    <!-- animate css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/animate.css">
    <!-- Button Hover animate css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/hover-min.css">
    <!-- jquery-ui.min css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/jquery-ui.min.css">
    <!-- meanmenu css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/meanmenu.min.css">
    <!-- owl.carousel css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/owl.carousel.min.css">
    <!-- slick css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/slick.css">
    <!-- chosen.min-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/jquery-customselect.css">
    <!-- font-awesome css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/font-awesome.min.css">
    <!-- magnific Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/magnific-popup.css">
    <!-- Revolution Slider -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/revolution/layers.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/revolution/navigation.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/revolution/settings.css">
    <!-- Preloader css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/assets/preloader.css">
    <!-- custome css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/style.css">
    <!-- responsive css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Other/css/master.css">
    <!-- modernizr css -->
    <script src="${pageContext.request.contextPath}/static/Other/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<style>

    #laman1{
        width:100%;
        height: 100%;
    }
    #laman2{
        align-items: center;
        width:100%;
        height: 100%;
    }
    #content-main{
        align-items: center;
        width:100%;
        height: 100%;
    }
    #fenge{
        background: skyblue;
        align-items: center;
        width:100%;
        height: 10%;
    }
</style>
<body>
<div id="loader-wrapper">
    <div id="loader"></div>
    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>
</div>
<!-- header area start here -->
<header>
    <div class="header_top_area">
        <div class="container">
            <div class="row">
                <div class="col-12 col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="contact_wrapper_top">
                        <ul class="header_top_contact">
                            <li><i class="fa fa-phone" aria-hidden="true"></i>+123-456-7890</li>
                            <li><i class="fa fa-envelope-o" aria-hidden="true"></i>info@yourcompany.com</li>
                        </ul>
                        <%
                            Object aid=request.getAttribute("loginedAid");
                            Object name=request.getAttribute("loginedname");
                            Object pwd=request.getAttribute("loginedApwd");
                            Object aimg=request.getAttribute("loginedAimg");
                            Object aphone=request.getAttribute("loginedAphone");
                            Object aemil=request.getAttribute("loginedAemil");
                            Object aadd=request.getAttribute("loginedAadd");
                            session.setAttribute("loginedAid",aid);
                            session.setAttribute("loginedname",name);
                            session.setAttribute("loginedApwd",pwd);
                            session.setAttribute("loginedAimg",aimg);
                            session.setAttribute("loginedAphone",aphone);
                            session.setAttribute("loginedAemil",aemil);
                            session.setAttribute("loginedAadd",aadd);
                        %>
                        <div class="book-btn">
                            <img alt="image" width="64" height="64" class="img-circle" src="${pageContext.request.contextPath}/<%=session.getAttribute("loginedAimg")%>" />
                        </div>
                        <div class="book-btn">


                            <a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=userInfoManager/averageUpdate">
                                <span class="clear">

                                <span class="text-muted text-xs block"><b class="caret"><%=session.getAttribute("loginedname")%></b></span>
                                </span>

                            </a>

                        </div>
                        <div class="book-btn">
                            <a href="index.jsp" id="close_main" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div> <!-- header top end -->

    <div class="main_nav">
        <div class="container">
            <div class="row">
                <div class="col-md-2 col-sm-2 col-xs-12 tap-v-responsive">
                    <div class="logo-area">
                        <a href="index.jsp"><img src="${pageContext.request.contextPath}/static/Other/images/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-md-10">
                    <nav>
                        <ul class="main-menu text-right">
                            <li class="active"><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=productInfoManager/ComAjaxQueryForA">首页</a>
                            </li>
                            <li><a href="#">地产项目</a>
                                <ul class="dropdown">
                                    <li><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=productInfoManager/HandRoomAjaxQueryForA">二手房项目列表</a></li>
                                    <li><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=productInfoManager/ComAjaxQueryForA">商品房项目列表</a></li>
                                </ul>
                            </li>
                            <li><a href="#">订单与收藏</a>
                                <ul class="dropdown">
                                    <li><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=userInfoManager/orderSelectForA">历史订单</a></li>
                                    <li><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=userInfoManager/collectionSelectForA">我的收藏</a></li>
                                </ul>
                            </li>
                            <li><a href="#">留言管理</a>
                                <ul class="dropdown">
                                    <li><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=MessageManager/ANameMessageAjaxQueryWithPagination">查收留言</a></li>
                                    <li><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=MessageManager/PNameMessageAjaxQueryWithPagination">已发留言</a></li>
                                </ul>
                            </li>
                            <li><a href="#">合作伙伴</a>
                                <ul class="dropdown">
                                    <li><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=supplierInfoManager/supplierInfoAjaxQueryWithPaginationForA">合作伙伴列表</a></li>
                                </ul>
                            </li>

                            <li><a class="J_menuItem" target="iframe0" href="${pageContext.request.contextPath}/forward?pg=MessageManager/ANameMessage_sign_up">联系我们</a></li>
                        </ul>
                    </nav>
                </div> <!-- main menu end here -->
            </div>
        </div>
    </div> <!-- header-bottom area end here -->
</header> <!-- header area end here -->

<section class="breadcrumb-blog-version-one">
    <div class="single-bredcurms" style="background-image:url('${pageContext.request.contextPath}/static/Other/images/bercums/package-Version-01.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <div class="bredcrums-content">
                        <h2>楼盘，甩卖啦！</h2>
                        <ul>
                            <li><a href="index2.jsp">欢迎!</a></li>
                            <li class="active"><a href="package-version-one.html">随便看看吧>.<</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<section class="search_area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12">
            </div>
        </div>
    </div>
</section> <!-- header tab based search area end-->
<div id="fenge"></div>
<div class="container" id="laman1">
    <div class="row" id="laman2">
    <!--右侧部分开始-->
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/forward?pg=productInfoManager/ComAjaxQueryForA" frameborder="0" data-id="index_v1.html" seamless ></iframe>
        </div>
    <!--右侧部分结束-->

    </div>
</div>




<div class="to-top pos-rtive">
    <a href="#"><i class = "fa fa-angle-up"></i></a>
</div><!-- Scroll to top-->

<!-- ============================
        JavaScript Files
============================= -->
<!-- jquery -->
<script src="${pageContext.request.contextPath}/static/Other/js/vendor/jquery-3.2.0.min.js"></script>
<!-- bootstrap js -->
<script src="${pageContext.request.contextPath}/static/Other/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/popper.min.js"></script>
<!-- owl.carousel js -->
<script src="${pageContext.request.contextPath}/static/Other/js/owl.carousel.min.js"></script>
<!-- slick js -->
<script src="${pageContext.request.contextPath}/static/Other/js/slick.min.js"></script>
<!-- meanmenu js -->
<script src="${pageContext.request.contextPath}/static/Other/js/jquery.meanmenu.min.js"></script>
<!-- jquery-ui js -->
<script src="${pageContext.request.contextPath}/static/Other/js/jquery-ui.min.js"></script>
<!-- wow js -->
<script src="${pageContext.request.contextPath}/static/Other/js/wow.min.js"></script>
<!-- counter js -->
<script src="${pageContext.request.contextPath}/static/Other/js/jquery.counterup.min.js"></script>
<!-- Countdown js -->
<script src="${pageContext.request.contextPath}/static/Other/js/jquery.countdown.min.js"></script>
<!-- waypoints js -->
<script src="${pageContext.request.contextPath}/static/Other/js/jquery.waypoints.min.js"></script>
<!-- Isotope js -->
<script src="${pageContext.request.contextPath}/static/Other/js/isotope.pkgd.min.js"></script>
<!-- magnific js -->
<script src="${pageContext.request.contextPath}/static/Other/js/jquery.magnific-popup.min.js"></script>
<!-- Image loaded js -->
<script src="${pageContext.request.contextPath}/static/Other/js/imagesloaded.pkgd.min.js"></script>
<!-- chossen js -->
<script src="${pageContext.request.contextPath}/static/Other/js/chosen.jquery.min.js"></script>
<!-- Revolution JS -->
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/jquery.themepunch.revolution.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/jquery.themepunch.tools.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.actions.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.kenburn.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.layeranimation.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.migration.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.navigation.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.parallax.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.slideanims.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/extensions/revolution.extension.video.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/assets/revolution/revolution.js"></script>
<!-- plugin js -->
<script src="${pageContext.request.contextPath}/static/Other/js/plugins.js"></script>
<!-- select2 js -->
<script src="${pageContext.request.contextPath}/static/Other/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/Other/js/colors.js"></script>
<!-- customSelect Js -->
<script src="${pageContext.request.contextPath}/static/Other/js/jquery-customselect.js"></script>
<!-- custom js -->
<script src="${pageContext.request.contextPath}/static/Other/js/custom.js"></script>

</body>
</html>
