class UsersController < ApplicationController


  def index
  	# @gsc = GetSoundCloud.new(3206)
    @users = User.all
    @room = Room.new
    @rooms = Room.all
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



