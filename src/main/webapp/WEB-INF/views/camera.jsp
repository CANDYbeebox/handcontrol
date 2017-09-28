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
<body class="hold-transition skin-green layout-top-nav">
<div class="wrapper">

    <header class="main-header">
        <nav class="navbar navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <a href="index2.html" class="navbar-brand"><b>无锡特检院</b>电梯识别</a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a data-toggle="modal" data-target="#localSetting"><i class=" ion-settings" aria-hidden="true"></i>本地设置</a></li>
                        <li><a href="http://www.wxtjy.com/"><i class="fa fa-home" aria-hidden="true"></i>访问特检网首页</a></li>
                    </ul>
                    <%--<form class="navbar-form navbar-left" role="search">--%>
                        <%--<div class="form-group">--%>
                            <%--<input type="text" class="form-control" id="navbar-search-input" placeholder="Search">--%>
                        <%--</div>--%>
                    <%--</form>--%>
                </div>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="static/adminlib/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">${user.account}</span>
                        </a>
                            <ul class="dropdown-menu">
                                <!-- The user image in the menu -->
                                <li class="user-header">
                                    <img src="static/adminlib/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                    <p>
                                        ${user.account}
                                        <%--<small>Member since Nov. 2012</small>--%>
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
                    </ul>
                </div>
                <!-- /.navbar-custom-menu -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </header>

    <!-- Left side column. contains the logo and sidebar -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="container-fluid" id="cameraView">
                        <ul class="breadcrumb">
                            <li class="active">摄像头选择</li>
                        </ul>
                        <div class="row">
                            <div class="col-md-3">
                                <fieldset>
                                    <button class="btn btn-primary" onclick="cameraInit(350,300)">连接</button>
                                    <button class="btn btn-primary" onclick="StartRealPlay()">播放</button>
                                    <button class="btn btn-warning" onclick="StopRealPlay()">停止</button>
                                    <br>
                                    <button class="btn btn-primary" onclick="clickStartRecord()">开始录像</button>
                                    <button class="btn btn-warning" onclick="clickStopRecord()">停止录像</button>
                                </fieldset>
                            </div>
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="col-md-3">码流类型
                                        <select id="streamtype" class="bigselect">
                                            <option value="1">主码流</option>
                                            <option value="2">子码流</option>
                                            <option value="3">第三码流</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">

                                    </div>
                                    <div class="col-md-3">
                                        <button class="btn btn-primary" onclick="forbikedogpeople()">开启识别</button>
                                        <button class="btn btn-warning" id="stopbikedogpeople">关闭识别</button>
                                        <button class="btn btn-primary" onclick="continuouShowPic()">识别效果</button>
                                        <button class="btn btn-warning" id="stopShowPic">关闭效果</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-7">
                                        已登录设备
                                        <select id="ip" class="bigselect"></select>
                                    </div>
                                    <%--<div class="col-md-4">通道列表--%>
                                        <%--<!--<div class="col-md-2">-->--%>
                                        <%--<select id="channels" class="bigselect"></select>--%>
                                    <%--</div>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <ul class="breadcrumb">
                                    <li class="active textli">实时视频</li>
                                </ul>
                                <div id="container" class="bigplugin">
                                    <div id="divPlugin" class="try"></div>
                                </div>
                                <!--<div ng-include="'views/cameraBig.html'"></div>-->
                            </div>

                            <div class="col-md-3">
                                <table>
                                    <tr>
                                        <td>时间：</td>
                                        <td style="color: cornflowerblue" id="nowtime"></td>
                                    </tr>
                                </table>
                                <table class="table table-bordered table-hover">
                                    <caption></caption>
                                    <thead>
                                    <tr>
                                        <th>检测事项</th>
                                        <th>结果</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr bgcolor="#db7093" >
                                        <td>车</td>
                                        <td id="车">正常</td>
                                    </tr>
                                    <tr bgcolor="#90ee90" >
                                        <td>狗</td>
                                        <td id="狗">正常</td>
                                    </tr>
                                    <tr bgcolor="#6495ed" >
                                        <td>门</td>
                                        <td id="人">关</td>
                                    </tr>
                                    <tr bgcolor="#fafad2" >
                                        <td>危险动作</td>
                                        <td id="危险动作">无</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="col-md-5">
                                <ul class="breadcrumb">
                                    <li class="active textli">报警提示</li>
                                </ul>
                                <div class="imgdiv" id="imgID">
                                    <img id="img_result"   width="500" height="300" border="0"/>
                                </div>
                            </div>

                        </div>
                        <audio src="lib/mp3/alarm.wav" id="audioElementHovertree"/>
                        <div id="circle_container" class="circle_container" style="display: none" >
                            <div class="circle" id="circle" ></div>
                            <!--<iframe style="position:absolute; visibility:inherit; top:0px; left:0px; width:100%; height:100%; z-index:99;"></iframe>-->
                        </div>
                        <!--<div ng-include="'views/warningDogModal.html'"></div>-->
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->
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
    <div class="modal fade" id="localSetting1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">本地配置</h4>
                </div>
                <div class="modal-body">
                    <!--<fieldset class="localconfig">-->
                    <!--<table cellpadding="0" cellspacing="3" border="0">-->
                    <!--&lt;!&ndash;<tr>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td class="tt">播放性能</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<select id="netsPreach" name="netsPreach" class="sel">&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="0">最短延时</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="1">实时性好</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="2">均衡</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="3">流畅性好</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;</select>&ndash;&gt;-->
                    <!--&lt;!&ndash;</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td class="tt">图像尺寸</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<select id="wndSize" name="wndSize" class="sel">&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="0">充满</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="1">4:3</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="2">16:9</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;</select>&ndash;&gt;-->
                    <!--&lt;!&ndash;</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;</tr>&ndash;&gt;-->
                    <!--&lt;!&ndash;<tr>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td class="tt">规则信息</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<select id="rulesInfo" name="rulesInfo" class="sel">&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="1">启用</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="0">禁用</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;</select>&ndash;&gt;-->
                    <!--&lt;!&ndash;</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td class="tt">抓图文件格式</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<select id="captureFileFormat" name="captureFileFormat" class="sel">&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="0">JPEG</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="1">BMP</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;</select>&ndash;&gt;-->
                    <!--&lt;!&ndash;</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;</tr>&ndash;&gt;-->
                    <!--&lt;!&ndash;<tr>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td class="tt">录像文件打包大小</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<select id="packSize" name="packSize" class="sel">&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="0">256M</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="1">512M</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="2">1G</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;</select>&ndash;&gt;-->
                    <!--&lt;!&ndash;</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td class="tt">协议类型</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<td>&ndash;&gt;-->
                    <!--&lt;!&ndash;<select id="protocolType" name="protocolType" class="sel">&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="0">TCP</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;<option value="2">UDP</option>&ndash;&gt;-->
                    <!--&lt;!&ndash;</select>&ndash;&gt;-->
                    <!--&lt;!&ndash;</td>&ndash;&gt;-->
                    <!--&lt;!&ndash;</tr>&ndash;&gt;-->
                    <!--<tr>-->
                    <!--<td class="tt">录像文件保存路径</td>-->
                    <!--<td colspan="3"><input id="recordPath" value="" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('recordPath', 0);" /></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    <!--<td class="tt">回放下载保存路径</td>-->
                    <!--<td colspan="3"><input id="downloadPath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('downloadPath', 0);" /></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    <!--<td class="tt">预览抓图保存路径</td>-->
                    <!--<td colspan="3"><input id="previewPicPath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('previewPicPath', 0);" /></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    <!--<td class="tt">回放抓图保存路径</td>-->
                    <!--<td colspan="3"><input id="playbackPicPath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('playbackPicPath', 0);" /></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    <!--<td class="tt">回放剪辑保存路径</td>-->
                    <!--<td colspan="3"><input id="playbackFilePath" type="text" class="txt" />&nbsp;<input type="button" class="btn" value="浏览" onclick="clickOpenFileDlg('playbackFilePath', 0);" /></td>-->
                    <!--</tr>-->
                    <!--<tr>-->
                    <!--<td colspan="4"><input type="button" class="btn" value="获取" onclick="clickGetLocalCfg();" />&nbsp;<input type="button" class="btn" value="设置" onclick="clickSetLocalCfg();" /></td>-->
                    <!--</tr>-->
                    <!--</table>-->
                    <!--</fieldset>-->

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover ">
                            <thead>
                            <tr style="text-align: center">
                                <th style="text-align: center;top:50%">选项</th>
                                <th>值</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td style="text-align: center">录像文件保存路径</td>
                                <td><input id="recordPath" type="text" class="form-control" id="录像文件保存路径" value="C:\Users"></td>
                                <td><button class="btn-sm btn-primary" onclick="clickOpenFileDlg('recordPath', 0)">浏览</button></td>
                            </tr>
                            <!--<tr>-->
                            <!--<td style="text-align: center">回放下载保存路径</td>-->
                            <!--<td><input type="text" class="form-control" id="回放下载保存路径" value="C:\Users"></td>-->
                            <!--<td><button class="btn-sm btn-primary" onclick="browseFolder('回放下载保存路径')">浏览</button></td>-->
                            <!--</tr>-->
                            <tr>
                                <td style="text-align: center">预览抓图保存路径</td>
                                <td><input id="previewPicPath" type="text" class="form-control" id="预览抓图保存路径" value="C:\Users" ></td>
                                <td><button class="btn-sm btn-primary" onclick="clickOpenFileDlg('previewPicPath', 0)">浏览</button></td>
                            </tr>
                            <!--<tr>-->
                            <!--<td style="text-align: center">回放抓图保存路径</td>-->
                            <!--<td><input type="text" class="form-control" id="回放抓图保存路径" value="C:\Users" ></td>-->
                            <!--<td><button class="btn-sm btn-primary" onclick="browseFolder('回放抓图保存路径')">浏览</button></td>-->
                            <!--</tr>-->
                            <!--<tr>-->
                            <!--<td style="text-align: center">回放剪辑保存路径</td>-->
                            <!--<td><input type="text" class="form-control" id="回放剪辑保存路径" value="C:\Users" ></td>-->
                            <!--<td><button class="btn-sm btn-primary" onclick="browseFolder('回放剪辑保存路径')">浏览</button></td>-->
                            <!--</tr>-->
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="clickSetLocalCfg()">保存</button>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- ./wrapper -->
<!--重置密码模态框-->
<div id="resetPasswordMod"></div>
<%--本地设置模态框--%>
<div id="localSet"></div>
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
//    本地设置模态框
    $.get("../../static/views/localSetting.html",function(data){
        $("#localSet").html(data);
    })
//    重置密码模态框
    $.get("../../static/views/resetPasswordModal.html",function(data){
        $("#resetPasswordMod").html(data);
    });
</script>
<script src="../../static/js/header.js"></script>
<script src="../../static/oldlib/lib/JQuery.md5.js"></script>
<script src="../../static/oldlib/lib/codebase/webVideoCtrl.js"></script>
<script src="../../static/js/camera.js"></script>
<script src="../../static/js/choose.js"></script>
</body>
</html>

