// 의도1: .book-tab > a 태그를 클릭했을 때 다른 Tab으로 넘어가려 이벤트를 걸어주려고 함
$(function(e){
  $('.book-tab li a').on('click', function(e){
      var idx = $('.book-tab li a').index(this);
      e.preventDefault();
      $('.book-slide').hide();
      $('.book-slide').eq(idx).show();
      $(this).closest('li').addClass('on');
      $(this).closest('li').siblings().removeClass('on');
      $('.book-slide'). resize();
      $('.book-slide'). slick('refresh');
    });
  });
