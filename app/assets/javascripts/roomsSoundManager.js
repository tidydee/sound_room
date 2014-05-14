var currentTrackId = undefined;
var currentPlaying = false;
var sound = undefined;

function playTrack(id) {
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
        $('.tracks[data-sc-track-id='+currentTrackId+']').removeClass("selected-song");
        sound.stop();
      }
      currentTrackId = id;
      handleSound();  
    }
  })
} 

function handleSound(){
  console.log("handleSound");
  sound = SC.stream(currentTrackId, { autoPlay: false }, function(sound){
    console.log(sound);
    currentPlaying = true;

    var trueDuration = undefined;
    $(".progressBar").css('width', (0) + '%');
    sound.play({
      onfinish: function(){
        console.log('track_finished');
        var playingTrackElement = $('.tracks[data-sc-track-id='+currentTrackId+']');
        playingTrackElement.addClass("selected-song");
        skipper(sound);
      },
      onplay: function(){
        console.log('inside onplay');
        var playingTrackElement = $('.tracks[data-sc-track-id='+currentTrackId+']');
        playingTrackElement.addClass("selected-song");
        console.log(playingTrackElement);
      },
      whileplaying: function() {
        if (this.duration === trueDuration) {
          $(".progressBar").css('width', ((this.position/this.duration) * 100) + '%');
        }
        else {
          trueDuration = this.duration
        }
      }
    });
  });
}

function skipper(){
  sound.stop();
  var nextIndex = window.playlist.indexOf(currentTrackId) + 1
  var nextTrackId;
console.log('INSIDE WINDOW.PLAYLIST: ',window.playlist);
  if (nextIndex <= window.playlist.length - 1) {
console.log('INSIDE SKIPPER!');
    nextTrackId = window.playlist[nextIndex];
  } else {
    nextTrackId = window.playlist[0];
  }
  playTrack(nextTrackId);
}

$('#skip').click(skipper);

$('#pause').click(function(e){
    console.log("button-pause");
    sound.pause();
});

$('#play').click(function(e){
    console.log("button-play");
    sound.resume();
});

$('#mute').click(function(e){
    console.log("button-mute");
    sound.setVolume(0);
});

$('#med-volume').click(function(e){
    console.log("button-med");
    sound.setVolume(40);
});

$('#high-volume').click(function(e){
    console.log("button-high");
    sound.setVolume(100);
});
