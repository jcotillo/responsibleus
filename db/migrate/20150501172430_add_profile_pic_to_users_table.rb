class AddProfilePicToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :profilepic, :string
  end
end
