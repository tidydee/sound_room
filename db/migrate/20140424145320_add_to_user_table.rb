class AddToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :sc_user_id, :integer
    add_column :users, :sc_username, :string
  end
end
