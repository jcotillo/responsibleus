class Event < ActiveRecord::Base
	belongs_to :business
	belongs_to :user

	has_many :eventships 
	has_many :attendees, through: :eventships, class_name: 'User', source: :user
	has_one :host, through: :eventships, class_name: 'Business', source: :business
end
