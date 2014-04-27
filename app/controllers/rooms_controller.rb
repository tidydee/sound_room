class RoomsController < ApplicationController

  def index
    @rooms = Room.all    
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @songs = @room.songs
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to users_path 
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to users_path, notice: "#{@room.name} was submitted successfully!"
    else
      render :new
    end
  end

  protected

  def room_params
    params.require(:room).permit(
      :name
    )
  end



end
