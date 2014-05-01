class SongsController < ApplicationController

  # def index
  #   @song = Song.all
  # end

  # def create
  #   # @room = Room.all
  #   @song = Song.new(song_params)
  #   @song.user_id = current_user.id if current_user


  #   if @song.save
  #     flash[:success] = "Song Successfully Added!"
  #     redirect_to :root
  #     # redirect_to users_path
  #   else
  #     flash[:success] = "Something's Fishy - Song Was NOT Added!"
  #     render "rooms/show"
  #   end
  # end

  

  def create
    @song = Song.new({ soundcloud_track_id: params[:soundcloud_track_id] })
    # binding.pry
    # # @room.user_id = current_user.id if current_user
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: "Save process completed!" }
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


