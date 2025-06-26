/**
 * �꾩옱 url�먯꽌 �뱀젙 �뚮씪誘명꽣 媛� 媛��몄삤湲�
 * @param param
 * ex)
 * url : http://sdf.or.kr/yearly/visionaries.jsp?year=2016&lang=kr&pageIdx=3&query=
 * url : �꾩옱 url, param : url�먯꽌 戮묒븘�� �뚮씪誘명꽣紐�
 * getUrlParameter(url, 'pageIdx') = 3
 */
function getUrlParameter(url, param){
    var results = new RegExp('[\?&]' + param + '=([^&#]*)').exec(url);

    return results[1] || '';
}

/**
 * �꾩옱 url�먯꽌 �뱀젙 �뚮씪誘명꽣 媛� 蹂�寃쏀븯�� return
 * @param param
 * ex)
 * url : http://sdf.or.kr/yearly/visionaries.jsp?year=2016&lang=kr
 * url : ���걏rl, param : url�먯꽌 蹂�寃쏀븷 �뚮씪誘명꽣 紐�, val : 蹂�寃쏀븷 �뚮씪誘명꽣 媛�
 * setUrlParameter('lang', 'en') =  http://sdf.or.kr/yearly/visionaries.jsp?year=2016&lang=en
 */
function setUrlParameter(url, param, val){
    var paramRegex = new RegExp('('+param+'=)[^&]+', 'ig');
    url = url.replace(paramRegex, '$1' + val);

    return url.replace(/#/g, '');
}

function allImgLazyload(){
    try{
        $("img.lazy").lazyload({
            threshold: 200,
            skip_invisible: false
        });
    }catch(e){}
}

//�꾩옱 url �먯꽌 lang �뚮씪誘명꽣留� 蹂�寃쏀븯�� [KOR / ENG] 踰꾪듉 href �ㅼ젙
function changeUrlLang(){
    $('.lang li a').each(function(){
        var url = location.href.split('#');
        url = url[0];
//		var paramRegex = new RegExp('(lang=)[^&]+', 'ig');

        if("KOR" == $(this).text()){
            url = setUrlParameter(url, 'lang', 'kr');
//			url = url.replace(paramRegex, '$1' + 'kr');
        }else if("ENG" == $(this).text()){
            url = setUrlParameter(url, 'lang', 'en');
//			url = url.replace(paramRegex, '$1' + 'en');
        }

        url = setUrlParameter(url, 'pageIdx', '1');
        url = setUrlParameter(url, 'query', '');

        $(this).prop('href', url);
//		alert(url.replace(/#/g, ''));
    });
}

//�곗궗�붾뱶, �곸긽�붾뱶 �섏씠吏� [紐⑸줉蹂닿린] 踰꾪듉
function goListPage(pageName){
    var curUrl = window.location.href;
    var refUrl = document.referrer; //�댁쟾 url

    var year = getUrlParameter(curUrl, 'year');
    var lang = getUrlParameter(curUrl, 'lang');

    //�댁쟾 url怨� lang媛믪씠 �ㅻⅤ硫� back�꾨땲怨� 湲곕낯 �섏씠吏�濡� �대룞
    if(refUrl != ""){
        if( (lang != getUrlParameter(refUrl, 'lang')) || (refUrl.indexOf(pageName) < 0) ){
            window.location.href = "./"+pageName+".jsp?year="+year+"&lang="+lang;
        }else{
            history.back(-1);
        }
    }else{
        window.location.href = "./"+pageName+".jsp?year="+year+"&lang="+lang;
    }
}

//null, undefined 泥댄겕
function isEmpty (val) {
    return val == null  || val == 'null' || val == undefined || val == 'undefined' || val === 0 || !val;
}

function each (obj, fn, context) {
    if (Array.prototype.forEach && Array.prototype.forEach === obj.forEach) {
        obj.forEach(fn, context);
    } else if (Lib.isArrayLike(obj)) {
        for (var i = 0, len = obj.length; i < len; i++) {
            fn.call(context, obj[i], i, obj);
        }
    } else {
        for (var i = 0, keys = Lib.keys(obj), len = keys.length; i < len; i++) {
            var key = keys[i];
            fn.call(context, obj[i], i, obj);
        }
    }
}

function toHttps (url) {
    return url.replace(/http:/gi, 'https:');
}

function isArrayLike(val) {
    var length = val == null ? void 0 : val.length;
    return typeof length === 'number' && length >= 0;
}