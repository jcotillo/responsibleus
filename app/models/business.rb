class Business < ActiveRecord::Base
  has_many :customerships
  has_many :customers, through: :customerships, class_name: 'User', source: :user
  has_one :owner, class_name: 'User'
end
