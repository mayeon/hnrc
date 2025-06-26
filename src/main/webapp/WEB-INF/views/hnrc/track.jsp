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

    .content_p ul li {
        font-size: 1.2rem;
        line-height: 1.9;
        color: #666666;
        font-weight: 300;
        text-align: justify;

        padding-bottom: 30px;

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
                    센터 소개
                </div>
            </div>
        </div>
    </div>
    <section class="now-page-section">
        <div class="container">
            <ul class="now-page">
                <li><i class="fas fa-home"></i> 홈 <i class="fas fa-chevron-right"></i></li>
                <li>센터 소개</li>
            </ul>
        </div>
    </section>
    <br/>
    <div id="content" class="container">


        <div class="tab-content">
            <br/><br/><br/>
            <div class="titleh2"><i class="page-icon"></i>&nbsp;
                설립 목적</div>
            <div class="content_p">
                <ul>
                    <li> 차세대 통신·네트워크 핵심 요구사항인 8U(초공간·초대역·초신뢰·초연결·초저지연·초정밀·초지능·초효율)을 달성하기 위하여 산·학·연 컨소시움을 통한 기반 기술 개발 및 지적재산권 확보와 표준화를 추진,궁극적으로 5G&6G 차세대 통신 네트워크 융합 인재 양성을 목표로 함</li>
                </ul>

            </div>

            <br/>
            <div class="titleh2"><i class="page-icon"></i>&nbsp;
                연구 기간</div>
            <div class="content_p">
                <ul>
                    <li> 2022-07-01 ~ 2029-12-31</li>
                </ul>

            </div>
            <br/>
            <div class="titleh2"><i class="page-icon"></i>&nbsp;
                연구 분야</div>
            <div class="content_p">
                <ul>
                    <li> 6G 이동통신, 6G 종단간 네트워크, 인공지능 기반 통신, 시맨틱 통신, 8U 통신 네트워크 기술</li>
                </ul>

            </div>
            <br/>
            <div class="titleh2"><i class="page-icon"></i>&nbsp;연구 인력</div>
            <div class="content_p">
                <table class="content-table1"><thead>
                <tr>
                    <th rowspan="2">대학 교수</th>
                    <th colspan="3">참여 학생</th>
                    <th rowspan="2">전임연구원</th>
                    <th rowspan="2">산학협력<br>중점교수</th>
                    <th rowspan="2">산업체</th>
                    <th rowspan="2">기타<br>(연구원,연구교수)</th>
                    <th rowspan="2">합계</th>
                </tr>
                <tr>
                    <th>학부</th>
                    <th>석사</th>
                    <th>박사</th>
                </tr></thead>
                    <tbody>
                    <tr>
                        <td>10</td>
                        <td>9</td>
                        <td>33</td>
                        <td>32</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>2</td>
                        <td>86</td>
                    </tr>
                    </tbody>
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
