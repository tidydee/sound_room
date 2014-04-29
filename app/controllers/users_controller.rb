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
  	# @gsc = GetSoundCloud.new(3206)
    @users = User.all
    @room = Room.new
    @rooms = Room.all.sort_by{ |room| room.name}
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

# class GetSoundCloud

# 	require 'soundcloud'

# 	def initialize(user_id)
# 		user_id_string = user_id.to_s
# 		@client = Soundcloud.new(:client_id => '173c1924dc4e55b0db3b89a45bb71561')
# 		@all_user_tracks = @client.get('/users/'+user_id_string+'/favorites')
# 	end

# 	def fetch_songs
# 		@all_user_tracks
# 	end

# end



