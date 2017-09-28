//创建和初始化地图函数：
function initMap() {
    $.ajaxSettings.async = false;
    createMap();//创建地图
    setMapEvent();//设置地图事件
    addMapControl();//向地图添加控件
    //showAllElevator();//显示所有电梯公司
    // clear();
}

//创建地图函数：
function createMap() {
    var map = new BMap.Map("allmap");//在百度地图容器中创建一个地图
    // var point = new BMap.Point(118.78112418181817, 32.06591672727273);//定义一个中心点坐标
    var point = new BMap.Point(118.701875, 32.11);//定义一个中心点坐标
    window.map = map;//将map变量存储在全局
    map.centerAndZoom(point, 13);//设定地图的中心点和坐标并将地图显示在地图容器中

    map.clearOverlays();
}
//地图事件设置函数：
function setMapEvent() {
    map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
    map.enableScrollWheelZoom();//启用地图滚轮放大缩小
    map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
    map.enableKeyboard();//启用键盘上下左右键移动地图
}
//地图控件添加函数：
function addMapControl() {
    //向地图中添加缩放控件
    var ctrl_nav = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(ctrl_nav);
    //向地图中添加缩略图控件
    var ctrl_ove = new BMap.OverviewMapControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1});
    map.addControl(ctrl_ove);
    //向地图中添加比例尺控件
    var ctrl_sca = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});
    map.addControl(ctrl_sca);
}

//显示所有电梯
initMap();

function searchForMap(search_flag) {
    $("#myMap").attr("style","display:block");
    $("#myTable").attr("style","display:none");
    var type;
    if (search_flag == "search") {
        type = $("#search").val();
    }
    else {
        type = search_flag;
        $("#search").val(search_flag);
    }
    $("#factory  tr:not(:first)").html("");
    map.clearOverlays();
    $.ajax({
        type: 'post',
        url: 'searchForMap.do',
        dataType: "json",
        data: {
            keyWord: type,
        },
        success: function (data) {
            var count=0;
            var average_x=0.000000;
            var average_y=0.000000;
            average_x+=average_y;
            var times=0;
            if($.isEmptyObject(data)) {
                sweetAlert("没有符合条件的数据");
            }
            else {
                var rowCount=0;
                $.each(data, function (i, value) {
                        rowCount++;
                        count = 1;
                        var newRow = '<tr id="FAC' + rowCount + '"><td id="FACID' + rowCount + '"></td>' +
                            '<td id="FACNAME' + rowCount + '"></td></tr>';
                        $('#factory').append(newRow);
                        $("#FACID" + rowCount).html(rowCount);
                        $("#FACNAME" + rowCount).html(value.useUnit);
                    average_x=average_x*1+value.xcoordinate*1;
                    average_y=average_y*1+value.ycoordinate*1;
                    times++;
                    var point = new BMap.Point(value.xcoordinate, value.ycoordinate);
                    var marker = new BMap.Marker(point); //将点转化成标注点
//                                var label = new window.BMap.Label(i+1, { offset: new window.BMap.Size(0, 0) });
                    var label = new window.BMap.Label(rowCount, { offset: new window.BMap.Size(0, 0) });
                    label.setStyle({
                        color : "white",
                        fontSize : "14px",
                        backgroundColor :"0.05",
                        border :"0",
                        fontWeight :"bold"
                    });
                    marker.setLabel(label);
                    map.addOverlay(marker);  //将标注点添加到地图上
                    //添加监听事件
                    (function() {
                        var thePoint = value;
                        marker.addEventListener("click",
                            function() {
                                detail_mapsearch(value.useUnit);
                            });
                        marker.addEventListener("mouseover",
                            function() {
                                //    detail_mapsearch(value.UseUnit);
                                showInfo(this,thePoint);
                            });
                    })();// mapShow(value.Xcoordinate,value.Ycoordinate);
                })
            }
        }
    });
}

function detail_mapsearch(useunit){
    detailsearch(useunit);
    $("#detail").modal('show');
}

function showInfo(thisMarker,point) {
    //获取点的信息
    var sContent =
        '<ul style="margin:0 0 5px 0;padding:0.2em 0">'
        +'<li style="line-height: 26px;font-size: 15px;" onclick="detail_mapsearch(point.useUnit)">'
        + point.useUnit + '</li></ul>';
    var infoWindow = new BMap.InfoWindow(sContent); //创建信息窗口对象
    thisMarker.openInfoWindow(infoWindow); //图片加载完后重绘infoWindow
}

$(document).ready(function() {
    $("body").on("click", "#factory tr", function () {
        // var sid = $(this).attr("id");
        var s= $(this).find("td").eq(1).text();
        detailsearch(s);
        $("#detail").modal('show');
    });
});