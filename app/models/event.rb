class Event < ActiveRecord::Base
	belongs_to :business
	has_many :eventships 
	has_many :users, through: :eventships
end
