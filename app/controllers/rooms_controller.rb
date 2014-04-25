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

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to rooms_path, notice: "#{@room.name} was submitted successfully!"
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
