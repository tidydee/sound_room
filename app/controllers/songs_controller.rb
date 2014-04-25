class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def create
    @song = Song.new(song_params)
    @song.user = current_user
    if @song.save
      redirect_to room_path(@song.room)
    else
      redirect_to room_path(params[:room_id]), notice: "#{@song.title} was NOT submitted successfully!"
    end
  end

  protected

  def song_params
    params.require(:song).permit(
     :title, :artist, :duration, :url, :room_id
      )
  end

end


