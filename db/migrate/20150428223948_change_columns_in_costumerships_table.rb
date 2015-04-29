class ChangeColumnsInCostumershipsTable < ActiveRecord::Migration
  def change
  	change_column :customerships, :business_id,  :integer
  	change_column :customerships, :user_id, :integer
  end
end
