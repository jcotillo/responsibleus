class Coupon < ActiveRecord::Base
  validates :expiration, presence: true
  belongs_to :business
  has_and_belongs_to_many :users

  def self.nearestcoupons(user)
	 nearest = []
	  	if user.business
	 	 all =  Coupon.all.where.not(business_id: user.business_id)
	 	 all.each do |coupon|
	 	 	nearest << coupon if coupon.business.zipcode == user.zipcode
	 	 	return nearest 
	 	 	end
	 	else 
	 		Coupon.all.each do |coupon|
	 	 	nearest << coupon if coupon.business.zipcode == user.zipcode
	 	 	return nearest 
	 		 end
	 	end
  end
end
