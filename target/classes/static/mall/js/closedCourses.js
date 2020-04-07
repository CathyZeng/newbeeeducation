$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/goods/list',
//        url:'/mall/inProgressOrders/list',
        datatype: "json",
        colModel: [
            //{label: 'id', name: 'orderId', index: 'orderId', width: 50, key: true, hidden: true},
            {label: '课程编号', name: 'goodsId', index: 'goodsId', width: 120},
             {label: '课程名称', name: 'goodsName', index: 'goodsName', width: 120},
            {label: '课程价格', name: 'sellingPrice', index: 'sellingPrice', width: 60},
            {label: '课程状态', name: 'goodsSellStatus', index: 'goodsSellStatus', width: 80, formatter: orderStatusFormatter},
//            {label: '支付方式', name: 'payType', index: 'payType', width: 80,formatter:payTypeFormatter},
//            {label: '收件人地址', name: 'userAddress', index: 'userAddress', width: 10, hidden: true},
            {label: '购买时间', name: 'createTime', index: 'createTime', width: 120}
           // {label: '操作', name: 'createTime', index: 'createTime', width: 120, formatter: operateFormatter}
        ],
        height: 760,
        rowNum: 20,
        rowList: [20, 50, 80],
        styleUI: 'Bootstrap',
        loadtext: '信息读取中...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "data.list",
            page: "data.currPage",
            total: "data.totalPage",
            records: "data.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order",
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

    function orderStatusFormatter(cellvalue) {
        //订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭
       return "课程已结束";
    }

    function payTypeFormatter(cellvalue) {
        //支付类型:0.无 1.支付宝支付 2.微信支付
        if (cellvalue == 0) {
            return "无";
        }
        if (cellvalue == 1) {
            return "支付宝支付";
        }
        if (cellvalue == 2) {
            return "微信支付";
        }
    }

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

});

/**
 * jqGrid重新加载
 */
function reload() {
    initFlatPickr();
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

function reset() {
    $("#totalPrice").val(0);
    $("#userAddress").val('');
    $('#edit-error-msg').css("display", "none");
}