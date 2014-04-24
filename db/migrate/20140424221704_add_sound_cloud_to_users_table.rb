class AddSoundCloudToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :soundcloud_refresh_token, :string
    add_column :users, :soundcloud_expired_at, :datetime
    rename_column :users, :token, :soundcloud_access_token
    rename_column :users, :sc_user_id, :soundcloud_user_id
    rename_column :users, :sc_username, :soundcloud_username
  end
end
