class HomeController < ApplicationController
before_action :authenticate_user!, only: :userdash
	def index
	end

	def userdash
	end
	
end
