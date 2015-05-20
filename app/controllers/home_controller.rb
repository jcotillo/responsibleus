class HomeController < ApplicationController
before_action :authenticate_user!, only: [:userdash, :businessdash]

	def index
	end

	def userdash
		@event = Event.new
		@count = current_user.transportation_count 
		@nearby = Business.where(zipcode: current_user.zipcode).last(5)
		@all = current_user.events.all.length
		@greenevents = current_user.green
		@blueevents = current_user.blue
		@redevents = current_user.red
		if current_user.business
			@coupons = Coupon.where.not(business_id: current_user.business.id).last(@count) 
		else 
			@coupons = Coupon.last(@count) 
		end
	end
	 
	def businessdash
		@coupon = Coupon.new
		@events = current_user.business.eventships
		@last = Coupon.where(business_id: current_user.business_id)
		@points = current_user.business.greenpoints.last
	end

end
