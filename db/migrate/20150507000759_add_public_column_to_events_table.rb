class AddPublicColumnToEventsTable < ActiveRecord::Migration
  def change
    add_column :events, :private, :boolean
  end
end
