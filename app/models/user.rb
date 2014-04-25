class User < ActiveRecord::Base
    has_many :songs

  class << self
    def authenticate_via_soundcloud(auth)

      puts "~~~~~~~~~~~~~~~~#{auth}~~~~~~~~~~~~~~~~~~~~"

      where(soundcloud_user_id: auth["uid"]).first_or_create(soundcloud_user_id: auth["uid"])
    end

    private

    def attributes_from_oauth(auth)
      {
        soundcloud_access_token: auth["credentials"]["token"],
        soundcloud_username: auth["info"]["name"],
        soundcloud_user_id: auth["info"]["uid"],
      }
    end
  end

end
