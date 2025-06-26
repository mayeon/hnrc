<%--
  Created by IntelliJ IDEA.
  User: imseungchan
  Date: 2022/02/16
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function() {
        $(".none").hide();

        $(".menu01").mouseover(function() {
            $(".subMenu").stop().slideDown(300);
            $(".none").stop().slideDown(300);
        });
        $(".subMenu").mouseout(function() {
            $(".subMenu").stop().slideUp(300);
            $(".none").stop().slideUp(300);
        });
    });

</script>
<style>

    #header {
        border-top: 4px solid var(--main-color);
    }
    .m_xbtn{
        margin-top: 0px;
        padding: 10px 10px;
        float: right;
    }
    .m_menu_ul>li>a{
        background: var(--main-color);
        color: #fff;
    }
    .m_menu_header{
        padding: 12px 20px!important;
    }

    /* 로고 탑 */
    .logo {
        line-height: 110px;
        font-size: 2rem;
        font-weight: 600;
    }
    .h_top {
        height: 120px;
    }
    /* nav */
    .nav-ul{
        display: flex;
        justify-content: space-evenly;
    }
    .gnbli {
        margin: 0;
    }
    .linkul {
        display: block;
        float: none;
        background: none;
        width: max-content;
        height: auto;
        border: 0;
        padding: 0;
        margin: 0 0 0 auto;
    }

    /* sub menu */
    .sub_menu {
        border-top: 2px var(--main-color) solid;
        background: #FFF;
    }
    .sub_menu>li:hover {
        background-color: var(--main-color);
        border-left: 1px var(--main-color) solid;
        border-bottom: 1px var(--main-color) solid;
        border-right: 1px var(--main-color) solid;
    }

    /* full down menu */

    .topMenu {
        position: relative;
        width: 100%;
        text-align: center;
        height: 60px;
    }
    .topMenu:after {content: ""; display: block; clear: both; }
    .gnbbox {
        height: 60px;
    }
    .menu01 {
        display: flex;
        justify-content: space-around;
        z-index: 999;
    }
    .menu01 > li{

        color: #4a5156;
        height: 60px;
        line-height: 60px;
        font-weight: 700;

        flex-grow: 1;
        flex-basis: 0;
    }

    .menu01 > li > a {
        font-size: 1.2rem;
        color: black;
        font-weight: 500;
    }

    .menu01 li a::after {position: relative; content:""; display: block; border-bottom: 3px solid var(--main-color); transition: all 250ms ease-out; left: 50%; width: 0; top: -45px;}
    .menu01 .submenu li a::after {position: relative; content:""; display: block; border-bottom: 3px solid white; transition: all 250ms ease-out; left: 50%; width: 0; top: -45px;}
    .menu01 .submenu li a:hover {color: white}
    .menu01 li a:hover::after {transition: all 250ms ease-out; left: 0%; width: 100%; top: -45px;}
    .menu01 li a:hover {
        color: #4a5156;
    }


    .menu01 li span{
        font-size: 1.4rem;
        color: #4a5156;
        font-weight: 500;
    }

    .menu01 > li {
        text-align: center;
        line-height: 120px;
        height: 90%;
    }

    .none {
        /* 서브 메뉴 뒤에 부분 색 변경 */
        background-color: var(--main-color);
        opacity:0.95;/*투명도*/
        width: 100%;
        height: 340px;
    }

    .main-header-title {
        font-size: 2.4rem;
        font-weight: 800;
        background: linear-gradient(to right, var(--main-color2), var(--main-color));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    @media(max-width: 1119px){
        .mobile_wrap{
            display: flex!important;
            align-items: center;
        }

        .mobile_wrap a:first-of-type {
            font-size: 2rem;
            font-weight: 600;
        }
        .m_menu_logo {
            font-size: 2rem;
            font-weight: 600;
        }
        .gnbbox{
            display: none!important;
        }
        .logo{
            display: none!important;
        }

        .menu01{
            display: none!important;
        }
        .linkul{
            display: none!important
        }
        .location{
            display: none;
        }
        .h_top{
            height: fit-content;
            padding: 10px;
        }
        .mobile_menu{
            margin-top: 4px;
        }
        .m_logo > a > img{
            width: 80%;
        }


    }

    .sub {
        display: flex;
        position: absolute;
        text-align: center;
        height: 50px;
    }

    .sub > div {
        width: 19%;
    }

    .submenu {
        position: absolute;
        display: flex;
        width: 168.5%;
        justify-content: center;
        align-items: center;
        left: -70%;
        height: 75px;
        bottom: -57px;
        background: var(--main-color);
        box-shadow: 0px 5px 5px rgb(0 0 0 / 10%);
    }

    .submenu li {
        margin: 0 30px;
        color: white;
    }

    .submenu li a {
        font-size: 1.1rem;
    }

    .target-i {
        display: inline-block;
        vertical-align: middle;
        width: 1rem;
        height: 1rem;
        background-image: url(${resourcesMedia}/site/fiber/main/target-open.svg);
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .linkul a {
        line-height: 35px;
        font-weight: 600;
        color: var(--main-color);
        font-size: 1rem;
    }

    .linkul a::after {
        margin: 15px 16px 0;
    }

    .login-section {
        color: white;
        border-bottom: solid 1px #EEEEEE;
    }

    /* img slider */
    .carousel-item{
        max-height: 500px;
    }
    .carousel-control-next, .carousel-control-prev {
        width: 5% !important;
    }
    @keyframes upFade{
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to{
            opacity: 3;
            transform: none;
        }
    }
    @keyframes downFade{
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to{
            opacity: 3;
            transform: none;
        }
    }
    /*이미지 위 글씨*/
    .m1-img {
        min-height: 300px;
        width: 100%;
        object-fit: cover;
        object-position: center bottom;
    }
    .m1-img-text {
        font-family: 'Rubik', sans-serif;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);

        height: 100%;
        width: 100%;

        z-index: 1;
    }
    .m_linkul li{
        width: 30%;
    }
    .m1-text {
        display: flex;
        align-items: center;
        height: 100%;
    }
    .m1-text-all {
        width: max-content;
        text-align: center;
        margin: auto;
        padding: 20px;
    }
    .m1-text-box1 {
        width: max-content;
        padding-bottom: 1rem;
    }
    .m1-title{
        font-size: clamp(30px, 6.5vw, 40px);
        color: white;
        font-weight: 800;
        line-height: 1.2;
        animation: upFade 3s ease-in-out;

        text-shadow: 2px 2px 10px black;
    }
    .m1-sub-title{
        font-size: clamp(12px, 1.4vw, 25px);
        color: white;
        animation: downFade 3s ease-in-out;

        text-shadow: 2px 2px 10px black;
    }


</style>
<header>
    <div id="header">
        <div class="h_top">

            <div class="container">

                <div class="row" style="align-items: center">
                    <div class="logo col-md-5" >
                        <%--   실제 오픈 이후 %{baseUrl}로 변경할것--%>
                        <a href="${baseUrl}" style="display: flex; align-items: center; justify-content: left;     column-gap: 15px;">
                            <img style="height: 80px" src="${resourcesMedia}/site/hnrc/logo.png" alt="로고">
                        </a>

                    </div>
                    <ul class="menu01 col-md-7">

                        <li><a href="${baseUrl}/purpose" style="pointer-events: none;">센터 소개</a>
                            <ul class="submenu">
                                <li><a class="TBA" href="${baseUrl}/invite">인사말</a></li>
                                <li><a href="${baseUrl}/track">센터 소개</a></li>
                            </ul>
                        <li><a href="${baseUrl}/intro">참여인력 및 기업</a>

                        </li>
                        <li><a href="${baseUrl}/sTrack">연구목표</a>

                        </li>
                        <%--                        http://www.fiber.or.kr/publish/tse/--%>
<%--                        <li><a href="https://public.thinkonweb.com/journals/tse" target="_blank">출판물</a>--%>

                        <li><a class="TBA" href="${baseUrl}/board/news" >커뮤니티</a>

                        </li>
                    </ul>
                </div>

                <div class="mobile_wrap">
                    <a href="${baseUrl}">
                        <img style="height: 65px" src="${resourcesMedia}/site/hnrc/logo.png" alt="로고">
                    </a>
                    <a href="" class="mobile_menu"><img src="${resourcesMedia}/site/icpe2023c/menu_icon.png" alt=""></a>
                </div>
            </div>
        </div>

        <div class="m_menuwrap">
            <div class="m_menu_header" style="display: flex; flex-direction: row;">
                <div class="m_menu_logo">
                    <a href="${baseUrl}">
                        <img style="height: 65px" src="${resourcesMedia}/site/hnrc/logo.png" alt="로고">
                    </a>
                </div>

            </div>

            <ul class="m_menu_ul">
                <li>
                    <a href="${baseUrl}" onclick="window.location.href='${baseUrl}'">홈 </a>

                </li>
                <li>
                    <a href="#">센터 소개</a>
                    <ul class="depul">
                        <li><a class="TBA" href="${baseUrl}/invite">인사말</a></li>
                        <li><a href="${baseUrl}/track">센터 소개</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">참여인력 및 기업</a>
                    <ul class="depul">
                        <li><a href="${baseUrl}/intro">참여인력 및 기업 </a></li>
                    </ul>
                </li>

                <li>
                    <a href="#">연구목표</a>
                    <ul class="depul">
                        <li><a href="${baseUrl}/sTrack" style="pointer-events: none;">연구목표</a></li>
                    </ul>
                </li>
                <li>
                   <a href="#">커뮤니티</a>
                    <ul class="depul">
                        <li><a class="TBA" href="${baseUrl}/board/news" style="pointer-events: none;">커뮤니티</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

</header>
<style>
    .title-dot {
        background-color: #41477c;
        display: inline-block;
        width: 5px;
        height: 5px;
        vertical-align: middle;
        margin-right: 8px;
    }
</style>

<script>
    $('.submenu').css('display', 'none');
    $('.menu01 li').hover(
        function() {
            $('.submenu', this).css('display', 'flex');
        },
        function() {
            $('.submenu', this).css('display', 'none');
        }
    );
</script>

<script>
    $(".TBA").click(function(e){
        e.preventDefault();
        bootbox.alert("준비 중입니다.");
    });
</script>
