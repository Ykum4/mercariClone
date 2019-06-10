$(document).on('turbolinks:load', function(){
  // マイページのサイドバーをhoverすると色が変わる
  $('.mypage-nav__list li').on({
    'mouseenter': function(){
      $(this).find('a').css('background', '#f5f5f5');
    },
    'mouseleave': function(){
      $(this).find('a').css('background', '#fff');
    } 
  })
});