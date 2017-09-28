/**
 * Created by mazhi on 2016/10/15.
 */
// $(document).ready(function(){
//     audioElementHovertree.play();
// })
//var g_iWndIndex = 0; //可以不用设置这个变量，有窗口参数的接口中，不用传值，开发包会默认使用当前选择窗口
function cameraInit(win_width,win_height){
    // alert("111");
    if (-1 == WebVideoCtrl.I_CheckPluginInstall()) {
        alert("您还未安装过插件，双击开发包目录里的WebComponents.exe安装！");
        return;
    }

    // 初始化插件参数及插入插件
    WebVideoCtrl.I_InitPlugin(win_width, win_height, {
        iWndowType: 1,
        cbSelWnd: function (xmlDoc) {
            g_iWndIndex = $(xmlDoc).find("SelectWnd").eq(0).text();
           // var szInfo = "当前选择的窗口编号：" + g_iWndIndex;
           // alert(szInfo);
        }
    });
    WebVideoCtrl.I_InsertOBJECTPlugin("divPlugin");
    // 检查插件是否最新
    // if (-1 == WebVideoCtrl.I_CheckPluginVersion()) {
    //     alert("检测到新的插件版本，双击开发包目录里的WebComponents.exe升级！");
    //     return;
    // }
    // 窗口事件绑定
    //$(window).bind({
    //    resize: function () {
    //        var $Restart = $("#restartDiv");
    //        if ($Restart.length > 0) {
    //            var oSize = getWindowSize();
    //            $Restart.css({
    //                width: oSize.width + "px",
    //                height: oSize.height + "px"
    //            });
    //        }
    //    }
    //});
    ////初始化日期时间
    //var szCurTime = dateFormat(new Date(), "yyyy-MM-dd");
    //$("#starttime").val(szCurTime + " 00:00:00");
    //$("#endtime").val(szCurTime + " 23:59:59");
    //登录
    autoLogin();
}
// 格式化时间
function dateFormat(oDate, fmt) {
    var o = {
        "M+": oDate.getMonth() + 1, //月份
        "d+": oDate.getDate(), //日
        "h+": oDate.getHours(), //小时
        "m+": oDate.getMinutes(), //分
        "s+": oDate.getSeconds(), //秒
        "q+": Math.floor((oDate.getMonth() + 3) / 3), //季度
        "S": oDate.getMilliseconds()//毫秒
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (oDate.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}
// 获取窗口尺寸
function getWindowSize() {
    var nWidth = $(this).width() + $(this).scrollLeft(),
        nHeight = $(this).height() + $(this).scrollTop();

    return {width: nWidth, height: nHeight};
}
// 登录
function autoLogin() {
    var szIP = "192.168.254.10",
        szPort = "80",
        szUsername = "admin",
        szPassword = "wubumihuo1992";
        // szPassword = "wxtjy123";


    var iRet = WebVideoCtrl.I_Login(szIP, 1, szPort, szUsername, szPassword, {
        success: function (xmlDoc) {
            alertWindow("登录成功","success");
            $("#ip").prepend("<option value='" + szIP + "'>" + szIP + "</option>");
            setTimeout(function () {
                getChannelInfo();
            }, 10);
        },
        error: function () {
            alertWindow("登录失败","error");
        }
    });

    if (-1 == iRet) {
        alertWindow("已登录过","warning");
    }
}

//预览播放
// 开始预览
function StartRealPlay() {
    var oWndInfo = WebVideoCtrl.I_GetWindowStatus(g_iWndIndex),
        szIP = $("#ip").val(),
        iStreamType = parseInt($("#streamtype").val(), 10),
        iChannelID = parseInt($("#channels").val(), 10),
        bZeroChannel = $("#channels option").eq($("#channels").get(0).selectedIndex).attr("bZero") == "true" ? true : false,
        szInfo = "",
        type = "";

    if ("" == szIP) {
        return;
    }

    if (oWndInfo != null) {// 已经在播放了，先停止
        WebVideoCtrl.I_Stop();
    }

    var iRet = WebVideoCtrl.I_StartRealPlay(szIP, {
        iStreamType: iStreamType,
        iChannelID: iChannelID,
        bZeroChannel: bZeroChannel
    });

    if (0 == iRet) {
        szInfo = "开始预览成功！";
        type = "success";
    } else {
        szInfo = "开始预览失败！";
        type="error";
    }

   alertWindow(szInfo,type);
   // showOPInfo(szIP + " " + szInfo);
}

function getChannelInfo() {
    var szIP = $("#ip").val(),
        oSel = $("#channels").empty(),
        nAnalogChannel = 0;

    if ("" == szIP) {
        return;
    }

    // 模拟通道
    WebVideoCtrl.I_GetAnalogChannelInfo(szIP, {
        async: false,
        success: function (xmlDoc) {
            var oChannels = $(xmlDoc).find("VideoInputChannel");
            nAnalogChannel = oChannels.length;

            $.each(oChannels, function (i) {
                var id = parseInt($(this).find("id").eq(0).text(), 10),
                    name = $(this).find("name").eq(0).text();
                if ("" == name) {
                    name = "Camera " + (id < 9 ? "0" + id : id);
                }
                oSel.append("<option value='" + id + "' bZero='false'>" + name + "</option>");
            });
           // showOPInfo(szIP + " 获取模拟通道成功！");
        },
        error: function () {
          // showOPInfo(szIP + " 获取模拟通道失败！");
        }
    });
    // 数字通道
    WebVideoCtrl.I_GetDigitalChannelInfo(szIP, {
        async: false,
        success: function (xmlDoc) {
            var oChannels = $(xmlDoc).find("InputProxyChannelStatus");

            $.each(oChannels, function (i) {
                var id = parseInt($(this).find("id").eq(0).text(), 10),
                    name = $(this).find("name").eq(0).text(),
                    online = $(this).find("online").eq(0).text();
                if ("false" == online) {// 过滤禁用的数字通道
                    return true;
                }
                if ("" == name) {
                    name = "IPCamera " + ((id - nAnalogChannel) < 9 ? "0" + (id - nAnalogChannel) : (id - nAnalogChannel));
                }
                oSel.append("<option value='" + id + "' bZero='false'>" + name + "</option>");
            });
         //   showOPInfo(szIP + " 获取数字通道成功！");
        },
        error: function () {
         //   showOPInfo(szIP + " 获取数字通道失败！");
        }
    });
    // 零通道
    WebVideoCtrl.I_GetZeroChannelInfo(szIP, {
        async: false,
        success: function (xmlDoc) {
            var oChannels = $(xmlDoc).find("ZeroVideoChannel");

            $.each(oChannels, function (i) {
                var id = parseInt($(this).find("id").eq(0).text(), 10),
                    name = $(this).find("name").eq(0).text();
                if ("" == name) {
                    name = "Zero Channel " + (id < 9 ? "0" + id : id);
                }
                if ("true" == $(this).find("enabled").eq(0).text()) {// 过滤禁用的零通道
                    oSel.append("<option value='" + id + "' bZero='true'>" + name + "</option>");
                }
            });
          //  showOPInfo(szIP + " 获取零通道成功！");
        },
        error: function () {
          //  showOPInfo(szIP + " 获取零通道失败！");
        }
    });
}
function autoLogout() {
    var szIP = $("#ip").val(),
        szInfo = "",
        type="";

    if (szIP == "") {
        return;
    }

    var iRet = WebVideoCtrl.I_Logout(szIP);
    if (0 == iRet) {
        szInfo = "退出成功！";
        type = "success";
        $("#ip option[value='" + szIP + "']").remove();
        getChannelInfo();
    } else {
        szInfo = "退出失败！";
        type = "error";
    }
    alertWindow(szInfo,type);
}
//停止预览
function StopRealPlay() {
    var oWndInfo = WebVideoCtrl.I_GetWindowStatus(g_iWndIndex),
        szInfo = "",
        type="";

    if (oWndInfo != null) {
        var iRet = WebVideoCtrl.I_Stop();
        if (0 == iRet) {
            szInfo = "停止预览成功！";
            type="success";
        } else {
            szInfo = "停止预览失败！";
            type="error";
        }
        alertWindow(szInfo,type);
    }
}
function alertWindow(text,type){
    swal({
        title:"",
        text:text,
        type:type,
        animation:"slide-from-top",
        allowOutsideClick:true,
        timer:3000
    }, function() {
    });
}

//4/25录像和截图
function clickOpenFileDlg(id, iType) {
    var szDirPath = WebVideoCtrl.I_OpenFileDlg(iType);
    if (szDirPath != -1 && szDirPath != "" && szDirPath != null) {
        $("#" + id).val(szDirPath);
    }
}

function clickSetLocalCfg() {
    var arrXml = [],
        szInfo = "";

    arrXml.push("<LocalConfigInfo>");
    arrXml.push("<PackgeSize>" + $("#packSize").val() + "</PackgeSize>");
    arrXml.push("<PlayWndType>" + $("#wndSize").val() + "</PlayWndType>");
    arrXml.push("<BuffNumberType>" + $("#netsPreach").val() + "</BuffNumberType>");
    arrXml.push("<RecordPath>" + $("#recordPath").val() + "</RecordPath>");
    arrXml.push("<CapturePath>" + $("#previewPicPath").val() + "</CapturePath>");
    arrXml.push("<PlaybackFilePath>" + $("#playbackFilePath").val() + "</PlaybackFilePath>");
    arrXml.push("<PlaybackPicPath>" + $("#playbackPicPath").val() + "</PlaybackPicPath>");
    arrXml.push("<DownloadPath>" + $("#downloadPath").val() + "</DownloadPath>");
    arrXml.push("<IVSMode>" + $("#rulesInfo").val() + "</IVSMode>");
    arrXml.push("<CaptureFileFormat>" + $("#captureFileFormat").val() + "</CaptureFileFormat>");
    arrXml.push("<ProtocolType>" + $("#protocolType").val() + "</ProtocolType>");
    arrXml.push("</LocalConfigInfo>");

    var iRet = WebVideoCtrl.I_SetLocalCfg(arrXml.join(""));

    if (0 == iRet) {
        szInfo = "本地配置设置成功！";
    } else {
        szInfo = "本地配置设置失败！";
    }
    sweetAlert(szInfo);

}
//抓图
function clickCapturePic() {
    var oWndInfo = WebVideoCtrl.I_GetWindowStatus(g_iWndIndex),
        szInfo = "";

    if (oWndInfo != null) {
        var szChannelID = $("#channels").val(),
            // szPicName = oWndInfo.szIP + "_" + szChannelID + "_" + new Date().getTime(),
            szPicName = "show",
            iRet = WebVideoCtrl.I_CapturePic(szPicName);
        if (0 == iRet) {
            szInfo = "抓图成功！";
        } else {
            szInfo = "抓图失败！";
        }
        // sweetAlert(szInfo);
        // showOPInfo(oWndInfo.szIP + " " + szInfo);
    }
}
function clickStartRecord() {
    var oWndInfo = WebVideoCtrl.I_GetWindowStatus(g_iWndIndex),
        szInfo = "";

    if (oWndInfo != null) {
        var szChannelID = $("#channels").val(),
            szFileName = oWndInfo.szIP + "_" + szChannelID + "_" + new Date().getTime(),
            iRet = WebVideoCtrl.I_StartRecord(szFileName);
        if (0 == iRet) {
            szInfo = "开始录像成功！";
        } else {
            szInfo = "开始录像失败！";
        }
        sweetAlert(szInfo);
    }
}

// 停止录像
function clickStopRecord() {
    var oWndInfo = WebVideoCtrl.I_GetWindowStatus(g_iWndIndex),
        szInfo = "";

    if (oWndInfo != null) {
        var iRet = WebVideoCtrl.I_StopRecord();
        if (0 == iRet) {
            szInfo = "停止录像成功！";
        } else {
            szInfo = "停止录像失败！";
        }
        sweetAlert(szInfo);
    }
}

//表格时间
$(document).ready(function(){
    setInterval(showtime,1000);
    // $("#nowtime").html(new Date().toLocaleString());
    // $("#nowtime").innerText=new Date().toLocaleString();
})

function showtime() {
    $("#nowtime").html(new Date().toLocaleString())
}

// function comalarm(comdata) {
//     $.ajax({
//         type: 'post',
//         url: 'comalarm.jsp',
//         data: {
//             senddata:comdata,
//         },
//         // data: $("#log_form").serialize(),
//         success: function(data) {
//             // alert("11233");
//             if(data=="错误")
//                 sweetAlert("用户名或密码错误");
//             if(data=="正确")
//                 window.location.href="main_choose.jsp";
//             // window.location.href="MAIN.html";
//         }
//     });
// }

function forbikedogpeople() {
    var internal=setInterval(bikedogpeople,1000);
    $("#stopbikedogpeople").click(function () {
        //清除setInterval
        // comalarm('0110001A0001000FD8');
        clearInterval(internal);
    })
}
function bikedogpeople() {
    $.ajax({
        type: 'post',
        url: 'searchOptions.do',
        data:{
            signal:"start",
        },
        success: function(data) {
            // alert(JSON.stringify(data));
            if(data.bike==0)
                $("#车").html("正常");
            else
                $("#车").html("入侵");
            if(data.dog==0)
                $("#狗").html("正常");
            else
                $("#狗").html("入侵");
            if(data.door==0)
                $("#人").html("关");
            else
                $("#人").html("开");
            if(data.violent==0)
                $("#危险动作").html("无");
            else
                $("#危险动作").html("有");
        }
    });
}

function Picture(){
    var s="picture.do";
    $("#img_result").attr('src', s+ '?' + Math.random());
}

function continuouShowPic(){
    var internal=setInterval(chooseShowPic,500,"showPic.txt");
    $("#stopShowPic").click(function () {
        //清除setInterval
        clearInterval(internal);
    })
}

function chooseShowPic(filename) {
    $(function () {
        $.ajax({
            type: 'post',
            url: 'readTxt.do',
            data:{
                FILENAME:filename,
            },
            success: function (data) {
                if (data == "0") {
                    Picture();
                    writeTxt('showPic.txt','1');
                }
            }
        });
    });
}

function writeTxt(filename,content){
    $(function(){
        $.ajax({
            type: 'post',
            url: 'writeTxt.do',
            data:{
                FILENAME:filename,
                CONTENT:content,
            },
            success: function(data) {
            }
        });
    });
}

