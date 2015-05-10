class AddBusinessIdToEventshipsTable < ActiveRecord::Migration
  def change
  	add_column :eventships, :business_id, :integer, index: true
  end
end
