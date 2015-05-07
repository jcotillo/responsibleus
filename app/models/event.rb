class Event < ActiveRecord::Base
	belongs_to :business
	belongs_to :user
	def self.transporation_count
		all = current_user.events
		total = current_user.events.length
		footprint = 0 
		all.each do |e|	
			if e.transporationschoice == "car" 
				footprint +=1 
			elsif e.transporationschoice == "bike" 
				footprint +=0.3
			else
				footprint +=0.5
			end
		end
		return footprint 
	end
end
