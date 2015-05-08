class RenameEventshipsTable < ActiveRecord::Migration
  def change
  	rename_table :eventship, :eventships
  end
end
