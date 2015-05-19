class Event < ActiveRecord::Base
	belongs_to :business
	belongs_to :user

	has_many :eventships 

	has_many :attendees, through: :eventships, class_name: 'User', source: :user
	has_one :host, through: :eventships, class_name: 'Business', source: :business

	def self.greensort
		score = 0
		includes(:business).where(private == false).each do |ev|
			if ev.transportationschoice == "Walk" ||  "Bicycle"
				score += 1
			elsif ev.transportationschoice == "Carpool" ||  "Bus" || "Train" || "Bus/Train"
				score += 2
			elsif ev.transportationschoice == "Car" ||  "Airplane"
				score += 3
			else 
				score += 0
			end
		end
	end
end


