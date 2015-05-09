class Business < ActiveRecord::Base
  validates :name, presence: true
  validates :zipcode, presence: true
  has_many :customerships
  has_many :customers, through: :customerships, class_name: 'User', source: :user
  has_one :owner, class_name: 'User'

  #a business can host many events which can have many attendees 
  has_many :events
  has_many :attendees, through: :eventships, class_name: 'User', source: :user

  has_many :coupons
end
