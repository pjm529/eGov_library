// nav에 mouse over할 경우 sub-menu가 내려오도록 명령하는 js
$(document).ready(function(){
    $('.gnb-ul > li').mouseenter(function(){
      // $(this).siblings().find('.sub_menu').hide();
      $('.sub-menu').show();
      $('.hover_bg').show();
    });
    $('.gnb-ul').mouseleave(function(){
      $('.gnb-li > a > span').removeClass("active");
      $('.sub-menu').hide();
      $('.hover_bg').hide();
    });
});


// nav에 mouse over할 경우 menu 배경에 색이 생기거나 sub-menu 밑에 줄이 그어지도록 명령하는 js
$(document).ready(function(){
  $('.gnb-li').mouseenter(function(){
      $('.gnb-li > a > span').removeClass("active");
      $(this).children("a.Depth").find("span").addClass("active");
  });

  $('.sub-menu > li > a').mouseenter(function(){
      $('.sub-menu > li > a').removeClass("sub-active");
      $('.gnb-li > a > span').removeClass("active");
      var $a =$(this).parents("li.gnb-li").children("a.Depth").find("span");
      $(this).addClass("sub-active");
      $a.addClass("active");
  });
});