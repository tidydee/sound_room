class AddRoomIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :room_id, :integer
  end
end
