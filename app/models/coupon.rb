class Coupon < ActiveRecord::Base
  belongs_to :business
  has_and_belongs_to_many :users
end
