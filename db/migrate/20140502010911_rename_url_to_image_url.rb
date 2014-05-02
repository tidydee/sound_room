class RenameUrlToImageUrl < ActiveRecord::Migration
  def change
    rename_column :songs, :url, :image_url
  end
end
