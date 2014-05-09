$('.join-room-btn').on("click", function() {
  console.log('JOIN ROOMS BUT!!!');

  if($('.rooms-list-nav').hasClass("hide-class")){
    $('.rooms-list-nav').removeClass("hide-class");
  }else{
    $('.rooms-list-nav').addClass("hide-class");
  }

});


