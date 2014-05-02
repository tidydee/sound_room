class SongsController < ApplicationController

  def index
    @songs = Song.all
    @song = Song.new
  end

  def create
    # @song = Song.new(params[:song])
    @song = Song.new({ soundcloud_track_id: params[:soundcloud_track_id] })
    # binding.pry
    # @room.user_id = current_user.id if current_user
    respond_to do |format|
      if @song.save
        # format.html { redirect_to :root, notice: "Save process completed!" }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { 
          flash.now[:notice]="Save proccess coudn't be completed!" 
          render :new 
        }
        format.json { render json: @song.errors, status: :unprocessable_entity}
      end
    end
  end

  protected

  def song_params
    params.require(:song).permit(
     :title, :artist, :duration, :url, :room_id, :trackId
      )
  end

end


