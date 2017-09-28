/**
 * Created by try on 2017/9/24.
 */
function bigTableShow() {
    $("#myMap").attr("style","display:none");
    $("#myTable").attr("style","display:block");
    searchByLocation('');
}

$(document).ready(function() {
    searchByLocation('');
});
function searchByLocation(address) {

    $("#membernunit  tr:not(:first)").html("");
    $.ajax({
        type: 'post',
        url: 'searchByLocation.do',
        dataType: "json",
        data: {
            location: address,
        },
        success: function (data) {
            // data=JSON.stringify(data);
            var count = 0;
            if ($.isEmptyObject(data)) {
                sweetAlert("没有符合条件的数据");
            }
            else {
                var rowCount = 0;
                //通过循环取出data里面的值
                $.each(data, function (i, value) {
                    {
                        rowCount++;
                        count = 1;
                        var newRow = '<tr id="option' + rowCount + '"><td id="xuhao' + rowCount + '"></td>' +
                            '<td id="testxuhao' + rowCount + '"></td>' +
                            '<td id="danwei' + rowCount + '"></td>' +
                            '<td id="linkman' + rowCount + '"></td>' +
                            '<td id="address' + rowCount + '"></td>' +
                            '<td id="phone' + rowCount + '"></td></tr>';
                        $('#membernunit').append(newRow);
                        $("#xuhao" + rowCount).html(rowCount);
                        $("#testxuhao" + rowCount).html(value.testID);
                        $("#danwei" + rowCount).html(value.useUnit);
                        $("#linkman" + rowCount).html(value.linkman);
                        $("#address" + rowCount).html(value.address);
                        $("#phone" + rowCount).html(value.teleNumber);
                    }
                })
            }
            if (count == 0)
                sweetAlert("没有符合条件的数据");
        }
    });
}

$(document).ready(function() {
    $("body").on("click", "#membernunit tr", function () {
        // var sid = $(this).attr("id");
        var s= $(this).find("td").eq(2).text();
        detailsearch(s);
        $("#detail").modal('show');
    });
});

function detailsearch(useunit) {
    //$("#detail_table  tr:not(:first)").empty("");
    $("#detail_table  tr:not(:first)").empty("");
    //  $("#detail_table_body").html("");
    $.ajax({
        type: 'post',
        url: 'searchDetail.do',
        dataType: "json",
        data: {
            useunit: useunit,
        },
        success: function (data) {
            if ($.isEmptyObject(data)) {
                sweetAlert("此公司无电梯");
                //  return 0;
            }
            else {
                var rowCount = 0;
                //通过循环取出data里面的值
                $.each(data, function (i, value) {
                    rowCount++;
                    var newRow = '<tr id="detail_option' + rowCount + '"><td id="detail_xuhao' + rowCount + '"></td>' +
                        '<td id="detail_testxuhao' + rowCount + '"></td>' +
                        '<td id="detail_placeID' + rowCount + '"></td>' +
                        '<td id="detail_floor' + rowCount + '"></td>' +
                        '<td id="detail_weight' + rowCount + '"></td></tr>';
                    $('#detail_table').append(newRow);
                    $("#detail_xuhao" + rowCount).html(rowCount);
                    $("#detail_testxuhao" + rowCount).html(value.regisID);
                    $("#detail_placeID" + rowCount).html(value.sitesID);
                    $("#detail_floor" + rowCount).html(value.floorNum);
                    $("#detail_weight" + rowCount).html(value.carry);
                })
                // return 1;
            }
        } // data=JSON.stringify(data);
    });
}

function resetPassword() {
    $("#resetpassword").modal();
}
//进入camera.jsp
$(document).ready(function() {
    $("#detail_table ").click(function (){
        window.location.href="camera.do";
    })
})
