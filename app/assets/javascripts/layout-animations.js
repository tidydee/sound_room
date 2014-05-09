$(document).ready(function () {
    $('.curo').transition({
      perspective: '100px',
      rotate3d: '1,1,0,180deg'
    });

    $(document).ready(function() {
      var bodyHeight = $("body").height();
      var vwptHeight = $(window).height();
      if (vwptHeight > bodyHeight) {
        $(".footer").css("position","absolute").css("bottom",0);
      }
    });

    // fadeToggle( $('.gradient.one') );
    fadeToggle( $('.gradient.two') );

    function fadeToggle(el, hide) {
      el.fadeToggle( 30000, null, function() { fadeToggle(el); 
      });
    }

    $('.curo').mouseover(function(){
      debugger;
      $(this).transition({
        perspective: '100px',
        rotateY: '+180deg'
      }); 
    });

    // $('#background').foggy();

// Bring up the playlist

    $('#songs-on-page-tab').click(function(){
      var visiblePlaylist = $("#visible-playlist");
      if (visiblePlaylist.hasClass('visible')){
        visiblePlaylist.animate({"left":"-850px"}, "slow").removeClass('visible');
      } else {
        visiblePlaylist.animate({"left":"0px"}, "fast").addClass('visible');
      }
    });

});

