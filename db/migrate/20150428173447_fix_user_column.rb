class FixUserColumn < ActiveRecord::Migration
  def change
  	rename_column :businesses, :user_id_id, :user_id
  end
end
