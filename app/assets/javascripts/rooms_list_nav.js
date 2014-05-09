$('.join-room-btn').on("click", function() {
  console.log('JOIN ROOMS BUT!!!');
  event.preventDefault();

  if($('.rooms-list').hasClass("hide-class")){
    $('.rooms-list').removeClass("hide-class");
  }else{
    $('.rooms-list').addClass("hide-class");
  }

});
