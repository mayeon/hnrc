
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.springframework.web.servlet.support.RequestContextUtils"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="root" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}"/>
<c:set var="request_uri" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="locale" value="<%=RequestContextUtils.getLocale(request).toString()%>" />
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="resources"><spring:eval expression="@config['resources.path']" /></c:set>
<c:set var="resourcesMedia"><spring:eval expression="@config['resourcesMedia.path']" /></c:set>
<c:set var="env"><spring:eval expression="@config['super.env']"/></c:set>
<c:set var="baseUrl">${site.getBaseUrl(env)}</c:set>


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <title>5G&6G 차세대 통신 네트워크 연구센터</title>

    <meta name="Description" content="5G&6G 차세대 통신 네트워크 연구센터" />
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no" />
<%--    <meta property="og:image" content="${resourcesMedia}/site/fiber/main/web-fiber.png"/>--%>
<%--    <meta property="og:image:type" content="#">--%>
<%--    <meta property="og:image:width" content="300"/>--%>
<%--    <meta property="og:image:height" content="200"/>--%>
    <meta property="og:title" content="5G&6G 차세대 통신 네트워크 연구센터"/>
    <meta property="og:url" content=""/>
    <meta property="og:description" name="Description" content="5G&6G 차세대 통신 네트워크 연구센터"/>
    <link href="https://use.fontawesome.com/releases/v6.3.0/css/all.css" rel="stylesheet">
    <script type="text/javascript" src="${resources}/js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="${resources}/js/custom.js"></script>
    <script type="text/javascript" src="${resources}/js/year.js"></script>
    <script type="text/javascript" src="${resources}/js/jquery.lazyload.min.js"></script>


    <link rel="stylesheet" href="${resources}/vendor/porto/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">


    <!-- jquery cdn -->
    <%--<script src="https://code.jquery.com/jquery-3.4.1.js"></script>--%>
    <!-- bootstrap cdn -->


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
    <script src="${resources}/vendor/porto/vendor/jquery.cookie/jquery.cookie.min.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${resources}/css/icpe/icpe-common_new.css"/>
    <link rel="stylesheet" type="text/css" href="${resources}/css/icpe/icpe-mobile.css"/>
    <link rel="stylesheet" type="text/css" href="${resources}/css/icpe/icpe-owl.carousel.css"/>
    <link rel="stylesheet" type="text/css" href="${resources}/css/icpe/icpe-style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>

    <script type="text/javascript" src="${resources}/js/icpe/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${resources}/js/icpe/owl.carousel.min.js"></script>
    <script type="text/javascript" src="${resources}/js/icpe/select.js"></script>
    <script type="text/javascript" src="${resources}/js/icpe/ui.js"></script>
    <script type="text/javascript" src="${resources}/js/icpe/bizvalley.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    <%--<link rel="stylesheet" type="text/css" href="/plugin/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="/plugin/slick/slick-theme.css"/>

    <script type="text/javascript" src="/js/jquery.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <%--    <link rel="stylesheet" type="text/css" href="${resources}/css/year.css?ver=1"/>--%>
    <%--    <link rel="stylesheet" type="text/css" href="${resources}/css/ict2021.css?ver=1"/>--%>


    <!-- HTML5 Shim and Respond.scripts IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.scripts doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


    <![endif]-->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <%-- 스포카 한 산스 --%>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

    <style>
        :root {
            --main-color: #273B90;
            --main-color2: #1A8EC8;
            --main-color3: #B8E9FF;
            --main-light-grey: #f1f3f5;
            --main-grey: #86888a;
            --main-color4: #FF7F00;
        }

        html, * {
            font-family: 'Noto Sans KR', sans-serif!important;
            font-size: 15px;
        }

        .fa, .far, .fas {
            font-family: Font Awesome\ 6 Free!important;
        }

        @media(max-width: 768px){
            html, *{
                font-size: 12px;
            }
        }

        a, span, strong, b {
            font-size: inherit;
        }

        a, span {
            font-weight: inherit;
        }

        a:hover {
            color: var(--main-color2);
        }
        /* footer 하단 고정 */
        html {
            height: 100%;
        }

        body {
            height: 100%;
        }

        #wrap{ /*A*/
            height: auto;
            min-height: 100%;
            position: relative;
            padding-bottom: 140px; /* footer height */
        }

        #footer { /*B*/
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
        }

        /* 기본 버튼 */
        .btn-default{
            background-color: var(--main-color);
            color: white;

            border: 2px solid var(--main-color);

            background-image: none;
            text-shadow: none;
            box-shadow: none;
        }

        .btn-default:focus, .btn-default:hover {
            background-color: white;
            color: var(--main-color) !important;
        }

        /* 사진 타이틀 부분 */
        .header-full-box{
            background-size: cover;
            background-image: url("${resourcesMedia}/site/semi/semi1.jpg");
            background-position: center;

        }
        .full-box{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 145px;
        }
        .full-title{
            color: white;
            font-size: 3rem;
            font-weight: 800;
            padding:  25px 0;
        }
        .now-page-section {
            border-bottom: 1px solid #eee;
        }
        .now-page {
            display: flex;
            padding:  15px 0;
            column-gap: 15px;
            flex-wrap: wrap;

            font-size: 1.2rem;
        }

        .now-page li {
            font-size: inherit;
        }

        .now-page li .fa-chevron-right {
            margin-left: 15px;
        }


        .now-page li .fa-home {
            margin-right: 5px;
        }

        /* 컨텐츠 */
        .content_p {
            font-size: 1.2rem;
            line-height: 1.9;
            color: #666666;
            font-weight: 300;
            text-align: justify;

            padding-bottom: 30px;

        }
        strong, b {
            font-size: inherit;
            font-weight: 600;
        }
        .subtitle-i{
            display: inline-block;
            vertical-align: middle;
            width: 1.4rem;
            height: 1.4rem;
            margin: -4px 10px 0 0 ;
            background-image: url(${resourcesMedia}/site/fiber/main/fiberLogo.svg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .titleh2 {
            font-size: 2.4rem;
            font-weight: 500;
        }
        .sub-title{
            font-size: 1.4rem;
            font-weight: bold;
            color: var(--main-grey);

            padding-bottom: 15px;
        }


        /* apnfo14  버튼 디자인 */
        .btn-box{
            display: flex;
            flex-wrap: wrap;
            gap: 1em;
            justify-content: center;

            padding-bottom: 30px;
        }
        .btn-box .btn{
            width: 240px;
        }

        .btn{
            background-image: none;
            text-shadow: none;

            font-size: 1.2rem;

            padding: 1rem 1.2rem;
        }

        .btn-default{
            background-color: var(--main-color);
            border: solid 2px var(--main-color);
            color: white;
        }
        .btn-default:hover{
            background-color: white;
            color: var(--main-color);
        }

        /* 버튼 크기 똑같이*/
        .btn-box2{
            display: flex;
            flex-wrap: wrap;
            gap: 1em;

            padding-bottom: 30px;
        }
        .btn-box2 .btn{
            flex-basis: 0;
            flex-grow: 1;
        }

        /* 표 디자인 */
        table td, table th {
            font-size: 1.2rem;
            font-weight: 300;
        }

        .content-table1 {
            border-top: 2px solid var(--main-color)!important;
            width: 100%;
        }

        .titleh2{
            font-size: 20px;
            font-weight: 500;
        }
        .page-icon {
            display: inline-block;
            vertical-align: middle;
            width: 1rem;
            height: 1rem;
            margin-top: -4px;
            background-image: url(https://journal-home.s3.ap-northeast-2.amazonaws.com/site/ictc2023a/main/page-icon2.png);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .content-table1 td {
            border-bottom: lightgrey 1px solid;
            text-align: center;
            border: 1px solid lightgrey;
            color: var(--main-grey);
            padding: 15px;
        }

        .content-table1 th {
            font-weight: 500!important;
            text-align: center;
            padding: 15px;
            border: 1px solid lightgrey;
            background: #f2f2f6!important;
            color: var(--main-grey)!important;
        }
        .content-table2 {
            border-top: 2px solid var(--main-color)!important;
            width: 100%;
        }
        .content-table2 td {
            border-bottom: lightgrey 1px solid;
            color: var(--main-grey);
            padding: 15px;
        }
        .content-table2 tr:first-of-type td {
            font-weight: 500!important;
            background: #f2f2f6!important;
            color: var(--main-grey)!important;
        }

        .content-table3 {
            border-top: 2px solid var(--main-color)!important;
            width: 100%;
        }
        .content-table3 td {
            border-bottom: lightgrey 1px solid;
            color: var(--main-grey);
            padding: 15px;
            text-align: left;
        }

        .title-td {
            font-weight: 500!important;
            background: #f2f2f6!important;
            color: var(--main-grey)!important;
            text-align: center!important;
        }

        /* ul */
        .content-ul{
            text-transform: none;

            text-align: left;
            list-style-position: inside;

            padding-bottom: 30px;
        }
        .content-ul li {
            font-weight: 300;
            list-style-position: inside;
            margin-left:  15px;
            text-indent: -15px;
            line-height: 1.9;

            font-size: 1.2rem;
            color: var(--main-grey);
        }

        /* nav tab */
        .semi-tab .nav-link {
            padding: 15px;
            border: 0;

            font-size: 1.2rem;

            background-color: #EEEEEE;
            color: var(--main-grey);
            border-radius: 0
        }
        .semi-tab .nav-link.active {
            color: white;
            background: linear-gradient(90deg, var(--main-color2) -45%, var(--main-color));
            border: 0;
            border-radius: 0;
        }
        .tab-content {
            padding: 15px 0;
        }


        /* 이중탭 */
        .fiber-second-tab{
            flex-wrap: nowrap;
        }
        .fiber-second-tab .nav-link {
            background-color: white;
            border: 1px solid #dadada;
            border-left: 0;
        }
        .fiber-second-tab .nav-item:first-of-type .nav-link{
            border-left: 1px solid #dadada;
        }
        .fiber-second-tab .nav-link.active {
            color: var(--main-color);
            border: solid 1px var(--main-color)!important;
            background: white;
        }

        /* 스크롤 */
        .menu-scroll{
            overflow-x: scroll;
        }
        .menu-scroll::-webkit-scrollbar-track{
            background: white;
        }
        .menu-scroll::-webkit-scrollbar{
            height: 7px!important;
        }
        .menu-scroll::-webkit-scrollbar-thumb{
            border-radius: 10px;
            background: #ddd;
        }

        @media (max-width: 991px) {
            .side-bar {
                display: none !important;
            }
        }
    </style>
</head>
