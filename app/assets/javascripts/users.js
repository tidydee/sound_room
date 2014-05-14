

  $(document).ready(function() {
    window.playlist = []
    SC.initialize({
    client_id: '173c1924dc4e55b0db3b89a45bb71561'
    });

    function getUserFavoriteTracks() {

      var soundcloud_id_string = $('#scuserid').data('scid');
      console.log('sc id string',soundcloud_id_string);
      var soundcloud_id = parseFloat(soundcloud_id_string);
      console.log('sc id:',soundcloud_id);
      
      // var soundcloud_id =  <%= current_user.soundcloud_user_id %>
      SC.get('/users/'+soundcloud_id+'/favorites', function(favorites) {

        for (var i=0; i<favorites.length; i++) {
          var trackTitle = favorites[i].title;
          var trackId = favorites[i].id;
          var trackUrl = favorites[i].permalink_url;
          var trackStreamUrl = favorites[i].stream_url;
          var trackOrder = i;
          var trackImage = favorites[i].artwork_url;
          var duration = favorites[i].duration;
          window.playlist.push(trackId);
          var min = (((duration)/1000)/60) << 0;
          // DO Check -> If less than 10 it adds a zero to the front of sec
          var sec = parseFloat(((duration)/1000) % 60).toFixed(0);
          
          if(sec < 10)  {
            sec = ('0'+ sec);
          }  
          if (trackImage === null){
            trackImage = 'http://i.imgur.com/0Y3XOyg.jpg';
          } 

          $('#favorite_tracks').append("<div class='tracks' id='"+trackOrder+"' data-sc-track-id="+trackId+" data-track-order="+i+" data-track-url="+trackUrl+"><img class='img-style2' src="+trackImage+"><h1 class='name-style2' >"+trackTitle+"</h1><span class='time-style2'> "+(min+':'+sec)+" min </span></div>");
        }
      });
    }

    $(document).ready(function(){
      $('body').on('click','.tracks', function(e) {
        console.log('this USER click?');
        var scTrackId = $(this).data('sc-track-id');
        playTrack(scTrackId);
      });
    }); 
    getUserFavoriteTracks();
  });
