class Business < ActiveRecord::Base
has_many :users, through: :customerships
end
