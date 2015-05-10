class HomeController < ApplicationController
before_action :authenticate_user!, only: [:userdash, :businessdash]

	def index
	end

	def userdash
		@event = Event.new
		@count = current_user.transportation_count
		@nearby = Business.where(zipcode: current_user.zipcode).last(5)
		@coupons = Coupon.nearestcoupons(current_user)
	end
	 
	def businessdash
		@coupon = Coupon.new
		@last = Coupon.where(business_id: current_user.business_id)
	end

end
