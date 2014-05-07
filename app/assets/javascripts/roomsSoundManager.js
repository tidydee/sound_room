var currentTrackId = undefined;
var currentPlaying = false;
var sound = undefined;
function playTrack(id) {
  // $('.track').addClass('unselected-songs');
  console.log('sound playing');
    SC.whenStreamingReady(function() {
      if (id === currentTrackId) {
        if (currentPlaying) {
          sound.pause();
        } else {
          sound.play();
        }
        currentPlaying = !currentPlaying;
      } else {
        if (sound) {
          $('p.tracks[data-sc-track-id='+currentTrackId+']').removeClass("selected-song");
          sound.stop();
        }
        currentTrackId = id
        sound = SC.stream(id, { autoPlay: false }, function(sound){
        console.log(sound);
          currentPlaying = true;
          // while (currentPlaying) {
          //   sound.position;
          // }
          sound.play({
            onfinish: function(){
              console.log('track_finished');
              var playingTrackElement = $('p.tracks[data-sc-track-id='+id+']');
              playingTrackElement.addClass("selected-song");
              skipper();
            },
            onplay: function(){
            console.log('inside onplay');
            var playingTrackElement = $('p.tracks[data-sc-track-id='+id+']');
            playingTrackElement.addClass("selected-song");
            console.log(playingTrackElement);
            },
            whileplaying: function() {
              $(".progressBar").css('width', ((this.position/this.duration) * 100) + '%');
            },
          });
        });
      }

      function skipper(){
        sound.stop();
        var nextIndex = window.playlist.indexOf(id) + 1
        var nextTrackId;
        if (nextIndex <= window.playlist.length - 1) {
          nextTrackId = window.playlist[nextIndex];
        }else{
          nextTrackId = window.playlist[0];
        }
        playTrack(nextTrackId);
      }
      $('#skip').click(skipper);

      $('#pause').click(function(e){
          sound.pause();
      });
      $('#play').click(function(e){
          sound.resume();
      });
      $('#mute').click(function(e){
          sound.setVolume(0);
      });
      $('#med-volume').click(function(e){
          sound.setVolume(40);
      });
      $('#high-volume').click(function(e){
          sound.setVolume(100);
      });
    });
  }