class Rooms::SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    # @room = Room.all
    @song = Song.new(song_params)
    @room.user_id = current_user.id if current_user

    if @song.save
      flash[:success] = "Song Successfully Added!"
      redirect_to :root
      # redirect_to users_path
    else
      flash[:success] = "Something's Fishy - Song Was NOT Added!"
      render "rooms/show"
    end
  end

    # def create
    #   @song = Song.new(params[:song])
     
    #   respond_to do |format|
    #     if @song.save
    #       format.html { redirect_to @song, notice: 'Song was successfully added.' }
    #       format.js   {}
    #       format.json { render json: @song, status: :created, location: @song }
    #     else
    #       format.html { render action: "new" }
    #       format.json { render json: @song.errors, status: :unprocessable_entity }
    #     end
    #   end
  

#   def index
#   end

  protected
  
  def song_params
    params.require(:song).permit(
      :title
    )
  end
end



