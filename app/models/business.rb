class Business < ActiveRecord::Base
  validates :name, presence: true
  validates :zipcode, presence: true

  has_many :customerships
  has_many :customers, through: :customerships, class_name: 'User', source: :user
  has_one :owner, class_name: 'User'

  # business as a host
  has_many :eventships
  has_many :events, through: :eventships

  has_many :coupons
  has_many :greenpoints
end
