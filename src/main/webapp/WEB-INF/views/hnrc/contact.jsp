<!DOCTYPE html>
<html lang="en">

<%@include file="/WEB-INF/views/hnrc/include/head.jsp" %>
<style>

</style>
<body>

<div id="wrap">
  <%@include file="/WEB-INF/views/hnrc/include/header.jsp" %>

  <div class="header-full-box">
    <div class="container">
      <div class="full-box">
        <div class="full-title">
          오시는 길
        </div>
      </div>
    </div>
  </div>
  <section class="now-page-section">
    <div class="container">
      <ul class="now-page">
        <li><i class="fas fa-home"></i> 홈 <i class="fas fa-chevron-right"></i></li>
        <li>사업단 소개 <i class="fas fa-chevron-right"></i></li>
        <li>오시는 길</li>
      </ul>
    </div>
  </section>

  <br/>
  <div id="content" class="container">
    <div class="tab-content">
      <div class="tab-pane fade show active" id="first">
        <div class="content_p">
          <br/>
          <iframe style="width: 100%;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3196.4064201277924!2d127.27680107631473!3d36.76081646991777!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b2bfed2f59b5d%3A0x63f05b9beed751d!2z7ZWc6rWt6riw7Iig6rWQ7Jyh64yA7ZWZ6rWQIOywveyXheuztOycoeq0gA!5e0!3m2!1sko!2skr!4v1715217739372!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

          <div style="padding: 50px; background-color: var(--main-color); color: white; font-size: 1em;">
            · 주소 : (31253) 충청남도 천안시 동남구 병천면 충절로 1600 한국기술교육대학교 창업보육관 102호<br/>
            · 전화 : 041-560-1670
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
