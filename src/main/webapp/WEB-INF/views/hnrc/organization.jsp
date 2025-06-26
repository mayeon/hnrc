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

  .content-table2 td{
    text-align: center;
    color: black !important;
  }
</style>
<body>

<div id="wrap">
  <%@include file="/WEB-INF/views/hnrc/include/header.jsp" %>

  <div class="header-full-box">
    <div class="container">
      <div class="full-box">
        <div class="full-title">
          조직도
        </div>
      </div>
    </div>
  </div>
  <section class="now-page-section">
    <div class="container">
      <ul class="now-page">
        <li><i class="fas fa-home"></i> 홈 <i class="fas fa-chevron-right"></i></li>
        <li>사업단 소개 <i class="fas fa-chevron-right"></i></li>
        <li>조직도</li>
      </ul>
    </div>
  </section>

  <br/>

  <div id="content" class="container">
    <ul class="nav nav-tabs nav-justified semi-tab">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#first">조직도/업무분장</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#second">참여학과</a>
      </li>

      <%--추후 업로드 예정--%>
      <%--<li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#four">한국섬유공학회 지부</a>
      </li>--%>
    </ul>
    <div class="tab-content">
      <div class="tab-pane fade show active" id="first">
        <div class="content_p">
          <br/><br/>
          <table style="width: 100%">
            <colgroup>
              <col width="20%"/>
              <col width="20%"/>
              <col width="20%"/>
              <col width="20%"/>
              <col width="20%"/>
            </colgroup>
            <thead>
            <tr>
              <th> </th>
              <th> </th>
              <th style="color:black; font-weight:bold; text-align:center; border: 3px solid #273B90; padding: 20px;" >사업단장</th>
              <th> </th>
              <th> </th>

            </tr>
            </thead>
            <tbody>
            <tr>
              <td>&nbsp;</td>
              <td> </td>
              <td style="text-align: center;  padding: 10px;"><img width="30px;" src="${resourcesMedia}/site/semi/downarrow_87468.png"/></td>
              <td> </td>
              <td> </td>

            </tr>
            <tr>
              <td> </td>
              <td> </td>
              <td style="color:black; font-weight:bold; text-align:center; border: 3px solid #273B90; padding: 20px;">사업부단장</td>
              <td> </td>
              <td> </td>

            </tr>
            <tr>
              <td>&nbsp; </td>
              <td> </td>
              <td style="text-align: center; padding: 10px;"><img width="30px;" src="${resourcesMedia}/site/semi/downarrow_87468.png"/></td>
              <td> </td>
              <td> </td>

            </tr>
            <tr>
              <td style="color:black; font-weight:bold; text-align:center; border: 3px solid #273B90; padding: 20px;">트랙 융합교육부</td>
              <td style="color:black; font-weight:bold; text-align:center; border: 3px solid #273B90; padding: 20px;">인프라관리부</td>
              <td style="color:black; font-weight:bold; text-align:center; border: 3px solid #273B90; padding: 20px;">학생관리부</td>
              <td style="color:black; font-weight:bold; text-align:center; border: 3px solid #273B90; padding: 20px;">산학협력부</td>
              <td style="color:black; font-weight:bold; text-align:center; border: 3px solid #273B90; padding: 20px;">운영지원팀</td>

            </tr>
            <tr>
              <td>&nbsp; </td>
              <td> </td>
              <td> </td>
              <td> </td>
              <td> </td>

            </tr>
            </tbody>
          </table>

          <br/>


          <table class="content-table2">
            <thead>

            </thead>
            <tbody>
            <tr>
              <td style="color: black !important;">성명 </td>
              <td style="color: black !important;">직급 </td>
              <td style="color: black !important;">연락처 및 이메일 </td>
            </tr>
            <tr>
              <td>김영철 </td>
              <td>단장 </td>
              <td>041) 560-1665<br/>yckim@koreatech.ac.kr </td>
            </tr>
            <tr>
              <td>김종팔 </td>
              <td>부단장 </td>
              <td>041) 560-1311<br>jongpalk@koreatech.ac.kr </td>
            </tr>
            <tr>
              <td>서화일 </td>
              <td>인프라관리부 </td>
              <td>041) 560-1174<br> hiseo@kut.ac.kr </td>
            </tr>
            <tr>
              <td>장재영 </td>
              <td>트랙교육부·융합교육부 </td>
              <td>041) 560-1162<br>jyjang82@koreatech.ac.kr </td>
            </tr>
            <tr>
              <td>박수민 </td>
              <td>학생관리부 </td>
              <td>041) 560-1341<br>smpark@koreatech.ac.kr </td>
            </tr>
            <tr>
              <td>유형민 </td>
              <td>산학협력부 </td>
              <td>041) 560-1255<br>yhm2010@koreatech.ac.kr </td>
            </tr>
            <tr>
              <td><br> </td>
              <td>산학협력중점교수 </td>
              <td><br><br/> </td>
            </tr>
            <tr>
              <td>봉소연 </td>
              <td>운영지원팀 팀장 </td>
              <td>041) 560-1667<br>jane@koreatech.ac.kr </td>
            </tr>
            <tr>
              <td>박현경 </td>
              <td>운영지원팀 연구원 </td>
              <td>041) 560-1668<br>hyeongyeong@koreatech.ac.kr </td>
            </tr>
            <tr>
              <td>이소망 </td>
              <td>운영지원팀 연구원 </td>
              <td>041) 560-1669<br>we__wish93@koreatech.ac.kr </td>
            </tr>
            <tr>
              <td>김우진 </td>
              <td>운영지원팀 연구원 </td>
              <td>041) 560-1670<br>rla3753@@koreatech.ac.kr </td>
            </tr>
            </tbody>
          </table>


        </div>
      </div>
      <div class="tab-pane fade show" id="second">
        <div class="content_p">


          <div class="row" style="width: 100%;">

            <div class="col-md-6">
              <h2 style="color:var(--main-color); font-size: 1.5em; margin: 10px;">에너지신소재화학공학부(에너지신소재공학전공)</h2>
              <a href="https://www.koreatech.ac.kr/mse/" target="_blank"><img style="margin:10px; width: 100%;" src="${resourcesMedia}/site/semi/department/v1.png"/></a>
            </div>
            <div class="col-md-6">
              <h2 style="color:var(--main-color); font-size: 1.5em; margin: 10px;">에너지신소재화학공학부(화학생명공학전공)</h2>
              <a href="https://www.koreatech.ac.kr/ace/" target="_blank"><img style="margin:10px; width: 100%;" src="${resourcesMedia}/site/semi/department/v2.png"/></a>
            </div>
            <div class="col-md-6">
              <h2 style="color:var(--main-color); font-size: 1.5em; margin: 10px;">기계공학부 </h2>
              <a href="https://www.koreatech.ac.kr/me/" target="_blank"><img style="margin:10px; width: 100%;" src="${resourcesMedia}/site/semi/department/v3.png"/></a>
            </div>
            <div class="col-md-6">
              <h2 style="color:var(--main-color); font-size: 1.5em; margin: 10px;">메카트로닉스공학부 </h2>
              <a href="https://www.koreatech.ac.kr/mecha/" target="_blank"><img style="margin:10px; width: 100%;" src="${resourcesMedia}/site/semi/department/v4.png"/></a>
            </div>
            <div class="col-md-6">
              <h2 style="color:var(--main-color); font-size: 1.5em; margin: 10px;">전기·전자·통신공학부 </h2>
              <a href="https://www.koreatech.ac.kr/ite/" target="_blank"><img style="margin:10px; width: 100%;" src="${resourcesMedia}/site/semi/department/v5.png"/></a>
            </div>


          </div>
        </div>
      </div>
    </div>

  </div>

  <br/><br/>
  <br/><br/>
  <%@include file="/WEB-INF/views/hnrc/include/footer_section.jsp" %>
</div>
</body>
</html>
