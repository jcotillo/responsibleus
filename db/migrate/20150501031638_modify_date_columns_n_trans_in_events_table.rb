class ModifyDateColumnsNTransInEventsTable < ActiveRecord::Migration
  def change
  	add_column :events, :transportationschoice, :text
  	rename_column :events, :starts_at, :start
  	rename_column :events, :ends_at, :end
  end
end
