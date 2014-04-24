class UsersController < ApplicationController


  def index
  	# @gsc = GetSoundCloud.new(3206)
    @users = User.all
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



