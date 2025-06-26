function toggleEMailText(oSelect) {
    var id = "#" + $(oSelect).attr("id");
    if (oSelect.value == "-") {
        $(id + "_2").show();
        $(id + "_2").val('');
        $(id + "_2").focus();
    } else {
        $(id + "_2").hide();
        $(id + "_2").val($(id).val());
    }
}

function NumObj(obj) { if (event.keyCode >= 48 && event.keyCode <= 57) { return true; } else { (event.preventDefault) ? event.preventDefault() : event.returnValue = false; } }
function NumObjCom(obj) { if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 46)) { return true; } else { (event.preventDefault) ? event.preventDefault() : event.returnValue = false; } }
function NumObjHi(obj) { if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 45)) { return true; } else { (event.preventDefault) ? event.preventDefault() : event.returnValue = false; } }
function NumberCheck(obj, DecimalPoint, Minus) {
    if (event.keyCode == 45 && (obj.value.indexOf("-") == -1) && obj.selectionStart == 0 && Minus == '-') { return true; }
    if (event.keyCode == 46 && (obj.value.indexOf(".") == -1) && DecimalPoint > '0' && ((obj.selectionStart > 0) || obj.value.indexOf("-") == -1)) { return true; }
    if ((event.keyCode >= 48 && event.keyCode <= 57) && ((obj.selectionStart > 0) || obj.value.indexOf("-") == -1)) {
        if (obj.value.indexOf(".", 0) == -1) { return true; }
        if (obj.selectionStart < obj.value.indexOf(".", 0) + 1) { return true; }
        var arrValue = obj.value.split('.');
        if (arrValue[1].length < parseInt(DecimalPoint)) { return true; }
    }
    (event.preventDefault) ? event.preventDefault() : event.returnValue = false;
}
function CommaTaking(obj) {
    var beforeLength = obj.value.length;
    var selectionStart = obj.selectionStart;
    var selectionEnd = obj.selectionEnd;
    var str = "" + obj.value.replace(/,/gi, '');
    var regx = new RegExp(/(-?\d+)(\d{3})/);
    var arrValue = str.split('.');
    while (regx.test(arrValue[0])) { arrValue[0] = arrValue[0].replace(regx, "$1,$2"); }
    obj.value = arrValue[0] + (str.indexOf(".", 0) > -1 ? "." + arrValue[1] : "");
    var afterLength = obj.value.length;
    var gap = afterLength - beforeLength;
    if (selectionStart) {
        obj.selectionStart = selectionStart + gap;
        obj.selectionEnd = selectionEnd + gap;
    }
}
function GetRemoveComma(str){
	str = "" + str.replace(/,/gi,'');
    str = str.replace(/(^\s*)|(\s*$)/g, "");
    return (new Number(str));
}
function EnterKeyCheck() { if (event.keyCode == 13) { GotoListPage('1'); } else { return false; } }
function SetWaiting() { if ($(".loadingspinner").length > 0) { $(".loadingspinner").show(); } else { $('body').append('<div class="loadingspinner" style="position: fixed; top: 0; left: 0; height: 100%; width: 100%; background: url(/bizvalley/board/icon/processing.gif) center rgba(255,255,255,0.8) no-repeat;"></div>'); } }
function SetWaitingOff() { $(".loadingspinner").hide(); }

function GotoListPage(page, SortOrder, SortItem) {
    SetWaiting();
    if ($("#frm").length == 0) {
        var formdata = '<form name="frm" id="frm" method="get">';
        if (!(page == 0)) formdata += '<input type="hidden" name="page" />';
        if (SortOrder > "") formdata += '<input type="hidden" name="SortOrder" />';
        if (SortItem > "") formdata += '<input type="hidden" name="SortItem" />';
        formdata += '</form>';
        $("body").prepend(formdata);
    }
    if (!(page == 0)) frm.page.value = page;
    if (SortOrder > "") frm.SortOrder.value = SortOrder;
    if (SortItem > "") frm.SortItem.value = SortItem;
    frm.action = self.location;
    frm.submit();
}

function SetMonthDay(begin, end, nCnt) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);

    var now = new Date();
    var nowMonth = now.getMonth();
    var nowYear = now.getYear();
    nowYear += (nowYear < 2000) ? 1900 : 0;
    var nowDate = now.getDate();

    var fromYear = nowYear;
    var fromMonth = nowMonth;
    var fromDate = nowDate;

    fromMonth = fromMonth - nCnt;
    if (fromMonth < 0) { fromMonth = fromMonth + 12; fromYear--; }
    var fromLastDay = new Date(fromYear, fromMonth + 1, 0).getDate();
    if (fromLastDay > fromDate) {
        fromDate++;
    } else {
        fromDate = 1;
        fromMonth++;
        if (fromMonth == 12) { fromMonth = 0; fromYear++; }
    }
    obj1.value = fromYear + '-' + (((fromMonth + 1) < 10) ? "0" : "") + (fromMonth + 1) + '-' + ((fromDate < 10) ? "0" : "") + fromDate;
    obj2.value = formatDate(now);
}

function formatDate(date) {
    var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();
    return (date.getFullYear() + "-" + ((mymonth < 10) ? "0" : "") + mymonth + "-" + ((myweekday < 10) ? "0" : "") + myweekday);
}

function SetFromToDatepicker(DateFrom, DateTo, minDate, maxDate) {
    $(function () {
        var from = $("#" + DateFrom).datepicker({ maxDate: maxDate, minDate: minDate});
        var to = $("#" + DateTo).datepicker({ maxDate: maxDate, minDate: minDate });
    });
}
