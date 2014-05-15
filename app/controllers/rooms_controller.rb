class RoomsController < ApplicationController

  def index
    @room = Room.all.sort_by{ |room| room.name}
  
    if @current_user
      @my_rooms = Room.where('user_id = ?',current_user.id)
    end
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @songs = @room.songs
    @song = Song.new
    
    if current_user
      @my_rooms = Room.where('user_id = ?',current_user.id)
    end
    @rooms = Room.all

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @songs }
    end
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
    @rooms = Room.all
    @my_rooms = Room.where('user_id = ?',current_user.id)

    if @room.save
      flash[:success] = "Room Successfully Created"
      redirect_to @room
    else
      render "users/index"
    end
  end

  protected

  def room_params
    params.require(:room).permit(
      :name, :user_id
    )
  end
end
