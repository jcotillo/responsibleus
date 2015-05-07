class HomeController < ApplicationController
before_action :authenticate_user!, only: [:userdash, :businessdash]

	def index
	end

	def userdash
		@event = Event.new
		@count = current_user.transportation_count
	end
	 
	def businessdash
		@coupon = Coupon.new
		@last = Coupon.last(3)
	end

end
