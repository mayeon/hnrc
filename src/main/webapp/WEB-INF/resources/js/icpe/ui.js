$(document).ready(function(){

    // 테블릿, 모바일 메뉴 클릭
    $('.mobile_menu').click(function () {
       $('.m_menuwrap').css({'display':'block'});
       return false;
    });
    $('.m_menu_ul > li > a').click(function(){
     $(this).parents('li').siblings().children('a').removeClass('on');
     $(this).toggleClass('on');
     $(this).parents('li').siblings().find('.depul').slideUp();
     $(this).next('.depul').slideToggle();
     return false;
    });
    $('.m_xbtn').click(function(){
     $('.m_menuwrap').css({'display':'none'});
     return false;
    });

    // 랜딩페이지 메인 이미지 슬라이드
    $('.main_img').owlCarousel({
        autoplay:true,
        loop: true,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    });

    // 각 메뉴 hover
    $('.gnbul > li > a').mouseenter(function(){
      $('.sub_menu_box').hide();
      $(this).next('.sub_menu_box').css({'display':'block'});
    });
    $('.gnbbox').mouseleave(function(){
      $('.sub_menu_box').hide();
    });

    // 메인 AMS 12 E-newsletters 클릭
    $('.k_li02 > a').click(function(){
      $('.sub_news').toggle();
      return false;
    });

    // 메인 이미지 슬라이드
    $('.slideul').owlCarousel({
       // autoplay:true,
       loop: true,
       nav: true,
       responsive: {
           0: {
               items: 1
           },
           600: {
               items: 1
           },
           1000: {
               items: 1
           }
       }
    });

    // Accommodation & Optional Tour > Optional Tour tab
    $('.tabul > li > a').click(function () {
        $(this).parents('li').siblings().removeClass('on');
        $(this).parents('li').addClass('on');
        var idx = $(this).parents('li').index();
        $('.tabview').removeClass('tab_on');
        $('.tabview').eq(idx).addClass('tab_on');
        return false;
    });


})
