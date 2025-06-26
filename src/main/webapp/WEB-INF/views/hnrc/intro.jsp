<!DOCTYPE html>
<html lang="en">
<%--<head>--%>
<%-- <meta charset="UTF-8">--%>
<%-- <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%-- <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%-- <title>AMS 12</title>--%>
<%-- <meta name="keywords" content="The 12th conference of the Aseanian Membrane Society (AMS 12)" />--%>
<%-- <meta name="description" content="AMS was founded in 2002 and grows very fast since then. In the last AMS meeting (AMS 10) held in Busan, Korea, there were nearly 600 participants from more than 15 countries.">--%>
<%-- <meta name="author" content="bizvalley.co.kr">--%>
<%-- <meta property="og:type" content="website">--%>
<%-- <meta property="og:title" content="">--%>
<%-- <meta property="og:description" content="AMS was founded in 2002 and grows very fast since then. In the last AMS meeting (AMS 10) held in Busan, Korea, there were nearly 600 participants from more than 15 countries.">--%>
<%-- <meta property="og:image" content="http://www.ams12.org/images/main/logo.png">--%>
<%-- <meta property="og:url" content="http://www.ams12.org/">--%>

<%--</head>--%>
<%@include file="/WEB-INF/views/hnrc/include/head.jsp" %>
<style>
    .president-box {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
        column-gap: 30px;
        row-gap: 30px;

        justify-items: center;
        align-items: center;
    }

    .president-box > .president {
        text-align: center;
    }

    .content_p{
        font-size: 20px;
        line-height: 1.9;
        font-weight: 300;
        text-align: justify;
    }

    .content-table1 ul li{
        font-size: 1.2rem;
        margin-left: 15px;
        line-height: 1.9;
        font-weight: 300;
        list-style: disc;
        text-align: justify;
    }
    .content_p ul{
        padding-left: 20px;
    }
    .image_title{
        font-size: 18px;
        font-weight: 500;
        color: #666666
    }
    .titleh2{
        font-size: 20px;
        font-weight: 500;
    }
    .name {
        font-size: inherit;
        font-weight: 600;
    }

    .table-head {
        max-width: 150px;
        width: 7vw;
        min-width: 70px;
    }

    .nav-link {
        height: 100%;
    }

    .bold {
        font-weight: bold;
        /* 2번째 */
        text-align: center;
        background-color: #f2f2f6;

    }
    .page-icon{
        display: inline-block;
        vertical-align: middle;
        width: 1.6rem;
        height: 1.6rem;
        margin-top: -4px;
        background-image: url(${resourcesMedia}/site/ictc2023a/main/page-icon2.png);
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .president img{
        max-width: 120px;
    }

    @media screen and (max-width: 750px) {
        .president-box {
            grid-template-columns: 1fr 1fr 1fr;
        }
    }

    @media screen and (max-width: 425px) {
        .president-box {
            grid-template-columns: 1fr 1fr;
        }
    }

    /* 1번째 */
    /* .content-table2 tr:nth-of-type(odd){
          background-color: #f2f2f6;
      }*/

</style>
<body>

<div id="wrap">

    <%@include file="/WEB-INF/views/hnrc/include/header.jsp" %>

    <div class="header-full-box">
        <div class="container">
            <div class="full-box">
                <div class="full-title">
                    참여인력 및 기업
                </div>
            </div>
        </div>
    </div>
    <section class="now-page-section">
        <div class="container">
            <ul class="now-page">
                <li><i class="fas fa-home"></i> 홈 <i class="fas fa-chevron-right"></i></li>
                <li>참여인력 및 기업</li>
            </ul>
        </div>
    </section>
    <br/>
    <div id="content" class="container">

        <ul class="nav nav-tabs nav-justified semi-tab">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#first">참여 인력</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#second">참여 기업</a>
            </li>

            <%--추후 업로드 예정--%>
            <%--<li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#four">한국섬유공학회 지부</a>
            </li>--%>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="first">
                <img style="width: 100%;" src="https://journal-home.s3.ap-northeast-2.amazonaws.com/site/hnrc/co1.png"/>
            </div>
            <div class="tab-pane fade" id="second">
                <table class="content-table1"><thead>

                <tr>
                    <td style="width: 20%; background-color: #f2f2f6!important" rowspan="2">윌러스표준기술연구소</td>
                    <td style="width: 10%;">기업 소개</td>
                    <td style="text-align: left;">
                        <ul>
                            <li>LTE Advanced Pro/5G NR/5G NR Advanced, Wi-Fi 6/7/8, 멀티미디어 코덱 표준기술 및 표준특허, 표준기반 상용 솔루션 개발 역량 보유</li>
                            <li>3GPP/IEEE/MPEG 표준기술 제안 620+/표준반영 220+/누적특허 2000+ 보유</li>
                            <li>과기부 ICT R&amp;D – 차세대 무선랜 Wi-Fi 6, Wi-Fi 7, 차세대 이동통신 LAA(Licensed Assisted Access) 표준개발 정부과제 최종평가 ‘우수’ 선정</li>
                        </ul>
                        </td>
                </tr>
                <tr>
                    <td>사업 영역</td>
                    <td style="text-align: left;">차세대 무선통신/방송 표준개발 및 원천특허 수익화, 표준 응용 솔루션 상용화</td>
                </tr></thead>
                </table>
            </div>


       </div>


    </div>

    <br/><br/>
    <br/><br/>
    <%@include file="/WEB-INF/views/hnrc/include/footer_section.jsp" %>
</div>
</body>
</html>
