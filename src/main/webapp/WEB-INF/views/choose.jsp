<%--
  Created by IntelliJ IDEA.
  User: try
  Date: 2017/9/25
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <script src="../../static/oldlib/lib/sweet-alert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../static/oldlib/lib/sweet-alert.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>摄像头选择</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../static/adminlib/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../static/adminlib/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../static/adminlib/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../static/adminlib/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../static/adminlib/dist/css/skins/_all-skins.min.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="../../static/adminlib/bower_components/morris.js/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="../../static/adminlib/bower_components/jvectormap/jquery-jvectormap.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="../../static/adminlib/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../static/adminlib/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="../../static/adminlib/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <!--reset password-->
    <link rel="stylesheet" href="../../static/css/resetpassword.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <!--百度地图-->
    <style type="text/css">
        #allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ImfQg9H3WBclMiD3g0imG4OWoKfiGZj3"></script>
</head>
<body class="hold-transition skin-green sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b><img src="static/adminlib/dist/img/tjylogo.png" class="img-circle" alt="User Image" height="50" width="50"></b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>无锡特检院</b>电梯识别</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <!-- Notifications: style can be found in dropdown.less -->
                    <!-- Tasks: style can be found in dropdown.less -->
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="static/adminlib/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">${user.account}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="static/adminlib/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    ${user.account}
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <%--<li class="user-body">--%>
                                <%--<div class="row">--%>
                                    <%--<div class="col-xs-4 text-center">--%>
                                        <%--<a href="#">Followers</a>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-xs-4 text-center">--%>
                                        <%--<a href="#">Sales</a>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-xs-4 text-center">--%>
                                        <%--<a href="#">Friends</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<!-- /.row -->--%>
                            <%--</li>--%>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a onclick="resetPassword()" class="btn btn-default btn-flat">密码重置</a>
                                </div>
                                <div class="pull-right">
                                    <a href="outLogin.do" class="btn btn-default btn-flat">退出账户</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    <li>
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="static/adminlib/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${user.account}</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- search form -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header" > 电梯信息显示</li>
                <li class=" treeview">
                    <a onclick="bigTableShow()">
                        <i class="fa fa-table"></i> <span>表格显示</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a onclick="searchByLocation('玄武区')"><i class="fa fa-circle-o"></i> 玄武区</a></li>
                        <li><a onclick="searchByLocation('鼓楼区')"><i class="fa fa-circle-o"></i> 鼓楼区</a></li>
                        <li><a onclick="searchByLocation('建邺区')"><i class="fa fa-circle-o"></i> 建邺区</a></li>
                        <li><a onclick="searchByLocation('白下区')"><i class="fa fa-circle-o"></i> 白下区</a></li>
                    </ul>
                </li>
                <li>
                    <a onclick="searchForMap('')">
                        <i class="fa fa-map"></i><span>地图显示</span>
                        <!--<span class="pull-right-container">-->
                        <!--<small class="label pull-right bg-green">new</small>-->
                        <!--</span>-->
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1 class="text-center">
                电梯信息
                <!--<small>Control panel</small>-->
            </h1>
            <!--<ol class="breadcrumb">-->
            <!--<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>-->
            <!--<li class="active">Dashboard</li>-->
            <!--</ol>-->
        </section>

        <!-- Main content -->
        <section class="content"  >
            <div class="row" id="myMap" style="display: none">
                <div class="col-md-5" id="smallTable"></div>
                <div class="col-md-6">
                    <div style="width:650px;height:600px;border:#ccc solid 1px;" id="dituContent" >
                        <div class="div-relative" id="allmap"></div>
                        <!--图示注解-->
                        <!--地图初始化-->
                        <!--<script  src="map.js"></script>-->
                    </div>
                </div>
            </div>
            <div class="row"id="tableInformation" ></div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2017 </strong> 无锡特检院
    </footer>

    <!--</aside>-->
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<!--detail模态框-->
<div id="detailMod"></div>
<!--重置密码模态框-->
<div id="resetPasswordMod"></div>
<!-- jQuery 3 -->
<script src="../../static/adminlib/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../../static/adminlib/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="../../static/adminlib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="../../static/adminlib/bower_components/raphael/raphael.min.js"></script>
<script src="../../static/adminlib/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="../../static/adminlib/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="../../static/adminlib/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../static/adminlib/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="../../static/adminlib/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="../../static/adminlib/bower_components/moment/min/moment.min.js"></script>
<script src="../../static/adminlib/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="../../static/adminlib/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="../../static/adminlib/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="../../static/adminlib/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../static/adminlib/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../static/adminlib/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../static/adminlib/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../static/adminlib/dist/js/demo.js"></script>
<!--自己写的js-->
<script type="text/javascript">
    $.get("../../static/views/bigTable.html",function(data){
        $("#tableInformation").html(data);
    });
    $.get("../../static/views/smallTable.html",function(data){
        $("#smallTable").html(data);
    });
    $.get("../../static/views/detailModal.html",function(data){
        $("#detailMod").html(data);
    });
    $.get("../../static/views/resetPasswordModal.html",function(data){
        $("#resetPasswordMod").html(data);
    });

</script>
<script src="../../static/js/choose.js"></script>
<script src="../../static/js/map.js"></script>
<script src="../../static/js/header.js"></script>
<script src="../../static/oldlib/lib/JQuery.md5.js"></script>

</body>
</html>

