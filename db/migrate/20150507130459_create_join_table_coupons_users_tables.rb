class CreateJoinTableCouponsUsersTables < ActiveRecord::Migration
  def change
  	create_table :coupons_users do |t|
  		t.references :user, index: true
  		t.references :coupon, index: true

  		t.timestamps
  	end
  end
end
