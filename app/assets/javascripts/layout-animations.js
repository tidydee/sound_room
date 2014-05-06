$(document).ready(function () {
    $('.curo').transition({
      perspective: '100px',
      rotate3d: '1,1,0,180deg'
    });

    // fadeToggle( $('.gradient.one') );
    fadeToggle( $('.gradient.two') );

    function fadeToggle(el, hide) {
      el.fadeToggle( 30000, null, function() { fadeToggle(el); 
      });
    }

    $('.curo').mouseover(function(){
      $(this).transition({
        perspective: '100px',
        rotateY: '180deg'
      }); 
    });

    $('.top').foggy();

// Bring up the playlist

    $('#songs-on-page-tab').click(function(){
      var hidden = $("#hidden");
      if (hidden.hasClass('visible')){
        hidden.animate({"left":"-750px"}, "slow").removeClass('visible');
      } else {
        hidden.animate({"left":"75px"}, "slow").addClass('visible');
      }
    });

});

