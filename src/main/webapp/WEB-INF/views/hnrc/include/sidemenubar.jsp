
<style>
  .side-quick-box {
    right: 10px;
    top: 400px;
    z-index: 999;

    border-radius: 5px;

    background: white;
    border: solid 1px grey;

    height: auto;
    padding: 5px;
  }
  .quickMenuBar {
    border: none; border-collapse : collapse; text-align: center; width: 70px;
  }
  .quickMenuBar td{
    border-bottom: solid 1px grey;
  }

  .side-quick-menu {
    padding: 5px;
    border-bottom: solid 1px grey;
  }
  .quickMenuBar .side-quick-menu:last-of-type {
    border-bottom: 0;
  }
  .side-quick-menu div {
    font-size: 0.9rem;
    padding-top: 5px;
    line-height: 1;
  }

  .side-quick-menu:hover div{
    color: var(--main-color);
  }
  .side-quick-menu:hover {
    background-image : url("${resourcesMedia}/site/fiber/main/fiber+bg.svg") ;
    background-repeat: no-repeat;
    background-size: contain;
  }

  @keyframes sidemenubarhide {
    from {
      right: 0px;
    }
    to {
      right: -100px;
    }
  }

  @keyframes sidemenubarshow {
    from {
      right: -80px;
    }
    to {
      right: 0px;
    }
  }
  
  @media (max-width: 1049px) {
    #Quick {
      position: relative;
      animation-name: sidemenubarhide;
      animation-duration: 4s;
      animation-fill-mode: forwards;
    }
  }

  @media (min-width: 1049px) {
    #Quick {
      position: relative;
      animation-name: sidemenubarshow;
      animation-duration: 4s;
      animation-fill-mode: forwards;
    }
  }

  .i {
    font-size: 28px;
  }
</style>

<script>
  $(document).ready(function(){
    $(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
      var position = $(window).scrollTop()+300; // 현재 스크롤바의 위치값을 반환
      $("#Quick").stop().animate({top:position+"px"}, 700); //해당 오브젝트 위치값 재설정
    });
  });
</script>

<div id="Quick" class="side-quick-box" style="position: absolute; ">
  <div class="quickMenuBar">
    <a class="side-quick-menu">
      <img src="${resourcesMedia}/site/fiber/main/side-quick1.png">
      <div>전자결제</div>
    </a>
    <a class="side-quick-menu">
      <img src="${resourcesMedia}/site/fiber/main/side-quick2.png">
      <div>학술대회</div>
    </a>
    <a class="side-quick-menu">
      <img src="${resourcesMedia}/site/fiber/main/side-quick3.png">
      <div>한국섬유공학회지</div>
    </a>
    <a class="side-quick-menu">
      <img src="${resourcesMedia}/site/fiber/main/side-quick4.png">
      <div>섬유기술과 산업</div>
    </a>
    <a class="side-quick-menu">
      <img src="${resourcesMedia}/site/fiber/main/side-quick6.png">
      <div>Fibers and Polymers</div>
    </a>
  </div>
</div>
