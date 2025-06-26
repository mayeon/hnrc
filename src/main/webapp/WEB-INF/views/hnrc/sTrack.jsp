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
                    연구 목표
                </div>
            </div>
        </div>
    </div>
    <section class="now-page-section">
        <div class="container">
            <ul class="now-page">
                <li><i class="fas fa-home"></i> 홈 <i class="fas fa-chevron-right"></i></li>
                <li>연구 목표</li>
            </ul>
        </div>
    </section>
    <br/>
    <div id="content" class="container">

        <ul class="nav nav-tabs nav-justified semi-tab">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#first">세부 과제</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#second">연구수행 방법</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#third">기대효과</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="first">

                <p class="content_p">2030년까지 초공간 (U-S: Ultra-Space), 초대역 (U-B: Ultra-Bandwidth), 초신뢰 (U-R: Ultra-Reliability), 초연결 (U-C: Ultra-Connectivity), 초저지연 (U-L: Ultra-Low-Latency), 초정밀 (U-P: Ultra-Precision), 초지능 (U-I: Ultra-Intelligence), 초효율 (U-E: Ultra-Efficiency)을 지향하는 차세대 통신·네트워크 핵심 기술을 개발하고 5G-Advanced를 넘어 6G 및 7G 시대를 대비하는 전문 인력을 양성</p>

                <table class="content-table1">
                    <tbody>
                    <tr>
                        <td style="background-color: #f2f2f6!important">U-SBCI 안테나 기술</td>
                        <td style="text-align: left;">- 서브 테라헤르츠 대역 기초 연구 및 기술 선행연구<br/>
                            - 서브테라헤르츠(Sub-Thz) 대역에서의 반사 표면 설계 및 제작<br/>
                            - 초지능 반사 표면 설계 기술 연구<br/>
                            - 밀리미터파 대역 초지능형 표면 설계<br/>
                            - 서브 테라헤르츠 대역 지능형 반사 표면 설계</td>
                    </tr>
                    <tr>
                        <td style="background-color: #f2f2f6!important">U-BCLE 무선 접속 기술</td>
                        <td style="text-align: left;">- 셀룰러 네트워크 내에서의 D2D 통신을 위한 자원할당 기법 개발<br/>
                            - 심층강화학습 기반 D2D 무선 자원할당 기술 연구</td>
                    </tr>
                    <tr>
                        <td style="background-color: #f2f2f6!important">U-RLPI 네트워크 기술</td>
                        <td style="text-align: left;">- (U-RLPI 네트워크 기술)유저 및 트래픽별 단계 레벨 Classification<br/>
                            - (U-RLPI 네트워크 기술)유저 및 트래픽별 자원 예측 ML 모델 설계<br/>
                            - 네트워크 자원 식별 알고리즘 개발<br/>
                            - 사용자 단말 특성별 기계학습 기반 네트워크 자원관리 기술 개발</td>
                    </tr>
                    <tr>
                        <td style="background-color: #f2f2f6!important">U-RPIE 네트워크 관리 기술</td>
                        <td style="text-align: left;">- 지능 초정밀 네트워크 관리 기술 선행 연구<br/>
                            - 네트워크 관리를 위한 통신 보안 기술 선행 연구</td>
                    </tr>
                    <tr>
                        <td style="background-color: #f2f2f6!important">
                            5G/6G 차세대 통신네트워크 표준 기술 및 핵심 플랫폼 개발</td>
                        <td style="text-align: left;">- 실내 다중 전파 측정을 위한 측정 환경 구축 및 지능형 반사 표면 플랫폼 개발<br/>
                            - 지능형 반사 표면 플랫폼 구축을 위한 공간 배치도 후보 설정 및 전파 시뮬레이션<br/>
                            - 실내 다중 전파 측정을 위한 지능형 반사 표면 플랫폼 구축</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="second">
                <img src="${resourcesMedia}/site/hnrc/r1.png"/>
            </div>
            <div class="tab-pane fade" id="third">
                <table class="content-table1">
                    <tbody>
                    <tr>
                        <td style="width:20%; background-color: #f2f2f6!important">경제적 파급효과</td>
                        <td style="text-align: left;">- 서브 테라헤르츠 대역 기초 연구 및 기술 선행연구<br/>
                            - 네트워크 자원의 희소성으로부터 자유로워짐으로써 새로운 형태의 무선통신 기기와 서비스가 개발될 기회를 창출하며 이를 통한 새로운 통신 산업 성장의 기회 제공<br/><br/>
                            - 전 세계 스마트 시장 중 가장 크고, 활성화된 시장을 가진 우리나라의 레퍼런스 확보를 바탕으로 전 세계 네트워크 산업의 시장 주도<br/><br/>
                            - 관련 원천기술 및 소프트웨어 기술을 확보를 통해 급속하게 성장하고 있는 차세대 통신·네트워크 시장에서 큰 경제, 산업적 이득을 얻을 수 있을 것으로 기대<br/><br/>
                            - 차세대 통신·네트워크 기반 실감 콘텐츠 처리기술, 초공간/초연결 서비스 제공 핵심 원천기술을 활용하여, 현재 인프라가 가지는 호환성 이슈 등 한계 상황을 극복하여 6G가 요구하는 8U 서비스 대중적 확산 기여</td>
                    </tr>
                    <tr>
                        <td style="background-color: #f2f2f6!important">인재양성 파급효과</td>
                        <td style="text-align: left;">- 본 과제로부터 양성된 우수 인재들은 4차 산업혁명의 핵심 분야인 차세대 5G/6G 통신·네트워크 기술을 고도화시키는 핵심 인력으로 성장하여 초지능사회 구성에 크게 기여함<br/><br/>
                            - 특히, 차세대 통신·네트워크 기술의 고도화로 관련 신산업 분야의 핵심 기술에 대한 전문성을 지녀 향후 학계나 산업계 쪽에서 국가적으로 큰 기여를 할 수 있을 것으로 기대함<br/><br/>
                        - 또한, 본 센터에서의 기반 연구를 바탕으로 새로운 서비스 기술들을 등장시킬 수 있는 차세대 핵심 인력이 배출되어 지속적으로 증가하는 시장에 큰 파급효과를 일으킬 것으로 기대함</td>
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
