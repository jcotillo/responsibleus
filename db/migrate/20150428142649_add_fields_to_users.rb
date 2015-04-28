class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :text
    add_column :users, :age, :integer
    add_column :users, :neighborhood, :text
    add_column :users, :transportation, :text
  end
end
