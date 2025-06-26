<!DOCTYPE html>
<html lang="en">

<%@include file="/WEB-INF/views/hnrc/include/head.jsp" %>

<%--FONT 프리텐다드--%>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/variable/pretendardvariable.css" />

<style>
    .main-section {

    }
    /*index-title*/
    .index-title-box {
        display: flex;
        justify-content: space-between;
        align-items: center;

        column-gap: 30px;

        padding: 15px;

    }

    .index-title {
        font-size: 2rem;
        text-align: center;
        font-weight: 600;
    }

    .more-btn {
        display: flex;
        align-items: center;
        justify-content: center;

        height: 2rem;
        aspect-ratio: 1/1;
        border: solid 2px var(--main-color);
    }

    .main-title-60 {
        font-size: clamp(32px, 3.5vw, 56px);
        font-weight: 800;
        color: #FFF101;
        line-height: 1.2;
        text-shadow: 1px 1px 2px black;

        text-align: center;
        font-family: 'Pretendard Variable', sans-serif!important;

        padding-bottom: 15px;

    }

    .main-sub-content-60 {
        font-size: clamp(32px, 4vw, 50px);
        font-weight: 800;
        color: white;
        line-height: 1.2;
        text-shadow: 1px 1px 2px black;
        font-family: 'Pretendard Variable', sans-serif!important;

        text-align: center;
    }
    .main-title-40 {
        font-size: clamp(26px, 3.5vw, 41px);
        font-weight: 800;
        color: darkgreen;
        line-height: 1.2;
        text-shadow: 1px 1px 2px lightgrey;

        text-align: left;
        font-family: 'Pretendard Variable', sans-serif!important;

        padding-bottom: 15px;

    }

    .main-sub-content-40 {
        font-size: clamp(12px, 4vw, 22px);
        font-weight: 500;
        color: black;
        line-height: 1.2;

        font-family: 'Pretendard Variable', sans-serif!important;

        text-align: left;
    }

    /* notice */
    .board-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 0;

        border-top: 2px solid var(--main-color);
        border-left: 1px solid lightgrey;
    }
    .board-grid .index-board {

        border-right: 1px solid lightgrey;
        border-bottom: 1px solid lightgrey;
    }
    .board-title-box {
        display: flex;
        justify-content: space-between;
        align-items: center;

        border-bottom: solid 1px lightgrey;
        padding : 15px 15px 5px;

        background: #E9EBF4;
        color: var(--main-color);
    }
    .board-title {
        font-weight: 600;
        font-size: 1.4rem;
        line-height: 1.2;

        transition: all 250ms ease-out;

        width: max-content;
        color: var(--main-color);
    }
    .board-content-box {
        padding : 5px 15px 15px
    }

    .article-box {
        display: flex;
        font-size: 1.1rem;
        width: 100%;

        justify-content: space-between;
        align-items: center;
    }
    .article-title {
        padding: 3px 15px 3px 0;
        font-size: inherit;

        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }
    .article-date {
        font-size: inherit;
        color: grey;
    }

    @keyframes rotate {
        from {
            -webkit-transform: rotate(0deg);
            -o-transform: rotate(0deg);
            transform: rotate(0deg);
        }
        to {
            -webkit-transform: rotate(360deg);
            -o-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }
    .board-more-btn {
        font-size: 1.4rem;
    }
    .board-title-box:hover .board-more-btn {
        color: var(--main-color);
        animation: rotate 3s infinite;
    }

    /* short cut */
    .quick-menu-box {
        height: 100%;

        display: grid;
        grid-template-columns: 1fr 1fr;

        border-top: 1px solid lightgrey;
        border-left: 1px solid lightgrey;
    }
    .quick-menu {
        position: relative;
        display: flex;
        flex-direction: column;
        justify-content: space-around;

        text-align: center;

        padding: 1rem;

        border-right: 1px solid lightgrey;
        border-bottom: 1px solid lightgrey;

        background-color: white;

        transition: all .5s ease;
        overflow: hidden;
    }
    .quick-menu:before {
        position: absolute;
        content: '';
        left: 0;
        bottom: 0;
        height: 4px;
        width: 100%;
        border-bottom: 4px solid transparent;
        border-left: 4px solid transparent;
        box-sizing: border-box;
        transform: translateX(100%);
    }
    .quick-menu:after {
        position: absolute;
        content: '';
        top: 0;
        left: 0;
        height: 4px;
        width: 100%;
        border-top: 4px solid transparent;
        border-right: 4px solid transparent;
        box-sizing: border-box;
        transform: translateX(-100%);
    }
    .quick-title {
        position: relative;
        font-size: 1.2rem;
        word-break: keep-all;
    }
    .quick-icon img {
        max-width: 35px;
    }

    .quick-menu:hover {
        z-index: 1;
        box-shadow: 0 5px 15px var(--main-color);
    }
    .quick-menu:hover:before {
        border-color: var(--main-color);
        height: 100%;
        transform: translateX(0);
        transition: .15s transform linear, .15s .15s height linear  ;
    }
    .quick-menu:hover:after {
        border-color: var(--main-color);
        height: 100%;
        transform: translateX(0);
        transition: .15s .3s transform linear, .15s .45s height linear;
    }


    /* 광고 */
    .ad-info {
        position: absolute;

        height: 100%;
        width: 100%;

        display: none;
        justify-content: center;
        align-items: center;

        background: rgba(0, 0, 0, 0.5);
    }
    .ad-info-content {
        color: white;
        font-size: 1.4rem;
    }
    #carouselExampleIndicators .carousel-inner:hover .ad-info {
        display: flex;
    }

    /* gallery */
    .gallery-box {
        position: relative;
    }
    .gallery-img {
        width: 100%;
        aspect-ratio: auto 1/1;

        overflow: hidden;
    }
    .gallery-img img{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .gallery-content{
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: rgba(39, 59, 144, 0.8);
        /*background-color: rgba(0, 0, 0, .7);*/
        text-align: center;

        padding: 5px;

        visibility: hidden;
        -webkit-transition: all .2s ease-in;
        -moz-transition: all .2s ease-in;
        -ms-transition: all .2s ease-in;
        -o-transition: all .2s ease-in;
        transition: all .2s ease-in;
        -webkit-transform: translateY(50px);
        -moz-transform: translateY(50px);
        -ms-transform: translateY(50px);
        -o-transform: translateY(50px);
        transform: translateY(50px);
    }
    .gallery-box:hover .gallery-content {
        visibility: visible;
        -webkit-transition: all .2s ease-in;
        -moz-transition: all .2s ease-in;
        -ms-transition: all .2s ease-in;
        -o-transition: all .2s ease-in;
        transition: all .2s ease-in;
        -webkit-transform: translateY(-5px);
        -moz-transform: translateY(-5px);
        -ms-transform: translateY(-5px);
        -o-transform: translateY(-5px);
        transform: translateY(-5px);
    }
    .gallery-date {
        font-size: 0.8rem;
        color: lightgrey;
    }
    .gallery-title{
        font-size: 1.2rem;
        color:white;

        width: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;  /* 말줄임 적용 */
    }

    @media (max-width: 767px) {
        .board-grid {
            grid-template-columns: 1fr 1fr;
        }
    }
    @media (max-width: 425px) {
        .board-grid {
            grid-template-columns: 1fr;
        }
    }

    .mbusg {
        background: url(${resourcesMedia}/site/hnrc/back2.png) no-repeat center;
        height: 650px;
        background-size: cover;
        /* overflow: hidden; */
        /* padding-top: 90px; */
        box-sizing: border-box;
        display: flex;
        align-items: center;
    }
    .mbocts {
        font-size: 14px;
        opacity: 1;
        padding-bottom: 50px;
        line-height: 160%;
    }
    .mboct {
        font-size: 30px;
        padding-bottom: 25px;
    }

    .mbmore {
        border: 1px solid rgb(255 255 255 / 50%);
        height: 40px;
        line-height: 40px;
        width: 190px;
        text-align: center;
        font-size: 18px;
        font-weight: 500;
        margin-bottom: 55px;
    }

    .mbusbox {
        background: rgba(0, 3, 6, 0.7);
        color: #fff;
        padding: 60px 30px;
        width: 340px;
        box-sizing: border-box;
    }

    /* main indicators */
    .main-indicators {
        position: absolute;

        padding-left: 0;
        margin: 0;
        list-style: none;

        height: 60px;
    }
    .indicator-item {
        flex-basis: 0;
        flex-grow: 1;

        height: 100%;

        display: flex;
        align-items: center;
        justify-content: center;


        cursor: pointer;
        background-color: #fff;
        opacity: .5;
        transition: opacity .6s ease;
    }
    .main-roll-title {
        font-size: 1.4rem;
    }
    .indicator-item.active{
        background: var(--main-color);
    }
    .indicator-item.active .main-roll-title {
        color: white;
        font-weight: 600;
    }


    .carousel-inner::before {

        width: 100%;
        height: 100%;
        opacity: 0.5;
        position: absolute;
        z-index: 0;
        /*background: rgba(39, 59, 144, 0.3);*/
    }

    /* main inner */
    #main-slide .carousel-item img {
        height: 450px;
        object-fit: cover;
    }
    .main-text-box{
        position: absolute;
        top: 0;
        left: 0;
        height: calc(100% - 60px);
        width: 70%;
        z-index: 1;

        display: flex;
        justify-content: center;
        align-items: center;
        padding: 30px;
    }
    .main-title {
        font-size: clamp(32px, 3.5vw, 56px);
        font-weight: 800;
        color: white;
        line-height: 1.2;
        text-shadow: 1px 1px 2px black;
        text-align: center;
        font-family: 'Pretendard Variable', sans-serif!important;

        padding-bottom: 15px;
    }

    .main-title span {
        font-family: inherit!important;
        font-size: inherit;
        color: #FFF101;
    }
    .main-sub-content {
        text-align: center;
        font-size: clamp(32px, 1.2vw, 50px);
        color: white;
        line-height: 1.2;
        text-shadow: 1px 1px 2px black;
        font-family: 'Pretendard Variable', sans-serif!important;
        font-weight: 400;
    }

    /* static-menu */
    .main-static-all{
        position: absolute;
        top: 0;
        right: 0;
        z-index: 1;

        height: calc(100% - 60px);
        width: 30%;
        padding: 30px;
    }
    .static-menu-box {
        height: 100%;

        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: space-evenly;
        row-gap: 10px;
    }
    .static-menu {
        flex-basis: 0;
        flex-grow: 1;

        width: 100%;
        padding: 1rem;

        background: rgba(0, 0, 0, 0.3);

        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .static-menu-title, .static-menu-icon i {
        font-size: 1.4rem;
        color: white;
    }


    @keyframes bounce {
        0%, 100%{
            transform: translateX(0);
        }
        50% {
            transform: translateX(-3px);
        }

    }

    .static-menu:hover {
        background: var(--main-color);
    }
    .static-menu:hover .static-menu-title {
        color: white;
    }
    .static-menu:hover .static-menu-icon i{
        animation: bounce 500ms infinite linear;
        color: white;
    }

    @media (max-width: 767px) {
        .m-img{
            display: none;
        }
        .board-grid {
            grid-template-columns: 1fr 1fr;
        }
        .main-text-box {
            padding: 5px;
            width: 100%;
        }
        .main-static-all {
            position: static;
            height: auto;
            width: 100%;
            padding: 40px 0 0 0;
        }
        .static-menu-box {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            column-gap: 10px;
        }
        .static-menu {
            height: 100%;

            background: white;
            border: solid 1px var(--main-color);
        }

        .static-menu-title, .static-menu-icon i {
            color: var(--main-color);
        }

    }
    @media (max-width: 660px) {
        .static-menu-box {
            grid-template-columns: 1fr 1fr;
        }
    }
    @media (max-width: 425px) {
        /* main-roll 수정 */
        .main-title {
            font-size: 2rem;
        }
        .main-sub-content {
            font-size: 1.2rem;
        }
        .static-menu-title, .static-menu-icon i{
            font-size: 1.2rem;
        }
        #main-slide .carousel-item img {
            height: 300px;
        }

        .indicator-item.active {
            background-color: #fff;
            background-clip: padding-box;
        }
        /* indicator 모양 변경 */
        .indicator-item {
            box-sizing: content-box;
            -ms-flex: 0 1 auto;
            flex: 0 1 auto;
            width: 30px;
            height: 3px;
            margin-right: 3px;
            margin-left: 3px;
            text-indent: -999px;
            cursor: pointer;
            background-color: #fff;
            background-clip: padding-box;
            border-top: 10px solid transparent;
            border-bottom: 10px solid transparent;
            opacity: .5;
            transition: opacity .6s ease;
        }
        .main-indicators {
            height: auto;
        }
        .board-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
<body>
<div id="wrap">
    <%@include file="/WEB-INF/views/hnrc/include/header.jsp" %>


    <div class="main-section">
        <div class="container" style=" max-width: 1800px;">
            <div style="position:relative">
                <div id="demo" class="carousel slide m1-img-box" data-ride="carousel">

                    <!-- Indicators -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                        <li data-target="#demo" data-slide-to="3"></li>

                    </ul>


                    <!-- The slideshow -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="m1-img"
                                 src="${resourcesMedia}/site/hnrc/back3.jpg"/>
                            <%-- text --%>
                            <div class="container m1-img-text">
                                <div class="m1-text" style="">
                                    <div class="m1-text-all">
                                        <div class="m1-text-box1">
                                            <div class="m1-title">5G&6G 차세대 통신 네트워크 융합 인재 양성</div>
<%--                                            <div class="m1-sub-title">--%>
<%--                                                반도체공정/장비 분야에 특화 인재 양성--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="carousel-item ">
                            <img class="m1-img"
                                 src="${resourcesMedia}/site/hnrc/back3.jpg"/>
                            <%-- text --%>
                            <div class="container m1-img-text">
                                <div class="m1-text">
                                    <div class="m1-text-all">
                                        <div class="m1-text-box1">
                                            <div class="m1-title">5G&6G 차세대 통신 네트워크 융합 인재 양성</div>
<%--                                            <div class="m1-sub-title">--%>
<%--                                                3개 대학, 19개 학부·과, 140개 참여기업, 5개 지자체와 협력--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <img class="m1-img"
                                 src="${resourcesMedia}/site/hnrc/back3.jpg"/>
                            <%-- text --%>
                            <div class="container m1-img-text">
                                <div class="m1-text" style="">
                                    <div class="m1-text-all">
                                        <div class="m1-text-box1">
                                            <div class="m1-title">5G&6G 차세대 통신 네트워크 융합 인재 양성</div>
                                            <%--                                            <div class="m1-sub-title">--%>
                                            <%--                                                3개 대학, 19개 학부·과, 140개 참여기업, 5개 지자체와 협력--%>
                                            <%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="carousel-item ">
                            <img class="m1-img"
                                 src="${resourcesMedia}/site/hnrc/back3.jpg"/>
                            <%-- text --%>
                            <div class="container m1-img-text">
                                <div class="m1-text">
                                    <div class="m1-text-all">
                                        <div class="m1-text-box1">
                                            <div class="m1-title">5G&6G 차세대 통신 네트워크 융합 인재 양성</div>
                                            <%--                                            <div class="m1-sub-title">--%>
                                            <%--                                                3개 대학, 19개 학부·과, 140개 참여기업, 5개 지자체와 협력--%>
                                            <%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>

                </div>

            </div>
        </div>
    </div>



    <div class="section02">
        <div class="container">
            <div class="row" style="row-gap: 1rem">
                <%--바로가기--%>
                <div class="col-sm-6">
                    <div class="quick-menu-box">
                        <a class="quick-menu" href="${baseUrl}/purpose">
                            <div class="quick-icon"><img src="${resourcesMedia}/site/hnrc/ip1.png"></div>
                            <div class="quick-title">
                                <%--                                세미나/아카데미 신청--%>
                                센터 소개
                            </div>
                        </a>

                        <a class="quick-menu" href="${baseUrl}/intro">
                            <div class="quick-icon"><img src="${resourcesMedia}/site/hnrc/ip2.png"></div>
                            <div class="quick-title">
                                참여 인력 및 기업
                            </div>
                        </a>
                        <a class="quick-menu" href="${baseUrl}/sTrack">
                            <div class="quick-icon"><img src="${resourcesMedia}/site/hnrc/ip3.png"></div>
                            <div class="quick-title">
                                연구 목표
                            </div>
                        </a>
                        <%--                        <a class="quick-menu" href="${baseUrl}/onlinePay">--%>
                        <a class="quick-menu" href="${baseUrl}/board/news">
                            <div class="quick-icon"><img src="${resourcesMedia}/site/hnrc/ip4.png"></div>
                            <div class="quick-title">
                                <%--                                세미나/아카데미 신청--%>
                                커뮤니티
                            </div>
                        </a>

                    </div>

                </div>
                <%--광고--%>
                <div class="col-sm-6" >
                    <div style="background: white; border: #ddd 1px solid;">
                    <div class="index-title-box" style="border-bottom: 1px solid #ddd;" >
                        <div class="index-title">
                            공지사항
                        </div>
                        <a class="more-btn" href="#"><i class="fas fa-plus"></i></a>
                    </div>


                    <div class="index-board">
                        <div class="board-content-box">
                            <a class="article-box" href="#">
                                <div class="article-title">센터 오픈에 따른 공지</div>
                                <div class="article-date">2025-06-25</div>
                            </a>
                            <a class="article-box" href="#">
                                <div class="article-title">센터 오픈에 따른 공지</div>
                                <div class="article-date">2025-06-25</div>
                            </a>
                            <a class="article-box" href="#">
                                <div class="article-title">센터 오픈에 따른 공지</div>
                                <div class="article-date">2025-06-25</div>
                            </a>
                            <a class="article-box" href="#">
                                <div class="article-title">센터 오픈에 따른 공지</div>
                                <div class="article-date">2025-06-25</div>
                            </a>
                        </div>
                    </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <section>
        <div class="mbusg">
            <div class="container w1300">
                <div class="mbusbox">
                    <a href="#" style="color: inherit; text-decoration: none; background: transparent;">
                        <div class="mbocbox">
                            <div class="mboct">센터 소개</div>
                            <div class="mbocts">차세대 통신·네트워크 핵심 요구사항인 8U(초공간·초대역·초신뢰·초연결·초저지연·초정밀·초지능·초효율)을 달성하기 위하여 산·학·연 컨소시움을 통한 기반 기술 개발 및 지적재산권 확보와 표준화를 추진,궁극적으로 5G&6G 차세대 통신 네트워크 융합 인재 양성을 목표로 함</div>
                            <div class="mbmore">자세히보기</div>
                        </div>
                    </a>
                </div>


            </div>
        </div>

    </section>

    <section>
        <div class="container" style="padding-top: 30px; padding-bottom: 30px;">
            <h2 style="font-size: 30px; font-weight: bold;">참여대학 및 기관</h2>
            <br/><br/>
            <div class="row">
                <div class="col-md-12" style="text-align: center;">
                    <img style="width: 100%;" src="${resourcesMedia}/site/hnrc/univ.png"/>
                </div>


            </div>
            <br/><br/>


        </div>
    </section>



    <%@include file="/WEB-INF/views/hnrc/include/footer_section.jsp" %>
</div>

<c:set var="popup" value="${site.getPopup(popupList, 'index')}"/>
<c:if test="${not empty popup}">
    <div class="modal fade" id="customPopup" tabindex="-1" role="dialog" aria-labelledby="customPopupLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                    <%--<div class="modal-header">
                        <h4 class="modal-title" id="defaultModalLabel2">강좌 기간 안내</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>--%>
                <div class="modal-body" style="text-align:center;border-bottom:1px solid #dee2e6">
                    <h4 class="modal-title" id="customPopupLabel" style="display:inline">&nbsp;&nbsp;${popup.subject}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body" style="text-align:center">
                        ${popup.contents}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<script>
    $('.aaa').click(
        function() {

            $( '#aaaa' ).find( 'li.show' ).attr('class', 'mainImg');
            $( '.mainImgBtn' ).find( 'li.btnActive' ).attr('class', 'aaa');
            if ($(this).attr('id') == '1') {
                $( '#img1' ).attr('class', 'mainImg show');
                $( '#1' ).attr('class', 'aaa btnActive');
            } else if ($(this).attr('id') == '2') {
                $( '#img2' ).attr('class', 'mainImg show');
                $( '#2' ).attr('class', 'aaa btnActive');

            } else if ($(this).attr('id') == '3') {

            }  else if ($(this).attr('id') == '4') {

            } else if ($(this).attr('id') == '5') {

            }
        }
    );

    $(document).ready(function(){
        <c:if test="${not empty popup}">
        $("#customPopup").modal("show");
        </c:if>
    });
</script>

<script>
    $(function () {
        $('.owl-sponsor').owlCarousel({
            items: 5,
            margin: 0,
            loop: true,
            autoplay: true,
            autoplayTimeout: 3000,
            autoplayHoverPause: false,
            dots:false
        });
    });

</script>
</body>
</html>




