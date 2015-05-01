class HomeController < ApplicationController
before_action :authenticate_user!, only: [:userdash, :businessdash]

	def index
	end

	def userdash
		@event = Event.new
	end
	 
	def businessdash
	end

end
