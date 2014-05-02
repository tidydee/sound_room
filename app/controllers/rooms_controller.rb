class RoomsController < ApplicationController

  def index
    @room = Room.all.sort_by{ |room| room.name}
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @songs = @room.songs
    @song = Song.new

    # @room = Room.all
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to users_path 
  end

  def create
    @room = Room.all
    @room = Room.new(room_params)
    @room.user_id = current_user.id if current_user

    if @room.save
      flash[:success] = "Room Successfully Created"
      redirect_to @room
      # redirect_to users_path
    else
      render "users/show"
    end
  end

  protected

  def room_params
    params.require(:room).permit(
      :name, :user_id
    )
  end
  
  # def song_params
  #   params.require(:song).permit(
  #     :room_id, :id
  #   )
  # end



end
