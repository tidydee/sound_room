class AddToSongsTable < ActiveRecord::Migration
  def change
    add_column :songs, :sc_track_id, :integer
  end
end
