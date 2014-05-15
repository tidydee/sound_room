class UsersController < ApplicationController
before_filter :authorize?

  def authorize?
    if current_user
    else
      flash[:error] = "You must be signed to access Dashboard!"
      redirect_to :root
    end
  end

  def index
    @users = User.all
    @room = Room.new
    @rooms = Room.all.sort_by{ |room| room.name}
    @my_rooms = Room.where('user_id = ?',current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @room = Room.new
    @rooms = Room.all.sort_by{ |room| room.name}
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id if current_user

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