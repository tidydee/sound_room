class RemoveColumnsFromUserTable < ActiveRecord::Migration
  def change
    remove_column(:users, :soundcloud_refresh_token)
    remove_column(:users, :soundcloud_expired_at)
  end
end
