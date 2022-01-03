// 신착도서/대출BEST Tab을 각각 선택할 경우 거기에 해당하는 탭과 거기와 연관된 도서목록으로 이동하도록 하는 js
$(document).ready(function(){
    
  $('ul.tabs li').click(function(){
      var tab_id = $(this).attr('data-tab');

      $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');

      $(this).addClass('current');
      $("#"+tab_id).addClass('current');
  })

});
