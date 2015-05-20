class Greenpoint < ActiveRecord::Base
	belongs_to :business
 def self.total
 	electricity + transportation + recycling
 end
end
