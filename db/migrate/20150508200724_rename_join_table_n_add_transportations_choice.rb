class RenameJoinTableNAddTransportationsChoice < ActiveRecord::Migration
  def change
  	rename_table :events_users, :eventship
  	add_column :eventship, :transportationschoice, :text
  end
end
