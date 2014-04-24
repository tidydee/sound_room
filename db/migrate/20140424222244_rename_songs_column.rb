class RenameSongsColumn < ActiveRecord::Migration
  def change
    rename_column :songs, :sc_track_id, :soundcloud_track_id
  end
end
