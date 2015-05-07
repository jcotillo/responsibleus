class AddExpirationColmToCouponsTable < ActiveRecord::Migration
  def change
  	add_column :coupons, :expiration, :datetime
  	rename_column :businesses, :address, :zipcode
  	rename_column :users, :neighborhood, :zipcode
  end
end
