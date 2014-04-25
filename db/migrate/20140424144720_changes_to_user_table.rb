class ChangesToUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :users, :password
    remove_column :users, :username
  end
end
